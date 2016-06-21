class Discussion < ActiveRecord::Base
  belongs_to :project
  has_many :comments, dependent: :destroy
  belongs_to :user

  validates(:title, presence: true, uniqueness: true)
  validates(:body, presence: true)

end
