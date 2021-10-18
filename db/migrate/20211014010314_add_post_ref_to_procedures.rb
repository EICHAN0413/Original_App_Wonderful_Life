class AddPostRefToProcedures < ActiveRecord::Migration[5.2]
  def change
    add_reference :procedures, :post, foreign_key: true
  end
end
