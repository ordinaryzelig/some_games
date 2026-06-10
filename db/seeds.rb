board_games = [
  { name: "Catan", price_cents: 34_99, condition: "mint" },
  { name: "Ticket to Ride", price_cents: 12_50, condition: "good" },
  { name: "Pandemic", price_cents: 27_00, condition: "excellent" },
  { name: "Carcassonne", price_cents: 8_75, condition: "as_is" },
  { name: "Dominion", price_cents: 45_00, condition: "mint" },
  { name: "Azul", price_cents: 19_99, condition: "good" },
  { name: "7 Wonders", price_cents: 38_50, condition: "excellent" },
  { name: "Splendor", price_cents: 22_00, condition: "mint" },
  { name: "Wingspan", price_cents: 49_99, condition: "good" },
  { name: "Codenames", price_cents: 11_25, condition: "as_is" },
  { name: "Betrayal at House on the Hill", price_cents: 33_00, condition: "excellent" },
  { name: "Gloomhaven", price_cents: 47_50, condition: "mint" },
  { name: "Terraforming Mars", price_cents: 41_00, condition: "good" },
  { name: "Dixit", price_cents: 16_75, condition: "excellent" },
  { name: "Agricola", price_cents: 29_99, condition: "as_is" },
  { name: "Power Grid", price_cents: 36_00, condition: "mint" },
  { name: "Lords of Waterdeep", price_cents: 23_50, condition: "good" },
  { name: "Arkham Horror", price_cents: 44_00, condition: "excellent" },
  { name: "King of Tokyo", price_cents: 18_25, condition: "as_is" },
  { name: "Smallworld", price_cents: 31_00, condition: "mint" },
  { name: "Race for the Galaxy", price_cents: 14_99, condition: "good" },
  { name: "Forbidden Island", price_cents: 9_50, condition: "as_is" },
  { name: "Pandemic Legacy Season 1", price_cents: 48_00, condition: "excellent" },
  { name: "Through the Ages", price_cents: 43_75, condition: "mint" },
  { name: "Istanbul", price_cents: 26_00, condition: "good" },
  { name: "Battlestar Galactica", price_cents: 39_99, condition: "as_is" },
  { name: "Dead of Winter", price_cents: 35_50, condition: "excellent" },
  { name: "Viticulture", price_cents: 46_00, condition: "mint" },
  { name: "Coup", price_cents: 7_25, condition: "good" },
  { name: "Sheriff of Nottingham", price_cents: 21_00, condition: "as_is" },
  { name: "Tokaido", price_cents: 17_50, condition: "excellent" },
  { name: "Robinson Crusoe", price_cents: 40_00, condition: "mint" },
  { name: "Mysterium", price_cents: 28_75, condition: "good" },
  { name: "Twilight Struggle", price_cents: 37_00, condition: "as_is" },
  { name: "Concordia", price_cents: 32_50, condition: "excellent" },
  { name: "Pandemic Iberia", price_cents: 24_99, condition: "mint" },
  { name: "Spirit Island", price_cents: 50_00, condition: "good" },
  { name: "Everdell", price_cents: 30_25, condition: "excellent" },
  { name: "The Resistance", price_cents: 6_50, condition: "mint" },
  { name: "Bruges", price_cents: 20_00, condition: "good" },
  { name: "Blood Rage", price_cents: 45_75, condition: "as_is" },
  { name: "Village", price_cents: 15_00, condition: "excellent" },
  { name: "Hive", price_cents: 13_50, condition: "mint" },
  { name: "Quacks of Quedlinburg", price_cents: 25_50, condition: "as_is" },
  { name: "Mansions of Madness", price_cents: 47_00, condition: "mint" },
  { name: "Patchwork", price_cents: 10_75, condition: "good" },
  { name: "Great Western Trail", price_cents: 44_50, condition: "as_is" }
]

Game.insert_all(board_games)

Game.find_each do |game|
  image_path = Rails.root.join("app/assets/images/board_game_images", "#{game.name}.jpg")
  if File.exist?(image_path) && !game.cover.attached?
    game.cover.attach(io: File.open(image_path), filename: "#{game.name}.jpg")
  end
end
