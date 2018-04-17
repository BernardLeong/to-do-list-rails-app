class CreateTodos < ActiveRecord::Migration[5.1]
  def change
    create_table :todos do |t|
      t.string :to_dos , null: false
      t.text :comments , null: false 
      t.timestamps
    end
  end
end
