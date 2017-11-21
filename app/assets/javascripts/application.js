// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require turbolinks
//= require bootstrap-sprockets
// require bootstrap (不要)
// ※こちらはパスを指定しないとロードできない
// require bootstrap-sass/assets/javascripts/bootstrap
//= require_tree .

// https://qiita.com/fursich/items/c2ab11acad918000a8ea
// 順序：jquery → rails-ujs → turbolinks → _tree .

// https://qiita.com/Fendo181/items/7b5c4fc8cd0639fe2283
// 順序(?)：rails-ujs → turbolinks → jquery → bootstrap → _tree .

// https://stackoverflow.com/questions/43697023/how-to-use-rails-5-1-0-and-jquery
// 順序：jquery → rails-ujs → turbolinks → bootstrap → _tree .
