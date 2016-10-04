class AddIsArticleToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :isArticle, :boolean
  end
end
