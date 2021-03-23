package com.mycompany.e_ticaret_sitesi.entities;

import java.util.Locale.Category;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Urun {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int urun_id;
    private String urun_adi;
    @Column(length=3000)
    private String urun_aciklama;
    private String urun_resmi;
    private int urun_fiyati;
    private int indirim;
    private int urun_adeti;
    @ManyToOne
    private Kategori kategori;

    public Urun() {
    }

    public Urun(String urun_adi, String urun_aciklama, String urun_resmi, int urun_fiyati, int indirim, int urun_adeti,Kategori kategori){
        this.urun_adi = urun_adi;
        this.urun_aciklama = urun_aciklama;
        this.urun_resmi = urun_resmi;
        this.urun_fiyati = urun_fiyati;
        this.indirim = indirim;
        this.urun_adeti = urun_adeti;
        this.kategori=kategori;
    }

    public int getUrun_id() {
        return urun_id;
    }

    public void setUrun_id(int urun_id) {
        this.urun_id = urun_id;
    }

    public String getUrun_adi() {
        return urun_adi;
    }

    public void setUrun_adi(String urun_adi) {
        this.urun_adi = urun_adi;
    }

    public String getUrun_aciklama() {
        return urun_aciklama;
    }

    public void setUrun_aciklama(String urun_aciklama) {
        this.urun_aciklama = urun_aciklama;
    }

    public String getUrun_resmi() {
        return urun_resmi;
    }

    public void setUrun_resmi(String urun_resmi) {
        this.urun_resmi = urun_resmi;
    }

    public int getUrun_fiyati() {
        return urun_fiyati;
    }

    public void setUrun_fiyati(int urun_fiyati) {
        this.urun_fiyati = urun_fiyati;
    }

    public int getIndirim() {
        return indirim;
    }

    public void setIndirim(int indirim) {
        this.indirim = indirim;
    }

    public int getUrun_adeti() {
        return urun_adeti;
    }

    public void setUrun_adeti(int urun_adeti) {
        this.urun_adeti = urun_adeti;
    }

    public Kategori getKategori() {
        return kategori;
    }

    public void setKategori(Kategori kategori) {
        this.kategori = kategori;
    }

    @Override
    public String toString() {
        return "Urun{" + "urun_id=" + urun_id + ", urun_adi=" + urun_adi + ", urun_aciklama=" + urun_aciklama + ", urun_resmi=" + urun_resmi + ", urun_fiyati=" + urun_fiyati + ", indirim=" + indirim + ", urun_adeti=" + urun_adeti + '}';
    }
    //indirimden sonra hesaplanan fiyatı
    public int getIndirimdenSonraFiyat(){
        int d=(int)((this.getIndirim()/100.0)*this.getUrun_fiyati());
        return this.getUrun_fiyati()-d;
    }
    
}
