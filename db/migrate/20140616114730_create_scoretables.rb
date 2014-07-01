class CreateScoretables < ActiveRecord::Migration
  def change
    create_table :scoretables do |t|
      t.string :name
      t.integer :score

      t.timestamps
    end
  end
end
