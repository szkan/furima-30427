function calculation (){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("keyup", () =>{
    const taxPrice = document.getElementById("add-tax-price");
    const tax = Math.floor(priceInput.value * 0.1);
    const profit = document.getElementById("profit")
    const pro = Math.floor(priceInput.value - tax);
    taxPrice.innerHTML = `${tax}`;
    profit.innerHTML = `${pro}`;
  });
}

window.addEventListener('load', calculation);