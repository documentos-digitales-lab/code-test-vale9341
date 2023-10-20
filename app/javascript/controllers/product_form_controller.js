import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="product-form"
export default class extends Controller {
  static targets = ["subtotal", "tax", "total", "amountMessage"]

  calculateSubTotal () {
    var subtotal = 0
    this.element.querySelectorAll(".product_amounts").forEach(element => {
      subtotal += parseFloat(element.value || 0)
    })
    this.subtotalTarget.textContent = subtotal
    this.message(subtotal)
    this.calculateTax(subtotal)
  }

  calculateTax (subtotal) {
    var tax = subtotal * 0.16
    this.taxTarget.textContent = tax
    this.calculateTotal(subtotal, tax)
  }

  calculateTotal (subtotal, tax) {
    var total = subtotal + tax
    this.totalTarget.textContent = total
  }

  message (subtotal) {
    var msg = "No additional taxes are necessary."
    var colorMsg = "black"
    if (subtotal >= 2000) {
      msg = "It's necessary add additional taxes."
      colorMsg = "red"
    }
    this.element.querySelector(".msg-amount").style.color = colorMsg
    this.amountMessageTarget.textContent = msg
  }
}
