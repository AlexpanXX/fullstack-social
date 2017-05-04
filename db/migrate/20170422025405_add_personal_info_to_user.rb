class AddPersonalInfoToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :avatar, :string
    add_column :users, :nickname, :string, unique: true
    add_column :users, :gender, :string
    add_column :users, :wechat, :string
    add_column :users, :github, :string
    add_column :users, :logdown, :string
    add_column :users, :role, :string
    add_column :users, :is_admin, :boolean, default: false
  end
end
