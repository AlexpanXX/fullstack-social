class CreateEvaluations < ActiveRecord::Migration[5.0]
  def change
    create_table :evaluations do |t|
      t.belongs_to :valuer
      t.belongs_to :receiver
      t.text :message
      t.integer :type_id

      t.timestamps
    end
  end
end
