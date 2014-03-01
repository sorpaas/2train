class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :skill
      t.string :location
      t.string :email

      t.timestamps
    end
  end
end
