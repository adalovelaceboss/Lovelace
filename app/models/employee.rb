class Employee < ApplicationRecord

  validates :first_name, presence: true
  validates :last_name, presence: true
  # validates_uniqueness_of :email

  require 'csv'

  def self.import(file)
    CSV.foreach(file.path, headers: false) do |csv_obj|
      Employee.create(job_title: csv_obj[0], pref_pronouns: csv_obj[1], first_name: csv_obj[2], last_name: csv_obj[3], email: csv_obj[4], twitter_handle: csv_obj[5], linkedin: csv_obj[6], github_username: csv_obj[7], expertise_areas: csv_obj[9])
    end
  end
end
