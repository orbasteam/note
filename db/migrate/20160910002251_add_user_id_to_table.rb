class AddUserIdToTable < ActiveRecord::Migration[5.0]
  def change

    add_column :titles, :user_id, :integer
    add_column :contents, :user_id, :integer

  end
end
