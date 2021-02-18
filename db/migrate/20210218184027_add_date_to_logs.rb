class AddDateToLogs < ActiveRecord::Migration[5.2]
  def change
    add_column :logs, :date, :datetime
  end
end
