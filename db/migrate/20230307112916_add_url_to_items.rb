class AddUrlToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :URL, :text
    add_index :items, :URL
  end
end
