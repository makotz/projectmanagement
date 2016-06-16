class Task < ActiveRecord::Base
    validates(:title, {presence: {message: "must be present!"}, uniqueness: true })
end
