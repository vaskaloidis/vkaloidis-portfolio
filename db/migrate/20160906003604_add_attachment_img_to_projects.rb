class AddAttachmentImgToProjects < ActiveRecord::Migration
# add_attachment :users, :avatar
  def self.up
    change_table :projects do |t|
      t.attachment :img
    end
  end

  def self.down
    remove_attachment :projects, :img
  end
end
