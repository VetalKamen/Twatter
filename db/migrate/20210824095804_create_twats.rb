class CreateTwats < ActiveRecord::Migration[6.1]
  def change
    create_table :twats do |t|
      t.text :twat

      t.timestamps
    end
  end
end
