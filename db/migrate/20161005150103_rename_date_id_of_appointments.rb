class RenameDateIdOfAppointments < ActiveRecord::Migration[5.0]
  def up
    rename_column :appointments, :date_id, :day_id
  end

  def down
    rename_column :appointments, :day_id, :date_id
  end
end
