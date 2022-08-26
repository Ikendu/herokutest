class AddTypeCo < ActiveRecord::Migration[7.0]
  def change
    add_column :creates, :type, :string
  end
end
