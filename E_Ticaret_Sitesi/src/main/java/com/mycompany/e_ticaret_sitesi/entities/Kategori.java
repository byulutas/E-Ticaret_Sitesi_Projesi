package com.mycompany.e_ticaret_sitesi.entities;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Kategori {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int kategori_id;
    private String kategori_baslik;
    private String kategori_aciklama;
    @OneToMany(mappedBy = "kategori")
    private List<Urun> urunler=new ArrayList<>();

    public Kategori() {
    }

    public Kategori(int kategori_id, String kategori_baslik, String kategori_aciklama) {
        this.kategori_id = kategori_id;
        this.kategori_baslik = kategori_baslik;
        this.kategori_aciklama = kategori_aciklama;
    }

    
    public Kategori(String kategori_baslik, String kategori_aciklama,List<Urun> urunler) {
        this.kategori_baslik = kategori_baslik;
        this.kategori_aciklama = kategori_aciklama;
        this.urunler=urunler;
    }

    public int getKategori_id() {
        return kategori_id;
    }

    public void setKategori_id(int kategori_id) {
        this.kategori_id = kategori_id;
    }

    public String getKategori_baslik() {
        return kategori_baslik;
    }

    public void setKategori_baslik(String kategori_baslik) {
        this.kategori_baslik = kategori_baslik;
    }

    public String getKategori_aciklama() {
        return kategori_aciklama;
    }

    public void setKategori_aciklama(String kategori_aciklama) {
        this.kategori_aciklama = kategori_aciklama;
    }

    public List<Urun> getUrunler() {
        return urunler;
    }

    public void setUrunler(List<Urun> urunler) {
        this.urunler = urunler;
    }

    @Override
    public String toString() {
        return "Kategori{" + "kategori_id=" + kategori_id + ", kategori_baslik=" + kategori_baslik + ", kategori_aciklama=" + kategori_aciklama + '}';
    }
    
    
}
