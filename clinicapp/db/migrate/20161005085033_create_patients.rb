class CreatePatients < ActiveRecord::Migration[5.0]
  def change
    create_table :patients do |t|
      t.string :user_id
      t.string :name
      t.string :allergy

      t.timestamps
    end
  end
end
