module GamesHelper
  # The `price_cents` column actually stores whole-dollar amounts in the seed
  # data (e.g. 34), so render it as a plain dollar price.
  def game_price(game)
    number_to_currency(game.price_cents)
  end

  # Human-friendly condition label for the card badge, e.g. :as_is => "As Is".
  def game_condition_label(game)
    game.condition&.titleize
  end
end
