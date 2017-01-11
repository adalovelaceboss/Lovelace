class Adie < ApplicationRecord

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :cohort, presence: true

  require 'csv'

  # def self.import(file)
  #   CSV.foreach(file.path, headers: false) do |csv_obj|
  #     # binding.pry
  #     Adie.create!(cohort: csv_obj[1], pref_pronouns: csv_obj[2], first_name: csv_obj[3], last_name: csv_obj[4], email: csv_obj[5], twitter_handle: csv_obj[12], linkedin: csv_obj[13], github_username: csv_obj[14])
  #   end
  # end

  # def self.import(file)
  #   spreadsheet = Roo::Spreadsheet.open(file.path)
  #   spreadsheet.each do |i|
  #     row = Hash[[spreadsheet.row(i)].transpose]
  #     adie = find_by(first_name: row["first_name"]) || new
  #     adie.attributes = row.to_hash
  #     adie.save!
  #   end
  # end

  #  AND last_name: row["last_name"]

end
