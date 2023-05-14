class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|

      t.string :title, null: false
      t.integer :place_id, null: false
      t.string :hotel, null: false
      t.string :room, null: false
      t.date :check_in, null: false
      t.date :check_out, null: false
      t.text :text, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
