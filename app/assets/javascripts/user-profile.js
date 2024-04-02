document.addEventListener("DOMContentLoaded", function() {
  var avatarInput = document.getElementById("avatar_input");
  var avatarWrap = document.getElementById("img_wrap");

  // Trigger file input click when image is clicked
  avatarWrap.addEventListener("click", function() {
    avatarInput.click();
  });

  // Show the form when a file is selected
  avatarInput.addEventListener("change", function() {
    document.getElementById("avatar_form").style.display = "block";
  });
});