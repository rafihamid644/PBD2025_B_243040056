--SOAL NO 1--

SELECT 
    M.NamaMahasiswa,
    M.Prodi
FROM Mahasiswa M
JOIN Nilai N ON M.MahasiswaID = N.MahasiswaID;

--SOAL NO 2--

SELECT 
    D.NamaDosen,
    R.KodeRuangan
FROM JadwalKuliah J
JOIN Dosen D ON J.DosenID = D.DosenID
JOIN Ruangan R ON J.RuanganID = R.RuanganID;

--SOAL NO 3--

SELECT 
    M.NamaMahasiswa,
    MK.NamaMK,
    D.NamaDosen
FROM KRS K
JOIN Mahasiswa M ON K.MahasiswaID = M.MahasiswaID
JOIN MataKuliah MK ON K.MataKuliahID = MK.MataKuliahID
JOIN Dosen D ON MK.DosenID = D.DosenID;

--SOAL NO 4--

SELECT 
    MK.NamaMK,
    D.NamaDosen,
    J.Hari
FROM JadwalKuliah J
JOIN MataKuliah MK ON J.MataKuliahID = MK.MataKuliahID
JOIN Dosen D ON J.DosenID = D.DosenID;

--SOAL NO 5--

SELECT 
    M.NamaMahasiswa,
    MK.NamaMK,
    D.NamaDosen,
    N.NilaiAkhir
FROM Nilai N
JOIN Mahasiswa M ON N.MahasiswaID = M.MahasiswaID
JOIN MataKuliah MK ON N.MataKuliahID = MK.MataKuliahID
JOIN Dosen D ON MK.DosenID = D.DosenID;




