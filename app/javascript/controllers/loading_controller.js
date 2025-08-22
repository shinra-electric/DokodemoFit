import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="loading"
export default class extends Controller {
  static targets = ["button"]

  connect() {
    console.log("We in!")
  }


  start(event) {
    console.log("clicked")
    const div = this.element;
    div.insertAdjacentHTML(
      "beforeend",
      '<div class="btn btn-primary fs-4 disabled"><i class="fa-solid fa-yin-yang fa-spin"></i></div>'
    );
    event.currentTarget.remove();
    this.element.requestSubmit();
  }

  // start() {
  //   console.log("start")
  //   this.buttonTarget.value = '<i class="fa-solid fa-yin-yang fa-spin"></i>'
  //   this.buttonTarget.disabled = true
  // }

  // stop() {
  //   this.iconTarget.style.display = 'none'
  //   this.iconTarget.classList.remove('fa-spin')
  //   this.buttonTarget.disabled = false
  // }
}
