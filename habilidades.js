const habilidadesItens = document.querySelectorAll(".habilidades-itens");
const habilidadesItensDiv = document.querySelector(".habilidades-itens div");
const removeBtn = document.querySelectorAll(".remove-button");
const addBtn = document.querySelectorAll(".btn-add");
const habilidadesBlur = document.querySelector("#blur");
const inputContainer = document.querySelector(".input-container");

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
    e.previousElementSibling.classList.add("remove");
  });
  e.addEventListener("mouseout", function () {
    e.previousElementSibling.classList.remove("remove");
  });
  e.addEventListener("click", function () {
    e.parentElement.remove();
  });
});


addBtn.forEach((e) => {
  e.addEventListener("click", function () {
    habilidadesBlur.classList.toggle("active");
    inputContainer.style.display = "flex";
  })
})