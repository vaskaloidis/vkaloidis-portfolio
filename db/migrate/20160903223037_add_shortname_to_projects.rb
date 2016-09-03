class AddShortnameToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :shortname, :string
  end
end
