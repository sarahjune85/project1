class User < ApplicationRecord
    validates :email, :presence => true, :uniqueness => true
    has_secure_password

    has_many :boards
    has_many :lists, -> { order(position: :asc) }, :through => :boards
    has_many :snippets, :through => :lists    
end
