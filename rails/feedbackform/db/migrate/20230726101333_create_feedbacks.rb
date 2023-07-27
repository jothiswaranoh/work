class CreateFeedbacks < ActiveRecord::Migration[7.0]
  def change
    create_table :feedbacks do |t|
      t.string :name
      t.text :place
      t.integer :age

      t.timestamps
    end
  end
end
