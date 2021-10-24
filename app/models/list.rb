class List < ApplicationRecord
    acts_as_list # sort gem

    belongs_to :board, :optional => true
    has_many :snippets, -> { order(position: :asc) }, dependent: :destroy
end
