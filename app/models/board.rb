class Board < ApplicationRecord
    belongs_to :user, :optional => true
    acts_as_list scope: :user
    
    has_many :lists, -> { order(position: :asc) }, dependent: :destroy
    has_many :snippets, :through => :lists
    
end
