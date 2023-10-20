import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="product-item"
export default class extends Controller {
  static targets = ["quantity", "unitPrice", "amount"]

  calculateAmount(){
    const amount = this.quantity() * this.unitPrice()
    this.amountTarget.value = amount
    const trigger = new CustomEvent("update-amounts")
    window.dispatchEvent(trigger)
  }

  quantity () {
    return parseFloat(this.quantityTarget.value || 0)
  }

  unitPrice () {
    return parseFloat(this.unitPriceTarget.value || 0)
  }
}
