/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.e_ticaret_sitesi.entities;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity(name = "kullanici")
public class Kullanici {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)

    @Column(length = 10, name = "kullanici_id")
    private int kullanici_id;
    @Column(length = 100, name = "kullanici_adi")
    private String kullanici_adi;
    @Column(length = 100, name = "email")
    private String email;
    @Column(length = 100, name = "sifre")
    private String sifre;
    @Column(length = 12, name = "telefon")
    private String telefon;
    @Column(length = 1500, name = "resim")
    private String resim;
    @Column(length = 1500, name = "adres")
    private String adres;

    @Column(name="kullanici_tipi")
    private String kullanici_tipi;
    
    public Kullanici(int kullanici_id, String kullanici_adi, String email, String sifre, String telefon, String resim, String adres,String kullanici_tipi) {
        this.kullanici_id = kullanici_id;
        this.kullanici_adi = kullanici_adi;
        this.email = email;
        this.sifre = sifre;
        this.telefon = telefon;
        this.resim = resim;
        this.adres = adres;
        this.kullanici_tipi=kullanici_tipi;
    }

    public Kullanici(String kullanici_adi, String email, String sifre, String telefon, String resim, String adres ,String kullanici_tipi) {
        this.kullanici_adi = kullanici_adi;
        this.email = email;
        this.sifre = sifre;
        this.telefon = telefon;
        this.resim = resim;
        this.adres = adres;
        this.kullanici_tipi=kullanici_tipi;
    }   

    public Kullanici() {
    }

    public int getKullanici_id() {
        return kullanici_id;
    }

    public void setKullanici_id(int kullanici_id) {
        this.kullanici_id = kullanici_id;
    }

    public String getKullanici_adi() {
        return kullanici_adi;
    }

    public void setKullanici_adi(String kullanici_adi) {
        this.kullanici_adi = kullanici_adi;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSifre() {
        return sifre;
    }

    public void setSifre(String sifre) {
        this.sifre = sifre;
    }

    public String getTelefon() {
        return telefon;
    }

    public void setTelefon(String telefon) {
        this.telefon = telefon;
    }

    public String getResim() {
        return resim;
    }

    public void setResim(String resim) {
        this.resim = resim;
    }

    public String getAdres() {
        return adres;
    }

    public void setAdres(String adres) {
        this.adres = adres;
    }

    public String getKullanici_tipi() {
        return kullanici_tipi;
    }

    public void setKullanici_tipi(String kullanici_tipi) {
        this.kullanici_tipi = kullanici_tipi;
    }


    @Override
    public String toString() {
        return "Kullanici{" + "kullanici_id=" + kullanici_id + ", kullanici_adi=" + kullanici_adi + ", email=" + email + ", sifre=" + sifre + ", telefon=" + telefon + ", resim=" + resim + ", adres=" + adres + '}';
    }

    
    
    
    
}
