class AddStickyToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :sticky, :boolean
  end
end
