# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "foundation" # @4.2.1
pin "path" # @2.0.1
pin "stylus-type-utils" # @0.0.3
pin "foundation-sites" # @6.7.5
pin "jquery" # @3.7.0
