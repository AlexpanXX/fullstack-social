class CreateEvaluations < ActiveRecord::Migration[5.0]
  def change
    create_table :evaluations do |t|
      t.integer :valuer_id
      t.integer :receiver_id
      t.text :message
      t.integer :type

      t.timestamps
    end
  end
end
