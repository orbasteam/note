class AddContentUserIdIndex < ActiveRecord::Migration[5.0]
  def change
    add_index :contents, :user_id
  end
end
