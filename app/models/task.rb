class Task < ActiveRecord::Base
    belongs_to :project


    validates(:body, {presence: true, uniqueness: true })

    def self.complete(task)
       if task.completion == "Undone"
         Task.update(task, :completion => "Done")
       else
         Task.update(task, :completion => "Undone")
       end
    end

end
