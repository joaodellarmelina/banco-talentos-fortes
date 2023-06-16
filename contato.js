

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