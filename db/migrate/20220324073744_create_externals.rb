class CreateExternals < ActiveRecord::Migration[7.0]
  def change
    create_table :externals do |t|
      t.string :company_name
      t.string :product_name
      t.string :quantity
      t.string :amount

      t.timestamps
    end
  end
end
