class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :skill
      t.string :location
      t.string :datetime
      t.string :certification_url

      t.timestamps
    end
  end
end
