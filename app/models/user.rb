class User < ApplicationRecord

	#for handling the user authentication and password management
  has_secure_password

	# creating the enums for roles
  enum role: { client: 'client', manager: 'manager', employee: 'employee' }

	#validating the name and email for users
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

	#aasociations with tasks table and enabling the dependent destroy
	has_many :tasks, dependent: :destroy
end
