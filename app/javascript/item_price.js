window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    
    // 販売手数料（10%）の計算と表示（小数点以下切り捨て）
    const addTaxDom = document.getElementById("add-tax-price");
    const tax = Math.floor(inputValue * 0.1);
    addTaxDom.innerHTML = tax;

    // 販売利益の計算と表示（小数点以下切り捨て）
    const profitDom = document.getElementById("profit");
    const profit = Math.floor(inputValue - tax);
    profitDom.innerHTML = profit;
  });
});