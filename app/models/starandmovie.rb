class Starandmovie < ApplicationRecord
    belongs_to :star
    belongs_to :movie
end
