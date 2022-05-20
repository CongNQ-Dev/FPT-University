let myCart = document.getElementById("myCart");
let cartItem = document.getElementsByClassName("cartItem");
let emptyCart = document.getElementById("emptyCart");

const checkEmptyCart = (e) => {
  if (cartItem.length <= 0) {
    emptyCart.style.visibility = "visible";
    emptyCart.style.setProperty("background-color", "#eee", "important");
    myCart.remove();
  } else {
    emptyCart.style.visibility = "hidden";
  }
};
const deleteItem = (e) => {
  e.parentNode.parentNode.parentNode.parentNode.parentNode.remove();
  checkEmptyCart(e);
};

const onMinusProduct = (e) => {
  e.parentNode.querySelector("input[type=number]").stepDown();
  let value = e.parentNode.querySelector("input[type=number]").value;
  if (value <= 0) {
    e.parentNode.parentNode.parentNode.parentNode.remove();
  }
  checkEmptyCart(e);
};
