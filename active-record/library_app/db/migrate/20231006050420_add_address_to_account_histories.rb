class AddAddressToAccountHistories < ActiveRecord::Migration[7.0]
  def change
    add_column :account_histories, :description, :string
    add_column :account_histories, :amount, :string
  end
end
