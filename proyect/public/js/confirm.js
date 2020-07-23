
window.addEventListener("load", function(){
    fetch("https://api.giphy.com/v1/gifs/random?api_key=VON27VP7So30oqdrcepu4H3x4AvJnPUG&tag=&rating=g")
    .then(function(response){
        return response.json()
    })
    .then(function(data){
        console.log(data);
        document.querySelector("img").src = data.data.image_url
    })  
})