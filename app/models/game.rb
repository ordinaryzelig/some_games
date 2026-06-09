class Game < ApplicationRecord

  enum :condition, {
    :mint      => 1,
    :excellent => 2,
    :good      => 3,
    :as_is     => 4,
  }

  def random_bid_count
    rand(1..10)
  end

end
