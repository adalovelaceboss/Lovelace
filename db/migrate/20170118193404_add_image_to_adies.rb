class AddImageToAdies < ActiveRecord::Migration[5.0]
  def change
    add_column :adies, :adie_image, :string
  end
end
