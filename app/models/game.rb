class Game < ApplicationRecord

  enum :condition, {
    :mint      => 1,
    :excellent => 2,
    :good      => 3,
    :as_is     => 4,
  }

  attr_accessor :bids_count
end
