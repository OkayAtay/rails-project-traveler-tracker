function Attraction(name, location, hours, price) {
  this.name = name;
  this.location = location;
  this.hours = hours;
  this.price = price;
}

Attraction.prototype.appendData = function() {
  $("#attractionName").text(`${this.name}`);
  $("#attractionLocation").text(`${this.location}`);
  $("#attractionHours").text(`${this.hours}`);
  $("#attractionPrice").text(`${this.price}`);
};

  $(function () {
    $(".js-next").on("click", function(e) {
      e.preventDefault()
      let nextId = parseInt($(".js-next").attr("data-id")) + 1;
      $.get("/attractions/" + nextId + ".json", function(data) {
        let attraction = new Attraction(data["name"], data["location"], data["hours"], data["price"]);
        attraction.appendData();
        $(".js-next").attr("data-id", data["id"]);
      });
    });
  });
