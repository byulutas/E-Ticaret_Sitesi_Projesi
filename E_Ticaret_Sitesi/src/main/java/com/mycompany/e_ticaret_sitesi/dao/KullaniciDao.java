package com.mycompany.e_ticaret_sitesi.dao;

import com.mycompany.e_ticaret_sitesi.entities.Kullanici;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
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

            String query = "from kullanici  where email=e and sifre=s";
            Session session = this.factory.openSession();
            Query q = session.createQuery(query);
            q.setParameter("e", email);
            q.setParameter("s", sifre);
            kullanici = (Kullanici) q.uniqueResult();

            session.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return kullanici;
    }
}
