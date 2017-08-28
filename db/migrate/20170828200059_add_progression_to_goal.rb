class AddProgressionToGoal < ActiveRecord::Migration[5.1]
  def change
    add_column :goals, :progress, :integer
  end
end
