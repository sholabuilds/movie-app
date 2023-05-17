class ChangeColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :movies, :release_date, :released_on
  end
end
