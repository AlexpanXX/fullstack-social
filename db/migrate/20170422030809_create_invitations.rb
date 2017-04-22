class CreateInvitations < ActiveRecord::Migration[5.0]
  def change
    create_table :invitations do |t|
      t.integer :inviter_id
      t.integer :invited_id
      t.text :message
      t.text :reply
      t.integer :state

      t.timestamps
    end
  end
end
