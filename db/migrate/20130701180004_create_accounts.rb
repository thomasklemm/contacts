class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.belongs_to :user, index: true
      t.text :provider
      t.text :uid
      t.text :name
      t.text :oauth_token
      t.datetime :oauth_expires_at

      t.timestamps
    end

    add_index :accounts, [:provider, :uid]
  end
end
