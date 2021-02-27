class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.boolean :private, default: false
      t.references :user

      t.timestamps
    end
  end
end
