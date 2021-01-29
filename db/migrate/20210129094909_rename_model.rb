class RenameModel < ActiveRecord::Migration[6.1]
  def change
    rename_table :appartements, :appartement
      rename_table :messages, :message
  end
end
