class AddPositionToTitle < ActiveRecord::Migration[5.0]
  def change
    add_column :titles, :position, :integer
  end
end
