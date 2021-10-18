class CreateProcedures < ActiveRecord::Migration[5.2]
  def change
    create_table :procedures do |t|
      t.text :procedure
      t.text :procedure_image
      t.timestamps
    end
  end
end
