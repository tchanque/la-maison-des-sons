let initialFont = document.body.style.fontFamily;

function activateOpenDys() {
  document.body.style.fontFamily = "Open-dyslexic, sans-serif";
  console.log("OpenDys a été activé.");
  // Font storage
  sessionStorage.setItem("fontFamily", document.body.style.fontFamily);
}

function desactivateOpenDys() {
  document.body.style.fontFamily = initialFont;
  console.log("OpenDys a été désactivé.");
  // Delete storage
  sessionStorage.removeItem("fontFamily");
}

document.getElementById("opendys-toggle-btn").addEventListener("click", function() {
  let buttonText = this.innerText;

  if (buttonText === "Opendys ON") {
    activateOpenDys();
    this.innerText = "Opendys OFF";
    this.classList.remove("btn-primary")
    this.classList.add("btn-success")
  } else {
    desactivateOpenDys();
    this.innerText = "Opendys ON";
    this.classList.remove("btn-success")
    this.classList.add("btn-primary")
  }
});

// Checking of the stored font when a page is loaded
window.onload = function () {
  let storedFontFamily = sessionStorage.getItem("fontFamily");
  if (storedFontFamily) {
    document.body.style.fontFamily = storedFontFamily;
    document.getElementById("opendys-toggle-btn").innerText = "Opendys OFF";
    document.getElementById("opendys-toggle-btn").classList.remove("btn-primary")
    document.getElementById("opendys-toggle-btn").classList.add("btn-success");
  }
};
