class AddProfileImageToRoomUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :room_users, :profile_image, :string
  end
end
