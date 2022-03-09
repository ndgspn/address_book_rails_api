class Person < ApplicationRecord
    validates :full_name, presence: true, length: { minimum: 5, maximum: 50 }
    validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: URI::MailTo::EMAIL_REGEXP, message: 'Invalid Email' }
end
