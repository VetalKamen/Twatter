class CreateTwats < ActiveRecord::Migration[6.1]
  def change
    create_table :twats do |t|
      t.text :twat, :limit => 140

      t.timestamps
    end
  end
end
