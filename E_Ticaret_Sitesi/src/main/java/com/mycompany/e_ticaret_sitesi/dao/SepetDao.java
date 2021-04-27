package com.mycompany.e_ticaret_sitesi.dao;

import com.mycompany.e_ticaret_sitesi.entities.Sepet;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class SepetDao {

    private SessionFactory factory;

    public SepetDao(SessionFactory factory) {
        this.factory = factory;
    }

    public boolean saveSepet(Sepet sepet) {
        boolean f = false;
        try {
            Session session = this.factory.openSession();
            Transaction tx = session.beginTransaction();

            session.save(sepet);

            tx.commit();
            session.close();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
            f = false;
        }

        return f;

    }

    public List<Sepet> getAllSepet() {
        Session s = this.factory.openSession();
        Query query = s.createQuery("from  Sepet");
        List<Sepet> list = query.list();
        return list;
    }

    public List<Sepet> getAllUrunById(int kid) {
        String query ="from sepet where  kullanıcı_id=:id";
        Session s = this.factory.openSession();
        Query q = s.createQuery(query);
        q.setParameter("id", kid);
        List<Sepet> list = q.list();
        return list;
    }

}
