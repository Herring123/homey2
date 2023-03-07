class CreateHomeys < ActiveRecord::Migration[5.2]
  def change
    create_table :homeys do |t|
      t.string :name
      t.integer :status, default: 0
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
