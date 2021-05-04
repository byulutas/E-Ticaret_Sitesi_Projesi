window.onload = function () {
    //cart box
    const iconShopping = document.querySelector('.iconShopping');
    const cartCloseBtn = document.querySelector('.fa-close');
    const cartBox = document.querySelector('.cartBox');
    iconShopping.addEventListener("click", function () {
        cartBox.classList.add('active');
    });
    cartCloseBtn.addEventListener("click", function () {
        cartBox.classList.remove('active');
    });


    // adding data to localstorage
    const attToCartBtn = document.getElementsByClassName('attToCart');
    let items = [];
    for (let i = 0; i < attToCartBtn.length; i++) {
        attToCartBtn[i].addEventListener("click", function (e) {
            if (typeof (Storage) !== 'undefined') {
                let item = {
                    id: i + 1,
                    name: e.target.parentElement.children[0].textContent,
                    price: e.target.parentElement.children[1].children[0].textContent,
                    no: 1
                };
                if (JSON.parse(localStorage.getItem('items')) === null) {
                    items.push(item);
                    localStorage.setItem("items", JSON.stringify(items));
                    window.location.reload();
                } else {
                    const localItems = JSON.parse(localStorage.getItem("items"));
                    localItems.map(data => {
                        if (item.id == data.id) {
                            item.no = data.no + 1;
                        } else {
                            items.push(data);
                        }
                    });
                    items.push(item);
                    localStorage.setItem('items', JSON.stringify(items));
                    window.location.reload();
                }
            } else {
                alert('local storage is not working on your browser');
            }
        });
    }


}
function goToCheckout(){
    window.location="checkout.jsp"
}