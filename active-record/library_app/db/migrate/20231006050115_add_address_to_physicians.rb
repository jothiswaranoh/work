class AddAddressToPhysicians < ActiveRecord::Migration[7.0]
  def change
    add_column :physicians, :specialty, :string
  end
end
