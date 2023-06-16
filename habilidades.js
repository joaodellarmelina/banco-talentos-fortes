const habilidadesItens = document.querySelectorAll(".habilidades-itens");
const habilidadesItensDiv = document.querySelector(".habilidades-itens div");
const removeBtn = document.querySelectorAll(".remove-button");
const addBtn = document.querySelectorAll(".btn-add");
const habilidadesBlur = document.querySelector("#blur");
const inputContainer = document.querySelector(".input-container");
const btnSalvar = document.querySelector(".salvar");
const btnCancelar = document.querySelector(".cancelar");
const form = document.querySelector(".form-group");
const inputField = document.querySelector(".form-field");
var inputValue;
var newHabilidade = (document.createElement = `
                <div class="habilidades-itens">
                  <div>
                    <span>${inputValue}</span>
                  </div>
                  <a class="remove-button">
                    <i class="fa-solid fa-xmark"></i>
                  </a>
                </div>
                `);

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

function submitForm() {
  form.addEventListener("submit", function (e) {
    e.preventDefault();
    form.reset();
    inputValue = inputField.value;
  });
}

inputField.addEventListener("keypress", function (e) {
  if (e.key === "Enter") {
    submitForm();
  }
});

btnSalvar.addEventListener("click", function (e) {
  submitForm();
  inputContainer.style.display = "none";
  habilidadesBlur.classList.toggle("active");
});

btnCancelar.addEventListener("click", function () {
  inputContainer.style.display = "none";
  habilidadesBlur.classList.toggle("active");
});

console.log(newHabilidade);