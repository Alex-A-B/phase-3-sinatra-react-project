class CreateItemsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :item_name
      t.string :item_description
      t.boolean :is_complete
      t.integer :list_id
      t.timestamps
    end
  end
end
