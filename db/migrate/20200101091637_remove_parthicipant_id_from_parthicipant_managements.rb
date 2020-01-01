class RemoveParthicipantIdFromParthicipantManagements < ActiveRecord::Migration[5.2]
  def change
    remove_column :parthicipant_managements, :parthicipant_id, :integer
  end
end
