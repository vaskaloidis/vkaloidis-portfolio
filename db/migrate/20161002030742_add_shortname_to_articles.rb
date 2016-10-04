class AddShortnameToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :shortname, :string
  end
end
