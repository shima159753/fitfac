const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
 
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);
 
    const card = {
      number: formData.get("number"),
      cvc: formData.get("cvc"),
      exp_month: formData.get("exp_month"),
      exp_year: `20${formData.get("exp_year")}`,
    };
 
    Payjp.createToken(card, (status, response) => {
      if (status === 200) {
        const token = response.id;
        const cardid = response.card.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='card_token' type="hidden">`;
        const tokenObj2 = `<input value=${cardid} name='car_token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
        renderDom.insertAdjacentHTML("beforeend", tokenObj2);
        
        document.getElementById("number").removeAttribute("name");
        document.getElementById("cvc").removeAttribute("name");
        document.getElementById("exp_month").removeAttribute("name");
        document.getElementById("exp_year").removeAttribute("name");
 
        document.getElementById("charge-form").submit();
      }
      else {
        alert("カード情報が無効です")?"":location.reload();
      }
    });
  });
 };
 
 window.addEventListener("load", pay);