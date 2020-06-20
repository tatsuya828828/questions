class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :quest
      t.text :answer
      t.integer :rate,				default: 0;
      t.integer :undisplay_switch,	default: 0;

      t.timestamps
    end
  end
end
