document.addEventListener("DOMContentLoaded", function() {
  var avatarImage = document.getElementById("avatar_image");
  var avatarInput = document.getElementById("avatar_input");

  // Trigger file input click when image is clicked
  avatarImage.addEventListener("click", function() {
    avatarInput.click();
  });

  // Show the form when a file is selected
  avatarInput.addEventListener("change", function() {
    document.getElementById("avatar_form").style.display = "block";
  });
});