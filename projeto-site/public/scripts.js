// carregamento

var i = setInterval(function() {

    clearInterval(i);


    document.getElementById("loading").style.display = "none";
    document.getElementById("conteudo").style.display = "block";
}, 4000);


// Sidebar
function CloseNav() {
    document.getElementById("mysidebar").style.width = "0";
    document.getElementById("mysidebar").style.borderRight = "0";
    document.getElementById("main").style.marginLeft = "7.5%";
}

function OpenNav() {
    document.getElementById("mysidebar").style.width = "250px";
    document.getElementById("mysidebar").style.borderRight = "black 5px solid";
    document.getElementById("main").style.marginLeft = "300px";
}

// Login

function aguardar() {
    btn_entrar.disabled = true;
    div_erro.style.display = 'none';

}

function finalizar_aguardar() {
    btn_entrar.disabled = false;
    div_erro.style.display = 'block';
    div_erro.innerHTML = '*Email ou senha Inválidos';
}