class CreateLists < ActiveRecord::Migration[6.0]
  def change
    create_table :lists do |t|
      t.string :list_title
      t.integer :l_o_number
      t.belongs_to :board, null: false, foreign_key: true

      t.timestamps
    end
  end
end
