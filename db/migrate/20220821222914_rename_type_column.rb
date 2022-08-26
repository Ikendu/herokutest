class RenameTypeColumn < ActiveRecord::Migration[7.0]
  def change
    add_column :creates, :makers, :string
  end
end
