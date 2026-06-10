require "test_helper"

class GameTest < ActiveSupport::TestCase
  test "#price converts integer cents to a decimal amount" do
    assert_equal BigDecimal("34.99"), games(:one).price
  end

  test "#price keeps cent precision" do
    assert_equal BigDecimal("19.99"), Game.new(price_cents: 1999).price
  end
end
