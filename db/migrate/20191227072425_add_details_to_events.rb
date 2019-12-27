class AddDetailsToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :e_date_start, :datetime
    add_column :events, :e_date_end, :datetime
    add_column :events, :address, :string
  end
end
