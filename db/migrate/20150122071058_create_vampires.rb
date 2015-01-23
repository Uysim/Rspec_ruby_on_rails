class CreateVampires < ActiveRecord::Migration
  def change
    create_table :vampires do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
