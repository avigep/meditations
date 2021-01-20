class CreateThoughts < ActiveRecord::Migration[6.0]
  def change
    create_table :thoughts do |t|
      t.string :title
      t.text :contents
      t.date :publish_date
      t.integer :read_time

      t.timestamps
    end
  end
end
