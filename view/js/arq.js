var map;
//Cria o mapa
function initMap(){
    map = new google.maps.Map(document.getElementById('map'),{
            zoom:14,
            center: {lat:-5.640412967570273, lng:-35.42657368606239}
            
    });

}

//Casos por zona

//Casos Zona-01
//Chamada http
var xmlhttp1 = new XMLHttpRequest();
xmlhttp1.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
        //Tranforma o json em um array js
        casosZN1 = JSON.parse(this.responseText);
        //Recebe a qntd de casos
        qtdZN1 = Object.keys(casosZN1).length; 
        //Imprime na tela
        document.getElementById("caso1").innerHTML=qtdZN1 + " Casos"          
    } 
};
xmlhttp1.open("GET", "http://localhost/geostatics/casos/list/zn01",true);       
xmlhttp1.send(); 

//Casos Zona-02
//Chamada http
var xmlhttp2 = new XMLHttpRequest();
xmlhttp2.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
        //Tranforma o json em um array js
        casosZN2 = JSON.parse(this.responseText);
        //Recebe a qntd de casos
        qtdZN2 = Object.keys(casosZN2).length; 
        //Imprime na tela
        document.getElementById("caso2").innerHTML=qtdZN2 + " Casos"          
    } 
};
xmlhttp2.open("GET", "http://localhost/geostatics/casos/list/zn02",true);       
xmlhttp2.send(); 

//Casos Zona-03
//Chamada http
var xmlhttp3 = new XMLHttpRequest();
xmlhttp3.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
        //Tranforma o json em um array js
        casosZN3 = JSON.parse(this.responseText);
        //Recebe a qntd de casos
        qtdZN3 = Object.keys(casosZN3).length; 
        //Imprime na tela
        document.getElementById("caso3").innerHTML=qtdZN3 + " Casos"          
    } 
};
xmlhttp3.open("GET", "http://localhost/geostatics/casos/list/zn03",true);       
xmlhttp3.send(); 

//Casos Zona-04
//Chamada http
var xmlhttp4 = new XMLHttpRequest();
xmlhttp4.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
        //Tranforma o json em um array js
        casosZN4 = JSON.parse(this.responseText);
        //Recebe a qntd de casos
        qtdZN4 = Object.keys(casosZN4).length; 
        //Imprime na tela
        document.getElementById("caso4").innerHTML=qtdZN4 + " Casos"          
    } 
};
xmlhttp4.open("GET", "http://localhost/geostatics/casos/list/zn04",true);       
xmlhttp4.send(); 

//Casos Zona-05
//Chamada http
var xmlhttp5 = new XMLHttpRequest();
xmlhttp5.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
        //Tranforma o json em um array js
        casosZN5 = JSON.parse(this.responseText);
        //Recebe a qntd de casos
        qtdZN5 = Object.keys(casosZN5).length; 
        //Imprime na tela
        document.getElementById("caso5").innerHTML=qtdZN5 + " Casos"          
    } 
};
xmlhttp5.open("GET", "http://localhost/geostatics/casos/list/zn05",true);       
xmlhttp5.send(); 

//Casos Zona-06
//Chamada http
var xmlhttp6 = new XMLHttpRequest();
xmlhttp6.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
        //Tranforma o json em um array js
        casosZN6 = JSON.parse(this.responseText);
        //Recebe a qntd de casos
        qtdZN6 = Object.keys(casosZN6).length; 
        //Imprime na tela
        document.getElementById("caso6").innerHTML=qtdZN6 + " Casos"          
    } 
};
xmlhttp6.open("GET", "http://localhost/geostatics/casos/list/zn06",true);       
xmlhttp6.send(); 

//Problemas Relatados 
var xmlhttp7 = new XMLHttpRequest();
xmlhttp7.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
        //Tranforma o json em um array js
        casosTot = JSON.parse(this.responseText);
        //Recebe a qntd de casos
        qtdTot = Object.keys(casosTot).length; 
        //Imprime na tela
        document.getElementById("qtdPR").innerHTML=qtdTot;         
    } 
};
xmlhttp7.open("GET", "http://localhost/geostatics/casos/list",true);       
xmlhttp7.send();

