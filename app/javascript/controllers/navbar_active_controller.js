import { Controller } from "@hotwired/stimulus"
export default class extends Controller {
  connect(){
    console.log("navbar active controller connected")
  }

  activate() {
    this.element.setAttribute("active")
  }

  // static targets = ["nav-item"]
  // display() {
  //   this.activeTarget.classList.add("active")
  //   console.log("display")
  // }

}

// currentPage = location.href;
// navElement = document.getElementsByClassName("nav-btn")

// for (let i = 0; i < navElement.length; i++) {
//   navElement[i].classList.remove('active');
//   if (navElement[i].href === currentPage) {
//     navElement[i].className = "nav-btn active";
//   }
// }
