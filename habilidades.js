const habilidadeSpan = document.querySelector('.habilidades-itens div');
const removeBtn = document.querySelector('.habilidades-itens a');


habilidadeSpan.addEventListener('mouseup', function() {
  removeBtn.style.display = 'block';
})