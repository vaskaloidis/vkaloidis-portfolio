class AddAttachmentImgToProjects < ActiveRecord::Migration
  def self.up
    change_table :projects do |t|
      t.attachment :img
    end
  end

  def self.down
    remove_attachment :projects, :img
  end
end
