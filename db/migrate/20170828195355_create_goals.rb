class CreateGoals < ActiveRecord::Migration[5.1]
  def change
    create_table :goals do |t|
      t.integer :user_id
      t.string :goal_body
      t.string :private_or_public
      t.timestamps
    end
  end
end
