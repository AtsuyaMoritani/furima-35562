window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);
    const Tax = 0.10;
    const addTaxDom = document.getElementById("add-tax-price");
    const TaxPrice = inputValue * Tax;
    addTaxDom.innerHTML = Math.floor(TaxPrice);
    const sellingPrice = document.getElementById("profit");
    sellingPrice.innerHTML = Math.floor(inputValue - TaxPrice);
  })
});