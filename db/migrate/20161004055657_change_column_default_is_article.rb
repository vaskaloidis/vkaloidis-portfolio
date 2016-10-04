class ChangeColumnDefaultIsArticle < ActiveRecord::Migration[5.0]
  def change
    change_column_default :projects, :isArticle, from: true, to: false
  end
end
