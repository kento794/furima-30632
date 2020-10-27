function price (){
    const itemPrice = document.getElementById("item-price");
    itemPrice.addEventListener('keyup',() => {
        const addTaxPrice = document.getElementById('add-tax-price');
        const addTaxPriceVal = itemPrice.value * 0.1;
        const Profit = document.getElementById('profit');
        const ProfitVal = itemPrice.value - addTaxPriceVal;
        addTaxPrice.innerHTML = `${Math.floor(addTaxPriceVal)}`;
        Profit.innerHTML = `${Math.floor(ProfitVal)}`;

    });
};
window.addEventListener("load", price);



