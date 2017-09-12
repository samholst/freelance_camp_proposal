class RemoveStringFromProposals < ActiveRecord::Migration[5.1]
  def change
    remove_column :proposals, :string, :string
  end
end
