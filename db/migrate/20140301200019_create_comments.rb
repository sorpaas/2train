class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :request_id
      t.integer :user_id
      t.text :message

      t.timestamps
    end
  end
end
