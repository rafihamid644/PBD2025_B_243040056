USE KampusDB
--Menampilkan kombinasi mahasiswa dan matakuliah

SELECT M.NamaMahasiswa, MK.NamaMK
FROM Mahasiswa AS M
CROSS JOIN Matakuliah AS MK;

--Menampilkan semua kombinasi dosen dan ruangan

SELECT D.NamaDosen, R.kodeRuangan
FROM Dosen D
CROSS JOIN Ruangan R;

--Left join
--Menampilkan semua mahasiswa termasuk yang belum mengambil KRS

SELECT M.NamaMahasiswa, K.MataKuliahID
FROM Mahasiswa M
LEFT JOIN KRS K ON M.MahasiswaID = K.MahasiswaID;

--Menampilkan semua mata kuliah, termasuk yang belum punya jadwal

SELECT MK.NamaMK, J.Hari
FROM MataKuliah MK
LEFT JOIN JadwalKuliah J ON MK.MataKuliahID = J.MataKuliahID;

--Right Join
--Menampilkan semua jadwal, walaupun tidak ada matakuliah
SELECT MK.NamaMK, J.Hari
FROM MataKuliah MK 
RIGHT JOIN JadwalKuliah J ON MK.MataKuliahID = J.MataKuliahID;

--Menampilkan semua ruangan, apakah dipakai dijadwal apa tidak

SELECT R.KodeRuangan , J.Hari
FROM JadwalKuliah J
RIGHT JOIN Ruangan R ON J.RuanganID = R.RuanganID;

--Inner Join
--Menampilkan nama mahasiswa dan matakuliahnya, tpi melalui tabel krs

SELECT M.NamaMahasiswa, MK.NamaMK
FROM KRS K
INNER JOIN Mahasiswa M ON K.MahasiswaID =M.MahasiswaID
INNER JOIN MataKuliah MK ON K.MataKuliahID = MK.MataKuliahID;

--Menampilkan mata kuliah dan dosen pengampunya
SELECT MK.NamaMK, D.NamaDosen
FROM MataKuliah MK
JOIN Dosen D ON MK.DosenID = D.DosenID;

--MenAMPILKAN Jadwal lengkap
SELECT MK.NamaMK, D.NamaDosen, R.Koderuangan,J.hari
FROM JadwalKuliah J
JOIN Matakuliah MK ON J.MataKuliahID = MK.MataKuliahID
JOIN Dosen D On J.DosenID = D.DosenID
JOIN Ruangan R ON J.RuanganID = R.RuanganID;

--Mnampilkan Nama Mahasiswa dan nilai Akhir

SELECT M.NamaMahasiswa, MK.NamaMK, N.NilaiAkhir
FROM Nilai N
JOIN Mahasiswa M ON N.MahasiswaID = M.MahasiswaID
JOIN MataKuliah MK ON N.MataKuliahID = MK.MataKuliahID;

--Menampilkan dosen dan matakuliah yang dia ajar

SELECT D.NamaDosen, MK.NamaMK
FROM Dosen D
JOIN MataKuliah MK ON D.DosenID = MK.DosenID;


--Self join
--Mencari pasanfan mahasiswa dari prodi yg sama

SELECT A.NamaMahasiswa AS Mahasiswa1,
       B.NamaMahasiswa AS Mahasiswa2,
       A.Prodi
FROM Mahasiswa A
JOIN Mahasiswa B ON A.Prodi = B.Prodi
WHERE A.MahasiswaID > B.MahasiswaID; --agar gada pasangan yg sama



