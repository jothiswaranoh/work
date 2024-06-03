# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "jquery" # @3.7.0
pin "select2" # @4.1.0
pin "underscore" # @1.13.6
pin "jquery-blockUI" # @2.7
pin "moment" # @2.29.4
pin "jquery-ui" # @2.7
pin "bootstrap"
