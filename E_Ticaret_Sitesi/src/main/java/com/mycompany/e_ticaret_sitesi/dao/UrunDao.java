package com.mycompany.e_ticaret_sitesi.dao;

import com.mycompany.e_ticaret_sitesi.entities.Urun;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class UrunDao {

    private SessionFactory factory;

    public UrunDao(SessionFactory factory) {
        this.factory = factory;
    }
    //tüm ürünleri al

    public List<Urun> getAllUrun() {
        Session s = this.factory.openSession();
        Query query = s.createQuery("from Urun");
        List<Urun> list = query.list();
        return list;
    }

    //verilen kategorideki tüm ürünleri al
    public List<Urun> getAllUrunById(int kid) {
        Session s = this.factory.openSession();
        Query query = s.createQuery("from Urun  as u where  u.kategori.kategori_id= :kid");
        query.setParameter("kid", kid);
        List<Urun> list = query.list();
        return list;
    }    
    
    public boolean saveUrun(Urun urun) {
        boolean f = false;
        try {
            Session session = this.factory.openSession();
            Transaction tx = session.beginTransaction();

            session.save(urun);

            tx.commit();
            session.close();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
            f = false;
        }

        return f;

    }

}
