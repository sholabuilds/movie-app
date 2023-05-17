class AddFieldsToMovies < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :description, :text
    add_column :movies, :release_date, :date
  end
end
