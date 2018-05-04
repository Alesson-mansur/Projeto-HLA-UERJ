class AddAttachmentImageToReagents < ActiveRecord::Migration[5.1]
  def self.up
    change_table :reagents do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :reagents, :image
  end
end
