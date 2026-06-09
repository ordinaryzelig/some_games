module GamesHelper
  CONDITION_LABELS = {
    "mint"      => "Mint",
    "excellent" => "Like New",
    "good"      => "Good",
    "as_is"     => "Damaged"
  }.freeze

  def game_condition_label(game)
    CONDITION_LABELS.fetch(game.condition) { game.condition.to_s.humanize }
  end

  def game_price(game)
    number_to_currency(game.price_cents / 100.0)
  end
end
