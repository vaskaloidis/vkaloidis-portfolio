class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.text :name
      t.text :categories
      t.integer :order
      t.boolean :displayed
      t.datetime :modified

      t.timestamps
    end
  end
end
