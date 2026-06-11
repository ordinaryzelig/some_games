module GamesHelper
  def game_hue(game)
    game.name.sum % 360
  end

  def game_price(game)
    "$#{format('%.2f', game.price_cents.to_f / 100)}"
  end

  def game_condition_label(game)
    game.condition.to_s.tr("_", " ").titleize
  end

  def game_image_exists?(game)
    File.exist?(Rails.root.join("app", "assets", "images", "board_game_images", "#{game.name}.jpg"))
  end
end
