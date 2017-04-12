class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.text :location
      t.integer :manager_id, index: true

      t.timestamps
    end
  end
end
