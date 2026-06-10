// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import * as bootstrap from "bootstrap"
import "@hotwired/turbo-rails"

document.addEventListener("turbo:before-fetch-request", (event) => {
  const btn = document.querySelector("#games-more a")
  if (btn) {
    btn.insertAdjacentHTML("afterend", '<span id="games-loader" class="spinner-border spinner-border-sm ms-2" role="status"></span>')
    btn.style.display = "none"
  }
})

document.addEventListener("turbo:render", () => {
  const loader = document.getElementById("games-loader")
  if (loader) loader.remove()
})
