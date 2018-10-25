class Challenge < ApplicationRecord
    require 'problem'

    serialize :problem_array, Array
end
