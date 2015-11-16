class AddAttachmentImageToIdeas < ActiveRecord::Migration
  def change
    add_attachment :ideas, :image
  end
end
