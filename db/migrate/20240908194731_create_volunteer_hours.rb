class CreateVolunteerHours < ActiveRecord::Migration[7.0]
  def change
    create_table :volunteer_hours do |t|
      t.integer :user_id
      t.integer :event_id
      t.integer :hours
      t.datetime :date

      t.timestamps
    end
  end
end
