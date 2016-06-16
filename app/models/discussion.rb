class Discussion < ActiveRecord::Base
  validates(:title, {presence: {message: "must be present!"})
end
