class RemoveTypeColumn < ActiveRecord::Migration[7.0]
  def change
     if column_exists? :creates, :type         
      remove_column :creates, :type, :string
    end
  end
end
