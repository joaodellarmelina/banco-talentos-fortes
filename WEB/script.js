// RECEBENDO O BOTÃO 'ENTRAR'

var entrar = document.querySelector("#entrar")

// CRIANDO AÇÃO AO CLILCAR NO BOTÃO 'ENTRAR'

entrar.addEventListener("click", function (e) {
    e.preventDefault();

    // RECEBENDO OS VALORES DOS INPUT'S 

    const login = document.querySelector("#login")
    const senha = document.querySelector("#senha")
    const login_text = login.value;
    const senha_text = senha.value;

    // LOGIN E SENHA ANDRÉ

    const login2 = "admin"
    const password = "admin"



    // ELEMENTOS DE ERRO NA PÁGINA

    var erro = document.getElementById("erro")
    var erro2 = document.getElementById("erro2")

    console.log(login_text, senha_text)

    // VALIDAÇÃO DE LOGIN E SENHA

    if (login_text === login2 && senha_text === password) {
        window.location = "FRONT PAGE/home.html";
    } else if (login_text === ' ' || senha_text === ' ') {
        erro2.style.display = "block"
        return;

    } else {
        erro.style.display = "block"
        alert("Usuário = admin\n" + "Senha = admin")


    }


    // switch (login_text, senha_text) {
    //     case 'André', '12345678':
    //         alert("ENTROU")
    //         break;
    //     case 'andré@fortes.com', '12345678':
    //         alert("Entrou!!")
    //         break;
    //     default:
    //         alert("Login e senha errada");


    //         console.log(login_text)
    //         console.log(senha_text)

    // }
});