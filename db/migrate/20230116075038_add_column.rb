class AddColumn < ActiveRecord::Migration[7.0]
  def change
    add_column :posts ,:author_user, :string 
  end
end
