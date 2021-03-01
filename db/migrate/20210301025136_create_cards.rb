class CreateCards < ActiveRecord::Migration[6.1]
  def change
    create_table :cards do |t|
      t.references :item
      t.references :user
      t.integer :point
      t.integer :status

      t.timestamps
    end
  end
end
