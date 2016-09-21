class CreateContents < ActiveRecord::Migration[5.0]
  def change
    create_table :contents do |t|

      t.text :content
      t.string :subject
      t.belongs_to :title

      t.timestamps
    end
  end
end
