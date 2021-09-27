class AddProfileImageToReaction < ActiveRecord::Migration[6.1]
  def change
    add_column :reactions, :profile_image, :string
  end
end
