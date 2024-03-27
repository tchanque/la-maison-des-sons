let initialFont = document.body.style.fontFamily;

function activateOpenDys() {
  document.body.style.fontFamily = "Open-dyslexic, sans-serif";
  console.log("OpenDys a été activé.");
  // Stockage de la font
  sessionStorage.setItem("fontFamily", document.body.style.fontFamily);
}

function desactivateOpenDys() {
  document.body.style.fontFamily = initialFont;
  console.log("OpenDys a été désactivé.");
  // Suppression du stockage
  sessionStorage.removeItem("fontFamily");
}

document.getElementById("opendys-toggle-btn").addEventListener("click", function() {
  let buttonText = this.innerText;

  if (buttonText === "Activer Opendys") {
    activateOpenDys();
    this.innerText = "Désactiver Opendys";
  } else {
    desactivateOpenDys();
    this.innerText = "Activer Opendys";
  }
});

// Vérification de la font stockée au chargement d'une page
window.onload = function () {
  let storedFontFamily = sessionStorage.getItem("fontFamily");
  if (storedFontFamily) {
    document.body.style.fontFamily = storedFontFamily;
    document.getElementById("opendys-toggle-btn").innerText = "Desactiver Opendys";
  }
};
