class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :company_id
      t.string :company_name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :business_field
      t.string :website
      t.string :logo

      t.timestamps
    end
  end
end
