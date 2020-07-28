
function myFunction() {
  var navbrrr = document.getElementById("myLinks");
  var titulo = document.querySelector("div.col-7.t.mobile");
  var carrito =document.querySelector("div.col-2.col-lg-2.buscador.mobile");
  var div = document.querySelector("div.col-3.login.mobile");
  var topNav = document.querySelector("div.topnav");
  if (navbrrr.style.display === "block") {
    navbrrr.style.display = "none";
  } else {
    navbrrr.style.display = "block";
  }
}
