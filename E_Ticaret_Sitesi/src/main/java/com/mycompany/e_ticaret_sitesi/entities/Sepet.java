package com.mycompany.e_ticaret_sitesi.entities;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


public class Sepet {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    
    @Column(length = 100, name = "email")
    private String email;
    private int urun_id;
    private  int adet;
    private  int  fiyat;
    private  int toplam;
    private int telefon;    
    @Column(length = 10, name = "durum")
    private  String durum;

    public Sepet() {
    }

    public Sepet(String email, int urun_id, int adet, int fiyat, int toplam, int telefon, String durum) {
        this.email = email;
        this.urun_id = urun_id;
        this.adet = adet;
        this.fiyat = fiyat;
        this.toplam = toplam;
        this.telefon = telefon;
        this.durum = durum;
    }

    
    
    
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getUrun_id() {
        return urun_id;
    }

    public void setUrun_id(int urun_id) {
        this.urun_id = urun_id;
    }

    public int getAdet() {
        return adet;
    }

    public void setAdet(int adet) {
        this.adet = adet;
    }

    public int getFiyat() {
        return fiyat;
    }

    public void setFiyat(int fiyat) {
        this.fiyat = fiyat;
    }

    public int getToplam() {
        return toplam;
    }

    public void setToplam(int toplam) {
        this.toplam = toplam;
    }

    public int getTelefon() {
        return telefon;
    }

    public void setTelefon(int telefon) {
        this.telefon = telefon;
    }

    public String getDurum() {
        return durum;
    }

    public void setDurum(String durum) {
        this.durum = durum;
    }

    @Override
    public String toString() {
        return "Sepet{" + "email=" + email + ", urun_id=" + urun_id + ", adet=" + adet + ", fiyat=" + fiyat + ", toplam=" + toplam + ", telefon=" + telefon + ", durum=" + durum + '}';
    }
    
    
    
}
