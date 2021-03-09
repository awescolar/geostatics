var map;
//Inicializando mapa
    function initMap(){
        map = new google.maps.Map(document.getElementById('map'),{
            zoom:15,
            center: {lat:-5.735197919175522, lng: -35.23828565573249}
        });
    }
//Chamada http
var xmlhttp = new XMLHttpRequest();
xmlhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
        console.log(xmlhttp);
        console.log(this.responseURL);
        console.log(this.responseText);           
    } 
};
xmlhttp.open("GET", "./",true);       
xmlhttp.send(); 
