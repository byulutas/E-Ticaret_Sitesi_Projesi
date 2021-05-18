package com.mycompany.e_ticaret_sitesi.dao;

import com.mycompany.e_ticaret_sitesi.entities.Kategori;
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
        String query = "from Urun";
        Session s = this.factory.openSession();
        Query q = s.createQuery(query);
        List<Urun> list = q.list();
        return list;
    }

    //verilen kategorideki tüm ürünleri al
    public List<Urun> getAllUrunById(int kid) {
        String query = "from Urun where kategori_kategori_id=:id";
        Session s = this.factory.openSession();
        Query q = s.createQuery(query);
        q.setParameter("id", kid);
        List<Urun> list = q.list();
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

    public Urun getUrunId(int id) {
        Transaction transaction = null;
        Urun urun = null;
        try (Session session = this.factory.openSession()) {
            // start a transaction
            transaction = session.beginTransaction();
            // get an user object
            urun = session.get(Urun.class, id);
            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return urun;

    }

    public void updateUrun(int urun_id, String urun_adi, String urun_aciklama, String urun_resmi, int urun_fiyati, int indirim, int urun_adeti, Kategori kategori) {
        Session session = this.factory.openSession();
        Transaction transaction = session.beginTransaction();
        Urun urun = (Urun) session.load(Urun.class, urun_id);
        urun.setUrun_adi(urun_adi);
        urun.setUrun_aciklama(urun_aciklama);
        urun.setUrun_resmi(urun_resmi);
        urun.setUrun_fiyati(urun_fiyati);
        urun.setIndirim(indirim);
        urun.setUrun_adeti(urun_adeti);
        urun.setKategori(kategori);
        session.update(urun);
        transaction.commit();
        session.close();
    }

    public void deleteUrun(Urun urun) {
        Session session = this.factory.openSession();
        Transaction transaction = session.beginTransaction();
        session.delete(urun);
        transaction.commit();
        session.close();
    }

}
