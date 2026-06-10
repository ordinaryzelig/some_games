module GamesHelper
  # price_cents is stored as an integer number of cents (e.g. 3499 => "$34.99").
  # Divide with a Rational (100r) to avoid binary-float rounding on money.
  def game_price(game)
    number_to_currency(game.price_cents / 100r)
  end

  # Friendly condition copy from the Figma (enum -> label); titleize as a fallback.
  CONDITION_LABELS = {
    "mint"      => "Mint",
    "excellent" => "Like New",
    "good"      => "Good",
    "as_is"     => "Damaged"
  }.freeze

  def game_condition_label(game)
    CONDITION_LABELS.fetch(game.condition.to_s, game.condition.to_s.titleize)
  end
end
