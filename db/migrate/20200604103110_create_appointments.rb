class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.belongs_to :user
      t.belongs_to :doctor_schedule

      t.timestamps
    end

    add_index :appointments, [:doctor_schedule_id, :user_id], unique: true
  end
end
