window.addEventListener('load', () => {
  const price = document.getElementById('item-price');
  if (price === null) {
    return;
  }
  price.addEventListener('input', () => {
    const priceValue = price.value;
    const fee = document.getElementById('add-tax-price');
    const profit = document.getElementById('profit');
    const feeNum = priceValue * 0.1;
    fee.innerHTML = Math.floor(feeNum);
    profit.innerHTML = Math.ceil(priceValue - feeNum);
  });
});