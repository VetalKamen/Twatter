class AddUserIdToTwats < ActiveRecord::Migration[6.1]
  def change
    add_column :twats, :user_id, :integer
  end
end
