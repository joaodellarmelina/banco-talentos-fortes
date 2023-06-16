const habilidadesContainer = document.querySelectorAll(
  ".habilidades-container"
);
var habilidadesItens = document.querySelectorAll(".habilidades-itens");
const habilidadesItensDiv = document.querySelector(".habilidades-itens div");
const removeBtn = document.querySelectorAll(".remove-button");
const addBtn = document.querySelectorAll(".btn-add");
const pessoaisAdd = document.querySelector(".pessoais-add");
const pessoaisForm = document.querySelector("#pessoais-form");
const pessoaisInput = document.querySelector("#pessoais-input");
const profissionaisAdd = document.querySelector(".profissionais-add");
const profissionaisForm = document.querySelector("#profissionais-form");
const profissionaisInput = document.querySelector("#profissionais-input");
const hobbiesAdd = document.querySelector(".hobbies-add");
const hobbiesForm = document.querySelector("#hobbies-form");
const hobbiesInput = document.querySelector("#hobbies-input");
var newHabilidade = `
                <div class="habilidades-itens">
                  <div>
                    <span></span>
                  </div>
                  <a class="remove-button">
                    <i class="fa-solid fa-xmark"></i>
                  </a>
                </div>
                `;

// habilidadesContainer.forEach((div) => {
//   div.addEventListener("mouseover", function (e) {
//     if (e.target.classList.contains("habilidades-itens")) {
//       e.target.lastElementChild.style.display = "block";
//     }
//   });
// });

// habilidadesItens.forEach((div) => {
//   div.addEventListener("mouseout", function (e) {
//   if (e.target.classList.contains("habilidades-itens")) {
//     e.target.lastElementChild.style.display = "none";
//   }
// });
// })

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

pessoaisForm.addEventListener("submit", function (e) {
  e.preventDefault();
  var habilidadesItens = document.querySelectorAll(".habilidades-itens");
  var pessoaisValue = pessoaisInput.value;
  var newElement = document
    .createRange()
    .createContextualFragment(newHabilidade);
  var pessoaisParent = pessoaisAdd.parentNode;
  pessoaisParent.insertBefore(newElement, pessoaisAdd);
  var pessoaisSpan =
    pessoaisAdd.previousElementSibling.firstElementChild.firstElementChild;
  pessoaisSpan.textContent = pessoaisValue;
});
