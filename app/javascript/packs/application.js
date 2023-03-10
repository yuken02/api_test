// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";
// import "script.js";
import 'jquery';
import "popper.js";
import "bootstrap"
import "../stylesheets/application.scss";
import '@fortawesome/fontawesome-free/js/all';

// require("jquery_ujs"); // 追記
// require("jquery-ui/widgets/sortable"); // 追記
// require("jquery-ui/effects/effect-highlight"); // 追記
// import "jquery_ujs" // 追記
// import "jquery-ui/widgets/sortable" // 追記
// import "jquery-ui/effects/effect-highlight" // 追記
import Sortable from 'sortablejs';


Rails.start();
Turbolinks.start();
ActiveStorage.start();

// import {initKanbanSortable} from '../plugins/initSortable'
// ...(省略)
// document.addEventListener('turbolinks:load', () => {
//   const kanbanUls = document.querySelectorAll(".kanban .kanban-col");
//   if (kanbanUls) {
//     initKanbanSortable(kanbanUls);
//   }
// });
import {initTodoSortable} from '../initSortable'
document.addEventListener('turbolinks:load', () => {
  const todoUls = document.querySelectorAll(".todo .todo_col");
  if (todoUls) {
    initTodoSortable(todoUls);
  }
});