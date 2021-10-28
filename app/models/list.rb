class List < ApplicationRecord
    belongs_to :board
    validates :name, :description, :presence => true
    acts_as_list scope: :board
    
    has_many :snippets, -> { order(position: :asc) }, dependent: :destroy
end
