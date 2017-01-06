class CreateAdies < ActiveRecord::Migration[5.0]
  def change
    create_table :adies do |t|
      t.string :cohort
      t.string :pref_pronouns
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :twitter_handle
      t.string :linkedin
      t.string :github_username

      t.timestamps
    end
  end
end
