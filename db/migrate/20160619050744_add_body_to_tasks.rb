class AddBodyToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :body, :text
    remove_column :tasks, :due_date
    remove_column :tasks, :title
    add_column :tasks, :completion, :text, default: "undone"
  end
end
