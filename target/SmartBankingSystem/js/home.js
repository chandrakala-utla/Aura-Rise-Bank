// ============================
// COUNTER ANIMATION
// ============================

const counters = document.querySelectorAll(".counter");

counters.forEach(counter=>{

    const target=+counter.getAttribute("data-target");

    const updateCounter=()=>{

        const current=+counter.innerText;

        const increment=target/120;

        if(current<target){

            counter.innerText=Math.ceil(current+increment);

            setTimeout(updateCounter,15);

        }
        else{

            counter.innerText=target.toLocaleString()+"+";

        }

    };

    updateCounter();

});


// ============================
// BACK TO TOP BUTTON
// ============================
const topBtn = document.getElementById("topBtn");
console.log(topBtn);
window.addEventListener("scroll", function () {

    if (window.scrollY > 300) {

        topBtn.style.display = "flex";

    } else {

        topBtn.style.display = "none";

    }

});

topBtn.addEventListener("click", function () {

    window.scrollTo({

        top: 0,

        behavior: "smooth"

    });

});

// ============================
// NAVBAR SHRINK
// ============================

const navbar=document.querySelector(".navbar");

window.addEventListener("scroll",()=>{

    if(window.scrollY>60){

        navbar.classList.add("scrolled");

    }

    else{

        navbar.classList.remove("scrolled");

    }

});


// ============================
// ACTIVE NAVIGATION
// ============================

const sections=document.querySelectorAll("section");

const navLinks=document.querySelectorAll(".nav-links a");

window.addEventListener("scroll",()=>{

    let current="";

    sections.forEach(section=>{

        const sectionTop=section.offsetTop-150;

        if(pageYOffset>=sectionTop){

            current=section.getAttribute("id");

        }

    });

    navLinks.forEach(link=>{

        link.classList.remove("active");

        if(link.getAttribute("href")==="#"+current){

            link.classList.add("active");

        }

    });

});

// ============================
// MOBILE MENU
// ============================

const menuBtn = document.querySelector(".menu-toggle");

const navMenu = document.querySelector(".nav-links");

menuBtn.addEventListener("click", () => {

    navMenu.classList.toggle("show");

});