class Game < ApplicationRecord

  has_one_attached :cover

  enum :condition, {
    :mint      => 1,
    :excellent => 2,
    :good      => 3,
    :as_is     => 4,
  }

  # Price stored as integer cents; expose dollars for display (e.g. number_to_currency).
  def price
    price_cents.to_d / 100
  end

end
