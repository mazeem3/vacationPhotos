class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :location
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
