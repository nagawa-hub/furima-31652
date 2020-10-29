function calc (){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const itemTax = Math.floor(inputValue * 0.1);
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = itemTax
    const itemProfit = document.getElementById("profit");
    itemProfit.innerHTML = inputValue - itemTax
  });
};

window.addEventListener('load',calc)