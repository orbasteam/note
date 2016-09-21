class AddTitleUserIdIndex < ActiveRecord::Migration[5.0]
  def change
    add_index :titles, :user_id
  end
end
