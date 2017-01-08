class AddInternshipCompanyToAdies < ActiveRecord::Migration[5.0]
  def change
    add_column :adies, :internship_company, :string
  end
end
