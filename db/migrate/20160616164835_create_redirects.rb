class CreateRedirects < ActiveRecord::Migration
  def change
    create_table :redirects do |t|
      t.string :original_url
    end
  end
end
