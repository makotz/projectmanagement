class ChangeDataTypeProject < ActiveRecord::Migration
  def change
    remove_column :projects, :dute_date
    add_column :projects, :due_date, :datetime
  end
end
