class CreateDoctorSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :doctor_schedules do |t|
      t.belongs_to :doctor
      t.datetime :from,   null: false
      t.datetime :until,  null: false

      t.timestamps
    end

    add_index :doctor_schedules, [:doctor_id, :from, :until], unique: true
  end
end
