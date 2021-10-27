class List < ApplicationRecord
    acts_as_list scope: :board

    belongs_to :board, :optional => true
    has_many :snippets, -> { order(position: :asc) }, dependent: :destroy
end
