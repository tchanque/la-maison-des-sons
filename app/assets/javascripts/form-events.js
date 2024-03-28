document.getElementById('event_category').onchange = function () {
    console.log(this.value)
    let events_with_instruments = ["Scène ouverte", "Concert"];
    if (events_with_instruments.includes(this.value)) {
        document.getElementById('event_instrument').setAttribute("disabled", true);
        document.getElementById('event_instrument').value = "";
    }

    else {
        document.getElementById('event_instrument').removeAttribute("disabled");
    };
};