class CreateHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :histories do |t|
      t.string :quest
      t.text :answer
      t.integer :collect_status, default: 0
      t.references :play

      t.timestamps
    end
  end
end
