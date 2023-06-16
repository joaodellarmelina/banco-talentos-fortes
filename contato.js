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

