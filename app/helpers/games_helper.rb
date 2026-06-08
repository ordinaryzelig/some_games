module GamesHelper
  CONDITION_LABELS = {
    "mint" => "Mint",
    "excellent" => "Like New",
    "good" => "Good",
    "as_is" => "Damaged"
  }.freeze

  def game_condition_label(game)
    CONDITION_LABELS.fetch(game.condition, game.condition.humanize)
  end

  def formatted_game_price(game)
    number_to_currency(game.price_cents, precision: 2)
  end

  def game_bid_count(game)
    (game.id % 5) + 1
  end

  def game_cover_image(game)
    "board_game_images/#{game.name}.jpg"
  end
end
