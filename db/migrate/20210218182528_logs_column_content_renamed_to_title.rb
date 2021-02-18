class LogsColumnContentRenamedToTitle < ActiveRecord::Migration[5.2]
  def change
    rename_column :logs, :content, :title
  end
end
