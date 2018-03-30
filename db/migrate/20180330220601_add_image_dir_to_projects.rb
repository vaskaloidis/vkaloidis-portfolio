class AddImageDirToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :image_dir, :string, defalt: ''
  end
end
