class Task < ApplicationRecord
  #association with user
  belongs_to :user

  #creating the enum for tasks status
  enum status: { pending: 'pending', complete: 'complete' }
  
  #validating the tasks column data
  validates :title, presence: true
  validates :description, presence: true
  validates :task_date, presence: true
  validates :status, presence: true
end
