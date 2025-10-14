// Get all elements with the class 'toggler' (the [+] / [-] icons)
var toggler = document.getElementsByClassName("toggler");
var i;

// Loop through each toggler element
for (i = 0; i < toggler.length; i++) {
  toggler[i].addEventListener("click", function() {
    // 1. Toggle the visibility of the nested <ul> (the content)
    //    The nested <ul> is the next sibling element with the class 'nested'
    var nested = this.parentElement.parentElement.querySelector(".nested");
    
    if (nested) {
        nested.classList.toggle("active");
    }

    // 2. Toggle the icon appearance ([-] vs [+])
    this.classList.toggle("toggler-down");
  });
}

// OPTIONAL: Open the very first (root) item by default
if (toggler.length > 0) {
    toggler[0].click();
}