class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.string :type
      t.integer :group_id

      t.timestamps
    end
  end
end
