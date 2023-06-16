const ev1 = document.getElementById("ev1");
const ev2 = document.getElementById("ev2");
const desfazer = document.createElement("button");

function botao1() {
    ev1.style.display = "none";
    body.appendChild(desfazer)
}



function botao2() {
    ev2.style.display = "none";
}



window.addEventListener('scroll', function () {
  var btnTopo = document.getElementById('btnTopo');
  if (window.scrollY > 20) {
    btnTopo.style.display = 'block';
  } else {
    btnTopo.style.display = 'none';
  }
});

function scrollToTop() {
  window.scrollTo({
    top: 0,
    behavior: 'smooth'
  });
}
