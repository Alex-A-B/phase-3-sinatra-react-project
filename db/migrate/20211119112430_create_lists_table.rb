class CreateListsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :lists do |t|
      t.string :list_name
      t.timestamps
    end
  end
end
