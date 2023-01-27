class RemoveUserFromLikes < ActiveRecord::Migration[7.0]
  def change
    remove_column :likes, :user, :string
  end
end
