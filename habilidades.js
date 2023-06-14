const habilidadesItens = document.querySelector('.habilidades-itens');
const habilidadesItensDiv = document.querySelector('.habilidades-itens div');
const removeBtn = document.querySelector('.remove-button');


habilidadesItens.addEventListener('mouseover', function() {
  removeBtn.style.display = 'block';
})

habilidadesItens.addEventListener('mouseout', function() {
  removeBtn.style.display = 'none';
})


removeBtn.addEventListener('mouseover', function() {
  habilidadesItensDiv.classList.add('remove');
})

removeBtn.addEventListener('mouseout', function() {
  habilidadesItensDiv.classList.remove('remove');
})

removeBtn.addEventListener('click', function() {
  habilidadesItens.remove();
})