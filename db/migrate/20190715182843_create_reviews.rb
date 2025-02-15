class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :product, index: true, foreign_key: true
      t.string :rating
      t.string :comment

      t.timestamps null: false
    end
  end
end
