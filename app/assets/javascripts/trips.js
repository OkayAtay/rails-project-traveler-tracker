//This function presents the CM with trips#index
// document.addEventListener("DOMContentLoaded")
$(function () {
  $("#indexTrips").on("click", function(e) {
    e.preventDefault()
    let id = parseInt($("#indexTrips").attr("data-id"));
    $.get("/travelers/" + id + "/trips", function(data) {
      let trips = data;
      // inject the code into the View
      $("div.form").html("")
      trips.forEach(function(trip){
        let trip_element = document.createElement("a");
        trip_element.href = "#";
        // trip_element.href = id + "/trips/" + trip.id ;
        trip_element.innerHTML = trip.name;
        trip_element.dataset.id = trip.id;
        trip_element.dataset.travelerid = trip.traveler_id;
        trip_element.className = "tripLink";
        $("div.form").append(trip_element);
        $("div.form").append(document.createElement("br"))
      })
    }, "json");
  });

  $(".form").on("click", ".tripLink", function(e){
    e.preventDefault()
    let traveler_id = this.getAttribute("data-travelerid")
    let trip_id = this.getAttribute("data-id")
    $.get("/travelers/" + traveler_id + "/trips/" + trip_id , function(data) {
      $("div.form").html("");
      let trip = data;
      let trip_name = document.createElement("h2");
      trip_name.innerHTML = trip.name;
      $("div.form").append(trip_name);
      trip.attractions.forEach(function(attraction){
        let trip_attraction = document.createElement("p");
        trip_attraction.innerHTML = attraction.name;
        $("div.form").append(trip_attraction);
      })
    }, "json");
  });
});

//This function displays a form to create a new Attraction
$(function displayCreateAttractionForm(){
  $("#createAttraction").on("click", function(e){
    e.preventDefault()
    let newForm = document.getElementById('createNewAttraction');
    newForm.style.display="block";
  })
})

//This function CREATES a new attraction, which can be seen in the drop down options

$(function newAttraction(){
  $("form#new_attraction").on("submit", function(e){
    //Step 2. gather data and submit form with AJAX
    e.preventDefault()
    //create new attraction
    let $form = $('form#new_attraction');
    let params = $form.serialize();
    let action = $form.attr('action');
    let posting = $.post(action, params);
    posting.done(function(data){
      let attraction = data;
      //make sure the two below are actually == to what we want
      let doc = new DOMParser().parseFromString(attraction, 'text/html');
      let element = doc.getElementsByClassName('js-next')
      let id = element[0].getAttribute("data-id");
      let name = doc.getElementById("attractionName").innerHTML
    //create checkbox
      const checkbox = document.createElement('input');
      checkbox.type = "checkbox";
      const br = document.createElement('br');
    //ascribe value to checkbox
      checkbox.name = "trip[attraction_ids][]"
      checkbox.setAttribute("id", `trip_attraction_ids_${id}`)
      checkbox.setAttribute("value", `${id}`)
      var label = document.createElement('LABEL')
      var label_name = document.createTextNode(`${id}`)
      var label_name = document.createTextNode(`${name}`)
      label.setAttribute("for", `trip_attraction_ids_${id}`)
      label.appendChild(label_name)
    //append checkbox with values to form
      $('#attraction_boxes').after(br);
      $('#attraction_boxes').after(label);
      $('#attraction_boxes').after(checkbox);
    //AND FINALLY clear the FORM
      document.getElementById("new_attraction").reset();
    })
  })
})
