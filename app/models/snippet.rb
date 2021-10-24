class Snippet < ApplicationRecord
    acts_as_list scope: :list

    belongs_to :list, :optional => true
    
end
