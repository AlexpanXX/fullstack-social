class CreateInvitations < ActiveRecord::Migration[5.0]
  def change
    create_table :invitations do |t|
      t.belongs_to :inviter
      t.belongs_to :invited
      t.text :message
      t.integer :state

      t.timestamps
    end
  end
end
