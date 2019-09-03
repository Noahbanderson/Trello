class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :task_name
      t.string :description
      t.integer :t_o_number
      t.belongs_to :list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
