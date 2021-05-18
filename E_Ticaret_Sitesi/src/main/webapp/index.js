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
    // adding data to shopping cart 
    const iconShoppingP = document.querySelector('.iconShopping p');
    let no = 0;
    JSON.parse(localStorage.getItem('items')).map(data => {
        no = no + data.no
                ;
    });
    iconShoppingP.innerHTML = no;


    //adding cartbox data in table
    const cardBoxTable = cartBox.querySelector('table');
    let tableData = '';
    let toplamtutar = 0;
    tableData += '<tr><th>U no.</th><th>Urun Adi</th>   <th>  Adet</th>  <th> Fiyat</th>  <th>Toplam Tutar</th></tr>';
    if (JSON.parse(localStorage.getItem('items'))[0] === null) {
        tableData += '<tr><td colspan="5">No items found</td></tr>'
    } else {

        JSON.parse(localStorage.getItem('items')).map(data => {

            tableData += '<tr><td>' + data.id + '</td><td>' + data.name + '</td><td>' + data.no + '</td><td>        ' + data.price + '</td><td>' + data.no * data.price + '</td><td><button href="#"  class= "btn btn-danger btn-sm" onclick=Delete(this);>Delete</button></td></tr>'
            toplamtutar+=data.no*data.price;
        });
            tableData= tableData+ '<tr><th colspan= "5" class= "text-right font-weight-bold" >Toplam Tutar:'+toplamtutar+'</th></tr>'
    }

    cardBoxTable.innerHTML = tableData;

}
function goToCheckout(){
    window.location="checkout.jsp"
}

function goToNormal(){
    window.location="normal.jsp"
}