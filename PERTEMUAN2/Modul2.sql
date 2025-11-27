--buat database baru tokoretailDB
CREATE DATABASE TokoretailDB;

--gunakan DB 
USE TokoretailDB;

--Membuat tabel kategori produk
CREATE TABLE KategoriProduk(
   kategoriID INT IDENTITY(1,1) PRIMARY KEY,
   NamaKategori VARCHAR(100) NOT NULL UNIQUE
);

--Membuat tabel produk
CREATE TABLE produk(
   ProdukID INT IDENTITY (1000,1) PRIMARY KEY,
   SKU VARCHAR(20) NOT NULL UNIQUE,
   NamaPoduk VARCHAR(150) NOT NULL,
   Harga DECIMAL(10,2) NOT NULL,
   Stok INT NOT NULL,
   KategoriID INT NULL,

   --harganya gaboleh negatif
	CONSTRAINT CHK_HargaPositif CHECK ( Harga >= 0 ),
   --stoknya gaboleh negaatif
    CONSTRAINT CHK_StokPositif CHECK ( Stok >= 0 ),
   --relasikan dengan tabel kategoriproduk memalaui kategori id
   CONSTRAINT FK_Produk_kategori
      FOREIGN KEY ( KategoriID )
	  REFERENCES KategoriProduk(KategoriID)

);

 --masukin data kategori produk
 INSERT INTO KategoriProduk (NamaKategori)
 VALUES 
 ('Elektronik');

  INSERT INTO KategoriProduk (NamaKategori)
 VALUES 
 ('Pakaian'),
 ('Buku');

 SELECT *
 FROM KategoriProduk;

 SELECT NamaKategori
 FROM KategoriProduk;

 --menanbahkan data ke tabel produk
 INSERT INTO Produk (SKU, NamaPoduk, Harga, Stok, KategoriID)
 VALUES
 ('ELEC-001','Laptop Gaming', 15000000.00,50,1);

 INSERT INTO Produk (SKU, NamaPoduk, Harga, Stok, KategoriID)
 VALUES
 ('ELEC-002','HP-Gaming', 5000000.00,50,1);

  SELECT *
 FROM Produk;

 --mengubah stok data laptop gaming
 UPDATE Produk
 SET STOK = 30
 WHERE ProdukID = 1001;

 --mengahpus data gaming
 BEGIN TRANSACTION;

 DELETE FROM produk
 WHERE ProdukID = 1002;

 COMMIT TRANSACTION;

 --nambah produk baru
  INSERT INTO Produk (SKU, NamaPoduk, Harga, Stok, KategoriID)
 VALUES
 ('BAJU-001','HP-Gaming', 5000000.00,50,3);

   INSERT INTO Produk (SKU, NamaPoduk, Harga, Stok, KategoriID)
 VALUES
 ('BAJU-002','baju-Gaming', 5000000.00,50,3);

 SELECT * FROM produk;

 --menghapus HP-GAMING
 BEGIN TRAN

 DELETE FROM produk
 WHERE ProdukID = 1003;

 ROLLBACK TRANSACTION;

 COMMIT TRANSACTION;









