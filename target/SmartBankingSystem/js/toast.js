/* ===========================
      TOAST NOTIFICATION
=========================== */

window.onload = function(){

    const toast = document.getElementById("toast");

    if(toast){

        // Show animation
        setTimeout(function(){

            toast.classList.add("show");

        },100);

        // Auto hide after 4 seconds
        setTimeout(function(){

            toast.classList.remove("show");

        },4000);

    }

};


// Close Button
function closeToast(){

    document.getElementById("toast")
            .classList.remove("show");

}