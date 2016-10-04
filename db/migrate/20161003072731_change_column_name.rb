class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :articles, :contet, :content
  end
end
