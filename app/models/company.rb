class Company < ApplicationRecord

  validates :company_name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true
  validates_uniqueness_of :company_name, scope: [:city, :state]

  require 'csv'

  def self.import(file)
    CSV.foreach(file.path, headers: false) do |csv_obj|
      Company.create(company_id: csv_obj[0], company_name: csv_obj[1], address: csv_obj[2], city: csv_obj[3], state: csv_obj[4], zip_code: csv_obj[5], business_field: csv_obj[6], website: csv_obj[7], logo: csv_obj[8])
    end
  end
end
