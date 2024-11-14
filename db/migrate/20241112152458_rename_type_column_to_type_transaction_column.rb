class RenameTypeColumnToTypeTransactionColumn < ActiveRecord::Migration[7.2]
  def change
    rename_column :transations, :type, :type_transation
  end
end
