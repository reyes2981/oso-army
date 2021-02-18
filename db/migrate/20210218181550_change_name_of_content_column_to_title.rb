class ChangeNameOfContentColumnToTitle < ActiveRecord::Migration[5.2]
  def change
    def change
      rename_column :table_name, :content, :title
    end
  end
end
