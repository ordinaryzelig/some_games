class Game < ApplicationRecord

  enum :condition, {
    :mint      => 1,
    :excellent => 2,
    :good      => 3,
    :as_is     => 4,
  }

  validates :name, presence: true
  validates :condition, presence: true
  validates :price_cents, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

end
