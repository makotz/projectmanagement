class Comment < ActiveRecord::Base
    validates(:body, {presence: {message: "must be present!"})
end
