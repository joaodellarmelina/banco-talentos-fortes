const habilidadesItens = document.querySelectorAll(".habilidades-itens");
const habilidadesItensDiv = document.querySelector(".habilidades-itens div");
const removeBtn = document.querySelectorAll(".remove-button");

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
    console.log(e);
    e.parentElement.classList.add("remove");
  });
  // e.addEventListener("mouseout", function () {
  //   habilidadesItensDiv.classList.remove("remove");
  // });
  // e.removeBtn.addEventListener("click", function () {
  //   habilidadesItens.remove();
  // });
});
