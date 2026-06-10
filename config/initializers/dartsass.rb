Rails.application.config.dartsass.builds = {
  "application.bootstrap.scss" => "application.css"
}

Rails.application.config.dartsass.load_paths = [
  Rails.root.join("node_modules").to_s
]