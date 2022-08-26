class RenameTableBack < ActiveRecord::Migration[7.0]
  def change
    rename_table :buldin, :creates
  end
end
