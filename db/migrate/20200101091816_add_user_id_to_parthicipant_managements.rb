# frozen_string_literal: true

class AddUserIdToParthicipantManagements < ActiveRecord::Migration[5.2]
  def change
    add_column :parthicipant_managements, :user_id, :integer
  end
end
