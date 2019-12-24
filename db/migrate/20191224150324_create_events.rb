class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.string :image
      t.integer :o_id
      t.datetime :e_date, null: false

      # t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
