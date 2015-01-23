class AddBrainToZombie < ActiveRecord::Migration
  def change
    add_column :zombies, :brain, :integer
  end
end
