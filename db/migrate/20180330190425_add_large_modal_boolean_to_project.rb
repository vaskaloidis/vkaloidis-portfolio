class AddLargeModalBooleanToProject < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :large_modal, :boolean, :default => false
  end
end
