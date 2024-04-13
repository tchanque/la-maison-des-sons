// This javascript code will adapt the form and hide certain fields depending on the value of the event_category
// If the event category is set as Concert or Scene Ouverte, then we should not show the following fields : instrument, price, max seats and level
// otherwise, we show all the fields

document.addEventListener("DOMContentLoaded", function() {
    // Define the function containing your script
    function handleEventCategoryChange() {
        let eventCategory = document.getElementById('event_category');
        let instrumentForm = document.getElementById('instrument_form');
        let instrumentInput = document.getElementById('event_instrument');
        let maxSeatsForm = document.getElementById('max_seats_form');
        let maxSeatsInput = document.getElementById('event_max_seats');
        let priceForm = document.getElementById('price_form');
        let priceInput = document.getElementById('event_price');
        let levelForm = document.getElementById('level_form');
        let levelInput = document.getElementById('event_level');

        let musicShows = ["Concert", "Scène ouverte"];

        console.log(eventCategory.value);

        if (musicShows.includes(eventCategory.value)) {
            instrumentForm.setAttribute("hidden", true);
            instrumentInput.value = "";
            instrumentInput.setAttribute("required", false);
        
            maxSeatsForm.setAttribute("hidden", true);
            maxSeatsInput.value = 0;
        
            priceForm.setAttribute("hidden", true);
            priceInput.value = 0;
        
            levelForm.setAttribute("hidden", true);
            levelInput.value = 0;

        } else if (eventCategory.value === "Permanence") {
            // Permanence => Free
            priceForm.setAttribute("hidden", true);
            priceInput.value = 0;

            instrumentForm.removeAttribute("hidden");
            instrumentInput.setAttribute("required", true)
            maxSeatsForm.removeAttribute("hidden");
            levelForm.removeAttribute("hidden");

            // Atelier, Stage => Not Free
        } else {
            instrumentForm.removeAttribute("hidden");
            instrumentInput.setAttribute("required", true)
            maxSeatsForm.removeAttribute("hidden");
            priceForm.removeAttribute("hidden");
            levelForm.removeAttribute("hidden");
        }
    }

    // Call the function when the page loads
    handleEventCategoryChange();

    // Call the function when the event_category div changes
    document.getElementById('event_category').addEventListener('change', handleEventCategoryChange);
});
