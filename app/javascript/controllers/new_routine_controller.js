import { Controller } from "@hotwired/stimulus";

export default class extends Controller {

  connect() {
    console.log("connected");
  }

  back(event) {
    console.log("connected");
    alert("Routine task added successfully!");
    const mainPage = document.getElementById("main_page");
    mainPage.scrollIntoView({ behavior: "smooth" });
  }
}
