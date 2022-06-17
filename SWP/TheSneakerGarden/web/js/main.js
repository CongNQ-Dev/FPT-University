// Header Scroll Color Change 
let header = document.querySelector('header');
//window.addEventListener('scroll', () => {
//    header.classList.toggle('', window.scrollY > 0);
//});

// Menu 
//let menu = document.querySelector('#menu-icon');
//let navbar = document.querySelector('.navbar');
//
//menu.onclick = () => {
//    menu.classList.toggle('bx-x');
//    navbar.classList.toggle('active');
//}
//// Remove Menu On Scroll
//window.onscroll = () => {
//    menu.classList.remove('bx-x');
//    navbar.classList.remove('active');
//}

if (window.location.href.toString().endsWith("/index.jsp") || window.location.href.toString().endsWith("/")) {
    let home = document.getElementById("homeActive");
    home.style.setProperty("color", "#ff7c03");
    home.style.setProperty("padding-bottom", "0.25rem")
    home.style.setProperty("border-bottom-style:", "solid");
    home.style.setProperty("border-bottom-color", "#ff7c03");
}
if (window.location.href.toString().endsWith("/shop.jsp")) {
    let home = document.getElementById("shopActive");
    home.style.setProperty("color", "#ff7c03");
    home.style.setProperty("padding-bottom", "0.25rem")
    home.style.setProperty("border-bottom-style:", "solid");
    home.style.setProperty("border-bottom-color", "#ff7c03");
}
if (window.location.href.toString().endsWith("/nike.jsp")) {
    let home = document.getElementById("nikeActive");
    home.style.setProperty("color", "#ff7c03");
    home.style.setProperty("padding-bottom", "0.25rem")
    home.style.setProperty("border-bottom-style:", "solid");
    home.style.setProperty("border-bottom-color", "#ff7c03");
}
if (window.location.href.toString().endsWith("/adidas.jsp")) {
    let home = document.getElementById("adidasActive");
    home.style.setProperty("color", "#ff7c03");
    home.style.setProperty("padding-bottom", "0.25rem")
    home.style.setProperty("border-bottom-style:", "solid");
    home.style.setProperty("border-bottom-color", "#ff7c03");
}
if (window.location.href.toString().endsWith("/about.jsp")) {
    let home = document.getElementById("aboutActive");
    home.style.setProperty("color", "#ff7c03");
    home.style.setProperty("padding-bottom", "0.25rem")
    home.style.setProperty("border-bottom-style:", "solid");
    home.style.setProperty("border-bottom-color", "#ff7c03");
}


// When the user scrolls down 20px from the top of the document, show the button
window.onscroll = function () {
    scrollFunction()
};

function scrollFunction() {
    //Get the button:
    let mybutton = document.getElementById("myBtn");
    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
        mybutton.style.display = "block";
    } else {
        mybutton.style.display = "none";
    }
}

// When the user clicks on the button, scroll to the top of the document
function topFunction() {
    document.body.scrollTop = 0; // For Safari
    document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
}
