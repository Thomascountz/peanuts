class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.integer :attendee_id
      t.integer :event_time_id

      t.timestamps
    end
  end
end
