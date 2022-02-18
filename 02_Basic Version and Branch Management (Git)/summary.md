# (2) Basic Version and Branch Management (Git)


| NAMA |  KELAS
|--|--|
| Rohman Beny Riyanto  |  Flutter A

## Soal
Tuliskan 3 poin yang dipelajari dari materi tersebut. Resume / ringkasan materi dapat disubmit melalui Github

## Hasil Resume

### 1. Fundamental

#### Apa itu Versioning?
> Versioning Adalah mengatur versi dari source code program

#### Apa itu Git?
> Git adalah version control system yang digunakan para developer untuk mengembangkan software secara bersama-bersama. Fungsi utama git yaitu mengatur versi dari source code program anda dengan mengasih tanda baris dan code mana yang ditambah atau diganti.

### 2. Perintah Dasar GIT 

#### Untuk Membuat Repository Baru

`git init`
###### Hal ini digunakan untuk membuat repository atau "tempat kerja" kalian.

#### Menambahkan File ke Repository

###### Sebagai contoh saya ingin menambahkan sebuat file .txt ke repository saya.

`echo "belajar perintah dasar git" > aw.txt`<br />

`git add aw.txt`

###### Jika kamu hanya melakukan perubahan pada satu file bisa diketik nama berkasnya.
###### Namun jika kalian melakukan banyak perubahan atau bahkan semua file, kita gunakan perintah
`git add *`
###### Melakukan Komit
`git commit -m "keterangan komit"`
###### Hal ini untuk menambahkan keterangan perubahan apa yang kita lakukan pada file tersebut.

#### Menghubungkan ke Server Repository Jarak Jauh
`git remote add origin https://github.com/linuxsecorg/linuxsecorg`
###### Hal ini dilakukan agar kamu bisa mengirimkan perubahan ke server jarak-jauh yang dituju.

#### Mengirim Perubahan ke Repository jarak Jauh
`git push origin master`
###### Perintah ini digunakan untuk mengirim perubahan atau file dari lokal ke remote server. Berhubung di tutorial ini menggunakan repository gitHub, kalian akan diminta password dan username akun github kalian. Jadi isi dengan benar agar perubahan terkirim.

#### Memperbarui Repository Lokal
###### Nah semisal kalian melakukan perubahan di repository jarak jauh, yang mana tidak dilakukan melalui push lewat repository lokal pastinya repository lokal kalian isinya akan berbeda (belum update). Nah untuk memperbarui repository lokal gunakan perintah
`git pull`

#### Melihat Log Perubahan
`git log`
###### Hal ini untuk melihat perubahan apa saja yang telah dilakukan pada file. Outputnya adalah keterangan yang kita masukkan pada commit. Itulah kenapa ngisi commit harus jelas, jangan ngasal. hehe.

#### Menyalin repository ke lokal
`git clone  https://github.com/linuxsecorg/linuxsecorg.git`
###### Ini ditujukan untuk menyalin sebuah repository publik ke lokal. Misalnya repository milik orang lain yang berisi source code dan bersifat publik.

#### Untuk perintah perintah lain bisa cek menggunakan perintah
`git --help`

### 3. Fitur Git dan Kelebihannya
* Branching dan merging
* Dapat bekerja secara bersamaan
* Memiliki integrasi built-in
* Mudah mencari bantuan
