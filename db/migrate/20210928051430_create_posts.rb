class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :material
      t.string :amount
      t.text :procedure
      t.text :cooking_image
      t.text :procedure_image
      t.integer :tag
      t.text :text
      t.text :free_text
      t.timestamps
    end
  end
end
