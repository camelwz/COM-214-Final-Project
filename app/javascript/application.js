
// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import * as ActiveStorage from "@rails/activestorage"
import "@rails/ujs"

ActiveStorage.start()
Rails.start()

console.log("✅ Turbo and UJS loaded")