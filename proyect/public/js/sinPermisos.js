
window.addEventListener("load", function(){
    fetch("https://api.giphy.com/v1/gifs/search?api_key=VON27VP7So30oqdrcepu4H3x4AvJnPUG&q=sad&limit=1&offset=1&rating=g&lang=en")
    .then(function(response){
        return response.json()
    })
    .then(function(data){
        console.log(data);
        document.querySelector("img").src = data.data[0].images.original.url
    })  
})