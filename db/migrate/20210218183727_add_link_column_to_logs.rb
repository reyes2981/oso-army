class AddLinkColumnToLogs < ActiveRecord::Migration[5.2]
  def change
    add_column :logs, :link, :string
  end
end
