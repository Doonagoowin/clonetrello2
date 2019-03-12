class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.string :body
      t.belongs_to :card, foreign_key: true

      t.timestamps
    end
  end
end
