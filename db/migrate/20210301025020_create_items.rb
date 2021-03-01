class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.references :room
      t.string :name

      t.timestamps
    end
  end
end
