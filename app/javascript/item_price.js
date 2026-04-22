const price = () => {
  // 【手順2】金額入力欄の要素を取得
  const priceInput = document.getElementById("item-price");
  
  // 入力欄がないページではエラーにならないよう、ここで終了させる
  if (!priceInput) return;

  // 【手順3】入力するたびにイベントを発火
  priceInput.addEventListener("input", () => {
    // 【手順4】入力した数値を取得
    const inputValue = priceInput.value;

    // 【手順5】販売手数料と利益を表示する場所を取得
    const addTaxDom = document.getElementById("add-tax-price");
    const profitDom = document.getElementById("profit");

    // 計算処理（手数料10%）
    const tax = Math.floor(inputValue * 0.1);
    const profit = inputValue - tax;

    // 計算結果をHTMLに書き換える
    addTaxDom.innerHTML = tax;
    profitDom.innerHTML = profit;
  });
};

// 【手順6】ページ読み込み時とTurbo遷移時に発火
window.addEventListener('turbo:load', price);
window.addEventListener('turbo:render', price);