class AddBioToProfile < ActiveRecord::Migration[7.1]
  def change
    add_column :profiles, :bio, :text
  end
end
