var contador = 0
window.addEventListener("load", function(){
    agregarCarrito = document.querySelector(".agregarCarrito")
    agregarCarrito.addEventListener("click",function(){
        document.querySelector(".quantityTest").innerHTML = contador + 1
    })
})