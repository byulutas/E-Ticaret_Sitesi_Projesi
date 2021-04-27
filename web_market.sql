/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 8.0.23 : Database - webmarket1
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`webmarket1` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `webmarket1`;

/*Table structure for table `kategori` */

DROP TABLE IF EXISTS `kategori`;

CREATE TABLE `kategori` (
  `kategori_id` bigint NOT NULL AUTO_INCREMENT,
  `kategori_baslik` varchar(100) DEFAULT NULL,
  `kategori_aciklama` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`kategori_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `kategori` */

insert  into `kategori`(`kategori_id`,`kategori_baslik`,`kategori_aciklama`) values 
(1,'Laptop ','Bu kategori farkli dizıustu bilgisayar turlerini icerir'),
(2,'Cep Telefonları','Bu kategori tum son cep telefonlarini icerir'),
(3,'Beyaz Esya','Bu kategori farkli beyaz esya turlerini icerir'),
(4,'Tv ve Goruntu','Bu kategori farkli tv ve goruntu turlerini icerir'),
(5,'Foto ve Kamera','Bu kategori farkli foto ve kamera turlerini icerir'),
(6,'Tablet','Bu kategori farkli tablet turlerini icerir'),
(7,'Tablet','Bu kategori farkli tablet turlerini icerir');

/*Table structure for table `kullanici` */

DROP TABLE IF EXISTS `kullanici`;

CREATE TABLE `kullanici` (
  `kullanici_id` bigint NOT NULL AUTO_INCREMENT,
  `kullanici_adi` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `sifre` varchar(100) DEFAULT NULL,
  `telefon` varchar(12) DEFAULT NULL,
  `resim` varchar(1500) DEFAULT NULL,
  `adres` varchar(1500) DEFAULT NULL,
  `kullanici_tipi` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`kullanici_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `kullanici` */

insert  into `kullanici`(`kullanici_id`,`kullanici_adi`,`email`,`sifre`,`telefon`,`resim`,`adres`,`kullanici_tipi`) values 
(1,'ahmet','ahmet44@gmail.com','ahmet123','05436789425','default.jpg','Malatya','admin'),
(2,'mehmet44','mehmet44@gmail.com','ahmet123','05375489761','default.jpg','Malatya','normal');

/*Table structure for table `sepet` */

DROP TABLE IF EXISTS `sepet`;

CREATE TABLE `sepet` (
  `email` varchar(100) NOT NULL,
  `urun_id` int DEFAULT NULL,
  `adet` int DEFAULT NULL,
  `fiyat` int DEFAULT NULL,
  `toplam` int DEFAULT NULL,
  `telefon` bigint DEFAULT NULL,
  `durum` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `sepet` */

/*Table structure for table `urun` */

DROP TABLE IF EXISTS `urun`;

CREATE TABLE `urun` (
  `urun_id` bigint NOT NULL AUTO_INCREMENT,
  `urun_adi` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `urun_aciklama` varchar(3000) DEFAULT NULL,
  `urun_resmi` varchar(1500) DEFAULT NULL,
  `urun_fiyati` bigint DEFAULT NULL,
  `indirim` bigint DEFAULT NULL,
  `urun_adeti` bigint DEFAULT NULL,
  `kategori_kategori_id` bigint DEFAULT NULL,
  PRIMARY KEY (`urun_id`),
  KEY `fkategori_key` (`kategori_kategori_id`),
  CONSTRAINT `fkategori_key` FOREIGN KEY (`kategori_kategori_id`) REFERENCES `kategori` (`kategori_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `urun` */

insert  into `urun`(`urun_id`,`urun_adi`,`urun_aciklama`,`urun_resmi`,`urun_fiyati`,`indirim`,`urun_adeti`,`kategori_kategori_id`) values 
(1,'HUAWEI Matebook D15 15.6\"','islemci: i5- 10th Generation IntelÂ® CoreTM i5-10210U Ekran kartÄ±: Intel UHD Graphics 620 (Entegre Grafik KartÄ±) Sabit disk kapasitesi: 256 GB Ekran Boyutu: - / 15.6 inÃ§ ÃÃ¶zÃ¼nÃ¼rlÃ¼k: 1920 x 1080 GÃ¶rÃ¼ntÃ¼ kalitesi: Full-HD Ekran Boyutu (inÃ§): 15.6 inÃ§','HUAWEI-Matebook-D15-15.jpg',6999,12,3,1),
(2,'APPLE MYDA2TU/A MacBook Pro 13.3\"','islemci: M1 Ekran kartÄ±: 8 GB Ekran Boyutu: - / 13.3 inÃ§ ÃÃ¶zÃ¼nÃ¼rlÃ¼k: inÃ§ baÅÄ±na 227 piksel yoÄunlukta 2560 x 1600 Ã¶zgÃ¼n GÃ¶rÃ¼ntÃ¼ kalitesi: Full-HD Ekran Boyutu (inÃ§): 13.3 inÃ§ GÃ¶rÃ¼ntÃ¼ OranÄ±: 16:10','laptop2.jpg',11777,20,1,1),
(3,'ACER A514-53 14\"','islemci: Intel Core i3-1005G1 Ekran kartÄ±: Intel UHD Graphics Sabit disk kapasitesi: 256 GB Ekran Boyutu: 35.6 cm / 14 inÃ§ ÃÃ¶zÃ¼nÃ¼rlÃ¼k: 1366 x 768 Led Arka IÅÄ±klandÄ±rma: Evet Dokunmatik ekran: HayÄ±r','ACER-A514-53-14_-i3-1005G-4GB-256GB-Win10-HD-Laptop-Siyah.jpg',3979,10,5,1),
(4,'SAMSUNG Galaxy Note10 Lite ','Urun Tipi: Akilli Telefon İşletim Sistemi: Android | 10.0 İşlemci: Octa-Core (2.7GHz + 1.7 GHz) Ä°Ålemci HÄ±zÄ±: 2.7GHz + 1.7 GHz Bellek Kapasitesi: 128 GB ArttÄ±rÄ±labilir HafÄ±za: Evet Bellek kartÄ± formatÄ±: microSD','SAMSUNG-Galaxy-Note10-Lite .jpg ',4399,15,6,2);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
