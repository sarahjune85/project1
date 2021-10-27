class Board < ApplicationRecord
    belongs_to :user, :optional => true
    
    has_many :lists, -> { order(position: :asc) }, dependent: :destroy
    has_many :snippets, :through => :lists
    
end
