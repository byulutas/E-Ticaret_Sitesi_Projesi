package com.mycompany.e_ticaret_sitesi.dao;

import com.mycompany.e_ticaret_sitesi.entities.Kullanici;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class KullaniciDao {

    private SessionFactory factory;

    public KullaniciDao(SessionFactory factory) {
        this.factory = factory;
    }

    //get user by email ve sifre 
    public Kullanici getUserByEmailveSifre(String email, String sifre) {
        Kullanici kullanici = null;

        try {
            String query = "from kullanici where email=:e and sifre=:s";
            Session s = this.factory.openSession();
            Query q = s.createQuery(query);
            q.setParameter("e", email);
            q.setParameter("s", sifre);
            List<Kullanici> list = q.list();
            kullanici = (Kullanici) q.uniqueResult();

            s.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return kullanici;
    }

    public List<Kullanici> getAllKullanici() {
        Session s = this.factory.openSession();
        Query query = s.createQuery("from kullanici");
        List<Kullanici> list = query.list();
        return list;
    }
        public void updateKullanici(int kullanici_id, String kullanici_adi,String email,String sifre,String telefon,String resim,String adres,String kullanici_tipi) {
        Session session = this.factory.openSession();
        Transaction transaction = session.beginTransaction();
        Kullanici kullanici= (Kullanici)session.load(Kullanici.class, kullanici_id);
        kullanici.setKullanici_adi(kullanici_adi);
        kullanici.setEmail(email);
        kullanici.setSifre(sifre);
        kullanici.setTelefon(telefon);
        kullanici.setResim(resim);
        kullanici.setAdres(adres);
        kullanici.setKullanici_tipi(kullanici_tipi);
        session.update(kullanici);
        transaction.commit();
        session.close();  
    }
 
    public void deleteKullanici(Kullanici kullanici) {
        Session session = this.factory.openSession();
        Transaction transaction = session.beginTransaction();
        session.delete(kullanici);
        transaction.commit();
        session.close();
    } 
}


