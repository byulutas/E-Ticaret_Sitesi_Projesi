package com.mycompany.e_ticaret_sitesi.dao;

import com.mycompany.e_ticaret_sitesi.entities.Kategori;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class KategoriDao {

    private SessionFactory factory;

    public KategoriDao(SessionFactory factory) {
        this.factory = factory;
    }

    //kategori veritabanına kaydeder
    public int saveCategory(Kategori kat) {
        Session session = this.factory.openSession();
        Transaction tx = session.beginTransaction();
        int katId = (int) session.save(kat);
        tx.commit();

        session.close();
        return  katId;
    }
    public List<Kategori> getCategories(){
        Session s=this.factory.openSession();
        Query query= s.createQuery("from Kategori");
        List<Kategori> list=query.list();
        return  list;
    }
    public  Kategori getKategoriById(int kid){
        Kategori kat=null;
        try{
            Session session=this.factory.openSession();
            kat=session.get(Kategori.class,kid);
            session.close();
        }catch(Exception e){
            e.printStackTrace();
        
        }
        return kat;
    }

 
    public void updateKategori(int kategori_id,String kategori_baslik,String kategori_aciklama) {
        Session session = this.factory.openSession();
        Transaction transaction = session.beginTransaction();
        Kategori kategori= (Kategori)session.load(Kategori.class, kategori_id);
        kategori.setKategori_baslik(kategori_baslik);
        kategori.setKategori_aciklama(kategori_aciklama);
        session.update(kategori);
        transaction.commit();
        session.close();  
    }
 
    public void deleteKategori(Kategori kategori) {
        Session session = this.factory.openSession();
        Transaction transaction = session.beginTransaction();
        session.delete(kategori);
        transaction.commit();
        session.close();
    } 
}
