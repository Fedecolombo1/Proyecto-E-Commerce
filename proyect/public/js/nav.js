
function myFunction() {
  var navbrrr = document.getElementById("myLinks");
  var titulo = document.querySelector("div.col-7.t.mobile");
  var carrito =document.querySelector("div.col-2.col-lg-2.buscador.mobile");
  var div = document.querySelector("div.col-3.login.mobile");
  var topNav = document.querySelector("div.topnav");
  if (navbrrr.style.display === "block") {
    navbrrr.style.display = "none";
    topNav.classList.remove("col-12");
    
    div.classList.add("col-3");
  } else {
    div.classList.remove("col-3");
    div.classList.add("col-12");
    topNav.classList.add("col-12");
    navbrrr.style.display = "block";
    titulo.style.toggle.display ="none";
    carrito.style.display ="none";
  }
}