//Análises Realizadas
var xmlhttp8 = new XMLHttpRequest();
xmlhttp8.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
        //Tranforma o json em um array js
        AR = JSON.parse(this.responseText);
        //Recebe a quantidade de casos
        qtdAR = Object.keys(AR).length; 
        //Imprime na tela a quantidade de casos
        document.getElementById("qtdAnl").innerHTML=qtdAR;
        
        //Comparando datas
        maiordt = new Date("1990-02-01");
        menordt = new Date("2100-11-11");
        for(var i=3 ; i <= qtdAR; i++){
            datamed = new Date(AR[i]["data"]);
            if(datamed > maiordt){
                maiordt = datamed;
                y=i;
            }if(datamed < menordt){
                menordt = datamed;
                x=i;
            }
        }
        //Recebendo maior e menor data
        //O mês recebe 1 porque o get.Month() começa a contagem por 0
        //O ano é tranformado em string para poder cortar os últimos dígitos
        atualano = (maiordt.getFullYear()).toString();
        atualmes = (maiordt.getMonth())+1;
        antigoano =(menordt.getFullYear()).toString();
        antigomes = (menordt.getMonth())+1;

        //Editando as strings anos
        anoantigo = antigoano.slice(2,4);
        anoatual = atualano.slice(2,4);

        //Imprimindo as datas
        document.getElementById("dataAnl").innerHTML="("+antigomes+"/"+anoantigo+" a "+atualmes+"/"+anoatual+")"
        
        

    } 
};
xmlhttp8.open("GET", "http://localhost/geostatics/medicoes/list",true);       
xmlhttp8.send();

//Criando polígonos com os botões

//Botão 1
function btn1(x){
    if(x==1){
        document.getElementById("ic1").style.opacity= 1;
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                myObj = JSON.parse(this.responseText);
                for (i = 0 ; i < myObj.length; i++){
                    myObj[i].lat= parseFloat(myObj[i].lat); 
                    myObj[i].lng= parseFloat(myObj[i].lng); 
                }
                polZ1 = new google.maps.Polygon({
                    paths: myObj,
                    strokeColor:"#8A7BE5",
                    fillColor: "#8A7BE5",
                    fillOpacity: 0.5,
                });
                polZ1.setMap(map);
                btn2(2);
                btn3(2);
                btn4(2);
                btn5(2);
                btn6(2); 
            }
        };
        xmlhttp.open("GET", "http://localhost/geostatics/coordenadas/list/zn01", true);       
        xmlhttp.send(); 

    }else if(x==2){
        if(typeof polZ1.getMap() === 'undefined'){
        }else{
            polZ1.setMap(null);
            document.getElementById("ic1").style.opacity= 0;
        }
    }
}

//Botão 2
function btn2(x){
    if(x==1){
        document.getElementById("ic2").style.opacity= 1;
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                myObj = JSON.parse(this.responseText);
                for (i = 0 ; i < myObj.length; i++){
                    myObj[i].lat= parseFloat(myObj[i].lat); 
                    myObj[i].lng= parseFloat(myObj[i].lng); 
                }
                polZ2 = new google.maps.Polygon({
                    paths: myObj,
                    strokeColor:"#6657BF",
                    fillColor: "#6657BF",
                    fillOpacity: 0.5,
                });
                polZ2.setMap(map);
                btn1(2);
                btn3(2);
                btn4(2);
                btn5(2);
                btn6(2); 
            }
        };
        xmlhttp.open("GET", "http://localhost/geostatics/coordenadas/list/zn02", true);       
        xmlhttp.send(); 

    }else if(x==2){
        if( typeof polZ2.getMap() === 'undefined'){
            
        }else{
            polZ2.setMap(null);
            document.getElementById("ic2").style.opacity= 0;
        }
    }
}

