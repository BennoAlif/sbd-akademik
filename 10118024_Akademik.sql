-- MariaDB dump 10.17  Distrib 10.4.11-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: akademik
-- ------------------------------------------------------
-- Server version	10.4.11-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `dosen`
--

DROP TABLE IF EXISTS `dosen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dosen` (
  `nip` varchar(11) NOT NULL,
  `nama_dosen` varchar(50) NOT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `jenis_kelamin` enum('L','P') DEFAULT NULL,
  `agama` varchar(10) DEFAULT NULL,
  `kode_mk` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`nip`),
  KEY `kode_mk` (`kode_mk`),
  CONSTRAINT `dosen_ibfk_1` FOREIGN KEY (`kode_mk`) REFERENCES `mata_kuliah` (`kode_mk`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dosen`
--

LOCK TABLES `dosen` WRITE;
/*!40000 ALTER TABLE `dosen` DISABLE KEYS */;
INSERT INTO `dosen` VALUES ('41277006007','Andri Heryandi, S.T., M.T.','Bandung','L','Islam','01104'),('41277006022','Galih Hermawan, S.Kom., M.T.','Bandung','L','Islam','01125'),('41277006023','Rani Susanto, S.Kom., M.Kom','Bandung','P','Islam','01040'),('41277006025','Alif Finandhita, S.Kom., M.T.','Bandung','L','Islam','01125'),('41277006052','Angga Setiyadi, S.Kom., M.Kom','Bandung','L','Islam','01126'),('41277006128','Gentisya Tri Mardiani, S.Kom., M.Kom','Bandung','P','Islam','01125'),('41277006135','Dedeng Hirawan, S.Kom., M.Kom','Bandung','L','Islam','01047'),('41277006141','Chrismikha Hardyanto, M.Kom','Bandung','L','Islam','01101'),('41277006144','Fakhrian Fadlia Adiwijaya. M.Kom','Bandung','L','Islam','01125');
/*!40000 ALTER TABLE `dosen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fakultas`
--

DROP TABLE IF EXISTS `fakultas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fakultas` (
  `kode_fakultas` varchar(2) NOT NULL,
  `nama_fakultas` varchar(50) NOT NULL,
  PRIMARY KEY (`kode_fakultas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fakultas`
--

LOCK TABLES `fakultas` WRITE;
/*!40000 ALTER TABLE `fakultas` DISABLE KEYS */;
INSERT INTO `fakultas` VALUES ('1','Teknik & Ilmu Komputer'),('2','Ekonomi'),('3','Hukum'),('4','Ilmu Sosial & Politik'),('5','Desain'),('6','Sastra');
/*!40000 ALTER TABLE `fakultas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jurusan`
--

DROP TABLE IF EXISTS `jurusan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jurusan` (
  `kode_jurusan` varchar(2) NOT NULL,
  `nama_jurusan` varchar(50) NOT NULL,
  `kode_fakultas` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`kode_jurusan`),
  KEY `kode_fakultas` (`kode_fakultas`),
  CONSTRAINT `jurusan_ibfk_1` FOREIGN KEY (`kode_fakultas`) REFERENCES `fakultas` (`kode_fakultas`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jurusan`
--

LOCK TABLES `jurusan` WRITE;
/*!40000 ALTER TABLE `jurusan` DISABLE KEYS */;
INSERT INTO `jurusan` VALUES ('01','Teknik Informatika','1'),('02','Teknik Komputer','1'),('03','Teknik Industri','1'),('04','Teknik Arsitektur','1'),('05','Sistem Informasi','1'),('06','Perencanaan Wildayah dan Kota','1'),('11','Akuntansi','2'),('12','Manajemen','2'),('14','Manajemen Pemasaran','2'),('15','Keuangan dan Perbankan','2'),('16','Ilmu Hukum','3'),('17','Ilmu Pemerintahan','4'),('18','Ilmu Komunikasi','4'),('19','Desain Komunikasi Visual','5'),('20','Desain Interior','5'),('30','Teknik Sipil','1'),('31','Teknik Sipil','1'),('33','Public Relations','4'),('34','Sekretaris Eksekutif','4'),('37','Sastra Inggris','6'),('38','Sastra Jepang','6'),('43','Hubungan Internasional','4');
/*!40000 ALTER TABLE `jurusan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `krs`
--

DROP TABLE IF EXISTS `krs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `krs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `indeks` char(1) DEFAULT NULL,
  `nim` varchar(8) DEFAULT NULL,
  `nip` varchar(11) DEFAULT NULL,
  `kode_mk` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nim` (`nim`),
  KEY `nip` (`nip`),
  KEY `kode_mk` (`kode_mk`),
  CONSTRAINT `krs_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`nim`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `krs_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `dosen` (`nip`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `krs_ibfk_3` FOREIGN KEY (`kode_mk`) REFERENCES `mata_kuliah` (`kode_mk`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `krs`
--

LOCK TABLES `krs` WRITE;
/*!40000 ALTER TABLE `krs` DISABLE KEYS */;
INSERT INTO `krs` VALUES (8,'A','10118024','41277006007','01104'),(9,'A','10118024','41277006025','01125'),(10,'B','10118024','41277006023','01040'),(11,'A','10118024','41277006135','01047');
/*!40000 ALTER TABLE `krs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mahasiswa`
--

DROP TABLE IF EXISTS `mahasiswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mahasiswa` (
  `nim` varchar(8) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `tempat_lahir` varchar(20) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `jenis_kelamin` enum('L','P') DEFAULT NULL,
  `agama` varchar(10) DEFAULT NULL,
  `kode_jurusan` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`nim`),
  KEY `kode_jurusan` (`kode_jurusan`),
  CONSTRAINT `mahasiswa_ibfk_1` FOREIGN KEY (`kode_jurusan`) REFERENCES `jurusan` (`kode_jurusan`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mahasiswa`
--

LOCK TABLES `mahasiswa` WRITE;
/*!40000 ALTER TABLE `mahasiswa` DISABLE KEYS */;
INSERT INTO `mahasiswa` VALUES ('10116167','Satria Adi Putra','Bandung','Bogor','1997-10-10','L','Islam','01'),('10116352','Diki Supriadi','Bandung','Garut','1998-01-21','L','Islam','01'),('10118024','Benno Alif Anggara','Bandung','Subang','2000-08-03','L','Islam','01'),('10119182','Aditya Firmansyah','Bandung','Bandung','2000-06-27','L','Islam','01'),('10212024','Muhammad Naufal','Bandung','Banda Aceh','1999-02-23','L','Islam','05'),('10518021','Talitha Salsabila','Bandung','Subang','2000-06-12','P','Islam','05'),('10819004','Andi Firmansyah','Bandung','Bandung','2000-12-13','L','Islam','02');
/*!40000 ALTER TABLE `mahasiswa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mata_kuliah`
--

DROP TABLE IF EXISTS `mata_kuliah`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mata_kuliah` (
  `kode_mk` varchar(5) NOT NULL,
  `nama_mk` varchar(50) NOT NULL,
  `sks` int(11) NOT NULL,
  `semester` int(11) NOT NULL,
  PRIMARY KEY (`kode_mk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mata_kuliah`
--

LOCK TABLES `mata_kuliah` WRITE;
/*!40000 ALTER TABLE `mata_kuliah` DISABLE KEYS */;
INSERT INTO `mata_kuliah` VALUES ('01002','Bahasa Indonesia',2,3),('01016','Software Terapan II',2,2),('01020','Logika Matematika',3,3),('01027','Metode Numerik',3,4),('01028','Struktur Data',3,2),('01035','Pemodelan dan Simulasi',3,5),('01040','Sistem Informasi',3,4),('01047','Sistem Operasi',3,4),('01055','Metodologi Penelitian',2,6),('01057','Kerja Praktek',2,7),('01064','Tugas Akhir dan Skripsi',6,8),('01080','Keamanan Sistem Informasi',3,8),('01091','Statistika dan Probabilitas',3,2),('01092','Bahasa inggris II',2,2),('01101','Rekayasa Perangkat Lunak I',3,4),('01104','Aplikasi Teknologi Online',2,4),('01125','Basis Data 2 (Sistem Basis Data)',4,4),('01126','Pemrograman Visual / GUI',2,4);
/*!40000 ALTER TABLE `mata_kuliah` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-19 20:41:15
