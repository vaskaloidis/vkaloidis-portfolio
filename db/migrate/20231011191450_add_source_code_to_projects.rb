class AddSourceCodeToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :source_code, :boolean, :default => false
  end
end
