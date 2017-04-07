class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.string :title
      t.references :user, foreign_key: true
      t.string :body
      t.float :latitude
      t.float :longitude
      t.string :address
      t.integer :status

      t.timestamps
    end
  end
end
