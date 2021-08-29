class AddOriginalTwatIdToTwat < ActiveRecord::Migration[6.1]
  def change
    add_column :twats, :original_twat_id, :integer, default: ''
  end
end
