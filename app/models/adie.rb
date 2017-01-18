class Adie < ApplicationRecord

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :cohort, presence: true
  validates_uniqueness_of :first_name, scope: [:last_name, :cohort]

  require 'csv'

  def self.import(file)
    CSV.foreach(file.path, headers: false) do |csv_obj|
      Adie.create(cohort: csv_obj[1], pref_pronouns: csv_obj[2], first_name: csv_obj[3], last_name: csv_obj[4], email: csv_obj[5], twitter_handle: csv_obj[12], linkedin: csv_obj[13], github_username: csv_obj[14])
    end
  end

  def self.search(query)
    where("name LIKE ? OR description LIKE ?", "%#{query}%", "%#{query}%")
  end

end
