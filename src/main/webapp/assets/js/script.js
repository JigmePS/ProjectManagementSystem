const icon = document.getElementById("Svg");
const password = document.getElementById("EnterPassword");

icon.addEventListener("click", function(){
    this.classList.toggle("fa-eye-slash")
    const type = password.getAttribute("type") === "password" ? "text" : "password"
    password.setAttribute("type", type)
  })