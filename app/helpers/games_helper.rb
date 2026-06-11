module GamesHelper
  # Placeholder card titles from the approved mockup, cycled across the grid.
  MOCKUP_TITLES = [
    "New in Sealed Box- Canterbury board game",
    "Return to Dark Tower Core Board Game by Restoration Games - New & Sealed",
    "Monopoly Board Game",
    "Dune Imperium Uprising"
  ].freeze

  def mockup_title(index)
    MOCKUP_TITLES[index.to_i % MOCKUP_TITLES.size]
  end

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
