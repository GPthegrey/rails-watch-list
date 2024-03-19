import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "form", "item" ]

  connect() {
    console.log(this.formTarget)
    console.log(this.formTarget.action)
  }

  send(event) {
    event.preventDefault();
    console.log(this.formTarget)
    console.log(this.itemTarget)

    fetch("http://localhost:3000/lists/18/review", {
      method: "POST",
      headers: { "Accept": "application/json" },
      body: new FormData(this.formTarget)
    })
    .then(response => response.json())
    .then((data) => {
      if (data.inserted_item) {
        this.itemTarget.insertAdjacentHTML("beforeend", data.inserted_item);
        this.formTarget.reset(); // Reset the form after successful submission
      } else {
        console.error("Error inserting review");
      }
    })
    .catch(error => console.error("Error:", error));
  }
}
