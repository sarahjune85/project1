class User < ApplicationRecord
    validates :email, :presence => true, :uniqueness => true
    has_secure_password

    has_many :boards
    has_many :lists, :through => :boards
    has_many :snippets, :through => :lists    
end
