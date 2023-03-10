import Sortable from 'sortablejs';
const initTodoSortable = (ulElements) => {
  ulElements.forEach((ul) => {
    new Sortable(ul, {
      handle: ".handle",
      group: 'todo', // set both lists to same group
      animation: 300,
      axis: 'y',
      onUpdate: function (evt) {
              return $.ajax({
                  url: `/api/todo/positions/${evt.oldIndex}`,
                  type: 'patch',
                  data: {
                      from: evt.oldIndex,
                      to: evt.newIndex
                  }
              });
          }
    });
  });
};
export { initTodoSortable };
// import Sortable from 'sortablejs';
// const initKanbanSortable = (ulElements) => {
//   ulElements.forEach((ul) => {
//     new Sortable(ul, {
//         group: 'kanban', // set both lists to same group
//         animation: 300
//     });
//   });
// };
// export { initKanbanSortable };