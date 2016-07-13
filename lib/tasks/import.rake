require 'action_view'

namespace :import do
desc 'Import Worpress XML Data'

  task users: :environment do |_, _args|
    File.open('lib/ck_import.xml') do |file|
      users = Nokogiri::XML(file).xpath('//channel//wp:author')
      users.each do |user|
        user = CamaleonCms::User.create(
          username: user.at_xpath('wp:author_login').text,
          role: "contributor",
          email: user.at_xpath('wp:author_email').text,
          slug: user.at_xpath('wp:author_login').text,
          password: "ChangeMe!",
          site_id: -1,
          is_valid_email: true,
          first_name: user.at_xpath('wp:author_first_name').text.capitalize,
          last_name: user.at_xpath('wp:author_last_name').text.capitalize
        )
        puts "#{user[:username]} | #{user[:first_name]} created."
      end
    end
  end

  task blog: :environment do |_, _args|
    post_type = CamaleonCms::Site.first.post_types.first
    CamaleonCms::PostDefault.transaction do
      CamaleonCms::PostDefault.destroy_all
      File.open('lib/ck_import.xml') do |file|
        items = Nokogiri::XML(file).xpath('//channel//item')
        items.each do |item|
          user = CamaleonCms::User.find_by_first_name(item.at_xpath('dc:creator').text.capitalize)
          if user.nil?
            user = CamaleonCms::User.find_by_first_name("Ck")
          end

          status = item.at_xpath('wp:status').text
          status = "published" if status == "publish" # A difference between WP and Camaleon statuses.

          post = post_type.posts.create(
              title: item.at_xpath('title').text.strip,
              slug: item.at_xpath('wp:post_name').text,
              content: item.at_xpath('content:encoded').text,
              content_filtered: item.at_xpath('content:encoded').text.strip_tags,
              status: status,
              published_at: item.at_xpath('pubDate').text.to_datetime,
              post_parent: nil,
              visibility: "public",
              visibility_value: nil,
              post_class: "Post",
              created_at: item.at_xpath('wp:post_date').text.to_datetime,
              updated_at: item.at_xpath('wp:post_date').text.to_datetime,
              user_id: user.id,
              post_order: item.at_xpath('wp:menu_order').text.to_i,
              taxonomy_id: 2,
              is_feature: false)

              unless item.at_xpath('category').text.blank?
                post_type.categories.create({ name: item.at_xpath('category').text })
                post.categories << CamaleonCms::Category.last
              end

          puts "#{post[:title]} : #{post[:published_at]}."
        end
      end
    end
  end
end



