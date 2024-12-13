function calculatePrice() {
  const priceInput = document.getElementById("item-price");
  
  if (priceInput) {
    priceInput.addEventListener("input", () => {
      const inputValue = priceInput.value;
      
      const addTaxDom = document.getElementById("add-tax-price");
      if (addTaxDom) {
        const tax = Math.floor(inputValue * 0.1);
        addTaxDom.innerHTML = tax;
      }

      const profitDom = document.getElementById("profit");
      if (profitDom) {
        const tax = Math.floor(inputValue * 0.1);
        const profit = Math.floor(inputValue - tax);
        profitDom.innerHTML = profit;
      }
    });
  }
}

window.addEventListener('turbo:load', calculatePrice);
window.addEventListener('turbo:render', calculatePrice);
window.addEventListener('load', calculatePrice);