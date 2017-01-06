# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

  CSV.foreach ('csvs/test-adie.csv') do |csv_obj|
    Adie.create(cohort: csv_obj[1], pref_pronouns: csv_obj[2], first_name: csv_obj[3], last_name: csv_obj[4], email: csv_obj[5], twitter_handle: csv_obj[12], linkedin: csv_obj[13], github_username: csv_obj[14])
  end

# I need to omit header row.
# How am I going to read new cohorts in if they're all in the same master stylesheets
# Best handling methods for this - should I work on this now or just run with my CSV stuff to build up a model and go from there