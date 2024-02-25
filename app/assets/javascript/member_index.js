function toggleDropdown(memberId) {
    var button = document.getElementById("dropDownButton" + memberId);
    var content = document.getElementById("dropDownContent" + memberId);
    
    content.style.display = (content.style.display === "none") ? "block" : "none";
    
    button.classList.toggle("drop-down-active");
  }