//Botão 3
function btn3(x){
    if(x==1){
        document.getElementById("ic3").style.opacity= 1;
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                myObj = JSON.parse(this.responseText);
                for (i = 0 ; i < myObj.length; i++){
                    myObj[i].lat= parseFloat(myObj[i].lat); 
                    myObj[i].lng= parseFloat(myObj[i].lng); 
                }
                polZ3 = new google.maps.Polygon({
                    paths: myObj,
                    strokeColor:"#e45b1b",
                    fillColor: "#e45b1b",
                    fillOpacity: 0.5,
                });
                polZ3.setMap(map);
                btn2(2);
                btn1(2);
                btn4(2);
                btn5(2);
                btn6(2); 
            }
        };
        xmlhttp.open("GET", "http://localhost/geostatics/coordenadas/list/zn03", true);       
        xmlhttp.send(); 

    }else if(x==2){
        if( typeof polZ3.getMap() === 'undefined'){
        }else{
            polZ3.setMap(null);
            document.getElementById("ic3").style.opacity= 0;
        }
    }
}

//Botão 4
function btn4(x){
    if(x==1){
        document.getElementById("ic4").style.opacity= 1;
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                myObj = JSON.parse(this.responseText);
                for (i = 0 ; i < myObj.length; i++){
                    myObj[i].lat= parseFloat(myObj[i].lat); 
                    myObj[i].lng= parseFloat(myObj[i].lng); 
                }
                polZ4 = new google.maps.Polygon({
                    paths: myObj,
                    strokeColor:"#FF914D",
                    fillColor: "#FF914D",
                    fillOpacity: 0.5,
                });
                polZ4.setMap(map);
                btn1(2);
                btn3(2);
                btn2(2);
                btn5(2);
                btn6(2); 
            }
        };
        xmlhttp.open("GET", "http://localhost/geostatics/coordenadas/list/zn04", true);       
        xmlhttp.send(); 

    }else if(x==2){
        if( typeof polZ4.getMap() === 'undefined'){
        }else{
            polZ4.setMap(null);
            document.getElementById("ic4").style.opacity= 0;
        }
    }


}

//Botão 5
function btn5(x){
    if(x==1){
        document.getElementById("ic5").style.opacity= 1;
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                myObj = JSON.parse(this.responseText);
                for (i = 0 ; i < myObj.length; i++){
                    myObj[i].lat= parseFloat(myObj[i].lat); 
                    myObj[i].lng= parseFloat(myObj[i].lng); 
                }
                polZ5 = new google.maps.Polygon({
                    paths: myObj,
                    strokeColor:"#71D39A",
                    fillColor: "#71D39A",
                    fillOpacity: 0.5,
                });
                polZ5.setMap(map);
                btn1(2);
                btn3(2);
                btn2(2);
                btn4(2);
                btn6(2); 
            }
        };
        xmlhttp.open("GET", "http://localhost/geostatics/coordenadas/list/zn05", true);       
        xmlhttp.send(); 

    }else if(x==2){
        if( typeof polZ5.getMap() === 'undefined'){
        }else{
            polZ5.setMap(null);
            document.getElementById("ic5").style.opacity= 0;
        }
    }
}

//Botão 6
function btn6(x){
    if(x==1){
        document.getElementById("ic6").style.opacity= 1;
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                myObj = JSON.parse(this.responseText);
                for (i = 0 ; i < myObj.length; i++){
                    myObj[i].lat= parseFloat(myObj[i].lat); 
                    myObj[i].lng= parseFloat(myObj[i].lng); 
                }
                polZ6 = new google.maps.Polygon({
                    paths: myObj,
                    strokeColor:"#00ff9d",
                    fillColor: "#00ff9d",
                    fillOpacity: 0.5,
                });
                polZ6.setMap(map);
                btn1(2);
                btn3(2);
                btn2(2);
                btn4(2);
                btn5(2); 
            }
        };
        xmlhttp.open("GET", "http://localhost/geostatics/coordenadas/list/zn06", true);       
        xmlhttp.send(); 

    }else if(x==2){
        if( typeof polZ6.getMap() === 'undefined'){
        }else{
            polZ6.setMap(null);
            document.getElementById("ic6").style.opacity= 0;
        }
    }
}