class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.belongs_to :user, null: false, foreign_key: { on_delete: :cascade }
      t.belongs_to :twat, null: false, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end
