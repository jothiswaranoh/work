// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";
import $ from "jquery";

import JPX from "./behaviors/jpx";
window.JPX = JPX;

import underscore from "underscore";
window._ = underscore;

import moment from "moment";
window.moment = moment;

import "jquery-blockUI";
import "jquery-ui";
import "select2";

$(document).on("turbo:render", function () {
  onPageLoad();
});

$(document).ready(function () {
  onPageLoad();
});

function onPageLoad() {
  JPX.applyBehaviors($("body"));
}
