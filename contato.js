const click = document.querySelector("#icone-notifi");
const bloco_notifi = document.getElementById("bloco-notifi")
const closed = document.getElementById("close")

click.addEventListener("click", () => {
    bloco_notifi.style.display = "block";
    closed.style.display = "block";
});

closed.addEventListener("click", () => {
    bloco_notifi.style.display = "none";
    closed.style.display = "none";

});


//BackToTop
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