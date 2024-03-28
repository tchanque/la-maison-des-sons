document.getElementById('event_category').onchange = function () {

    this.instrument_form = document.getElementById('instrument_form');
    this.instrument_input = document.getElementById('event_instrument');

    this.max_seats_form = document.getElementById('max_seats_form');
    this.max_seats_input = document.getElementById('event_max_seats');

    this.price_form = document.getElementById('price_form');
    this.price_input = document.getElementById('event_price');
    
    this.level_form = document.getElementById('level_form');
    this.level_input = document.getElementById('event_level');

    let music_shows = ["Concert", "Scène ouverte"]

    if (music_shows.includes(this.value)) {
        this.instrument_form.setAttribute("hidden", true);
        this.instrument_input.value = "";

        this.max_seats_form.setAttribute("hidden", true);
        this.max_seats_input.value = 0;

        this.price_form.setAttribute("hidden", true);
        this.price_input.value = 0;

        this.level_form.setAttribute("hidden", true);
        this.level_input.value = 0;
    }

    else {
        this.instrument_form.removeAttribute("hidden");
        this.max_seats_form.removeAttribute("hidden");
        this.price_form.removeAttribute("hidden");
        this.level_form.removeAttribute("hidden");
    };
};