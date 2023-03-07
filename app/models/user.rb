class User < ApplicationRecord
  has_secure_password

  has_many :items

  # make sure email is present before saving login details
  validates :email, presence: true, format: {with: /\A[^@\s]+@[^@\s]+\z/, message: "Must enter valid email address"}
end

# email:string
#   avi@email.com, test@email.com
# password_digest:string
#   password, test
# password:string virtual
# password_confimration:string virtual