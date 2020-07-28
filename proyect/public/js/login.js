window.addEventListener("load",function(){
    let form = document.querySelector("form.login");

    form.addEventListener("submit", function(e){
        var errors = [];
        console.log(document.querySelector("input.email"));
        if(document.querySelector("input.email").value.length < 1){
            errors.push("Debes poner el email")
        }

        if(document.querySelector("input.password").value.length < 1){
            errors.push("Debes poner una contraseña")
        }

        if(errors.length > 0){
            e.preventDefault()
            for(var i = 0; i < errors.length; i++){
                document.querySelector("div.errores ul").innerHTML += "<li>" + errors[i] + '<i class="fas fa-exclamation"></i>'  + "</li>"
            }
        }
    })
})