OpenMenu = function() {
  $('.Menuzinho').css("display", "block");
  $('.Menuzinho').animate({"top": "30vh"}, 350)
}

CloseMenu = function() {
  $('.Menuzinho').css("display", "none");
}

window.addEventListener('message', function(event) {
  switch(event.data.action) {
    case "CloseMenu":
    CloseMenu();
    break;
  }
});

window.addEventListener('message', function(event) {
    switch(event.data.action) {
      case "OpenMenu":
      OpenMenu();
      break;
    }
});