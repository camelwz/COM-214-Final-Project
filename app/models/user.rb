class User < ApplicationRecord
    has_secure_password

    has_many :categories, dependent: :destroy
    has_many :todos, dependent: :destroy

    validates :first_name, :last_name, presence:true 
    validates :email, :username, presence: true, uniqueness: true
end
