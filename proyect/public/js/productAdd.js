window.addEventListener("load",function(){
    let form = document.querySelector("form");

    form.addEventListener("submit", function(e){
        var errors = [];

        if(document.querySelector("input.name").value.length < 1){
            errors.push("Debes poner el nombre del producto")
        }

        if(document.querySelector("input.price").value.length < 1){
            errors.push("Debes poner un precio")
        }

        if(errors.length > 0){
            e.preventDefault()
            for(var i = 0; i < errors.length; i++){
                document.querySelector("div.errores ul").innerHTML += "<li>" + errors[i] + <i class="fas fa-exclamation"></i>  + "</li>"
            }
        }
    })
})