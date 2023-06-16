const habilidadesItens = document.querySelectorAll(".habilidades-itens");
const habilidadesItensDiv = document.querySelector(".habilidades-itens div");
const removeBtn = document.querySelectorAll(".remove-button");
const addBtn = document.querySelectorAll(".btn-add");
const habilidadesBlur = document.querySelector("#blur");
const inputContainer = document.querySelector(".input-container");
const btnSalvar = document.querySelector(".salvar");
const btnCancelar = document.querySelector(".cancelar");
const inputField = document.querySelector(".form-field");

habilidadesItens.forEach((e) => {
  e.addEventListener("mouseover", function () {
    e.lastElementChild.style.display = "block";
  });
  e.addEventListener("mouseout", function () {
    e.lastElementChild.style.display = "none";
  });
});

removeBtn.forEach((e) => {
  e.addEventListener("mouseover", function () {
    e.previousElementSibling.classList.toggle("remove");
  });
  e.addEventListener("mouseout", function () {
    e.previousElementSibling.classList.toggle("remove");
  });
  e.addEventListener("click", function () {
    e.parentElement.remove();
  });
});

addBtn.forEach((e) => {
  e.addEventListener("click", function () {
    habilidadesBlur.classList.toggle("active");
    inputContainer.style.display = "flex";
  });
});

function saveInput() {
  
}

btnSalvar.addEventListener("click", function () {
  inputContainer.style.display = "none";
  habilidadesBlur.classList.toggle("active");
});

btnCancelar.addEventListener("click", function () {
  inputContainer.style.display = "none";
  habilidadesBlur.classList.toggle("active");
});
