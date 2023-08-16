// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import foundaiton from "foundation-sites"
import $ from "jquery"

$(document).foundation();	
// initialize the page
$(document).on('turbo:render', function() {
    onPageLoad();
});
$(document).ready(function () {
    onPageLoad();
});
function onPageLoad() { 
    // init foundation
    $(document).foundation();
}