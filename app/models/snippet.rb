class Snippet < ApplicationRecord
    belongs_to :list
    validates :title, :description, :code_block, :presence => true
    acts_as_list scope: :list
end
