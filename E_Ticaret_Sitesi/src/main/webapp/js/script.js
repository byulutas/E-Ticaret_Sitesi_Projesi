function sepete_ekle(uid, uismi, fiyati)
{   
    let cart = localStorage.getItem("cart");
    if(cart == null)
    {
        //henüz alışveriş sepeti yok   
        let urunler=[];
        let urun={urunid: uid,urunismi: uismi,urunmiktar: 1,urunfiyati: fiyati};     
        urunler.push(urun);
        localStorage.setItem("cart",JSON.stringify(urunler));
        console.log( "Bu  ürün ilk kez üretildi");
    }else{

        //alışveriş sepeti zaten mevcut
        let pcart=JSON.parse(cart);
        let oldUrun=pcart.find((item)=>item.urunid=uid);
        if(oldUrun)
        {
            // we have to increse the quatity
            oldUrun.urunmiktar = oldUrun.urunmiktar + 1
            pcart.map((item) =>{   
                if(item.urunid == oldUrun.urunid)
                {
                    
                    item.urunmiktar = oldUrun.urunmiktar;
                }
            })
             localStorage.setItem("cart",JSON.stringify(pcart));
             console.log("ürün miktarı arttı")
        }else
        {
            // we have add the product
            let urun ={urunid:uid,urunismi:uismi,urunmiktar:1,urunfiyati:fiyati}
            pcart.push(urun)
            localStorage.setItem("cart",JSON.stringify(pcart));
            console.log("ürün eklendi")
        }
    }

}

