class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
    add_column :messages, :images, :json
  end
end
