class CreateEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :employees do |t|
      t.string :job_title
      t.string :pref_pronouns
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :twitter_handle
      t.string :linkedin
      t.string :github_username
      t.string :staff_image
      t.string :expertise_areas

      t.timestamps
    end
  end
end
