class AddCurrentCompanyToAdies < ActiveRecord::Migration[5.0]
  def change
    add_column :adies, :current_company, :string
  end
end
