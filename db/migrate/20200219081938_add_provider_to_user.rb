# frozen_string_literal: true

class AddProviderToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_index :users,  %i[uid provider], unique: true
  end
end
