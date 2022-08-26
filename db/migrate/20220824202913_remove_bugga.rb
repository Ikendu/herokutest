class RemoveBugga < ActiveRecord::Migration[7.0]
  def change
    remove_column :creates, :type, :string
  end
end
