class Comment < ActiveRecord::Base
  belongs_to :discussion
  belongs_to :project
  belongs_to :user

  validates(:body, presence: true)

end
