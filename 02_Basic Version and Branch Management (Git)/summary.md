# (2) Basic Version and Branch Management (Git)


| NAMA |  KELAS
|--|--|
| Rohman Beny Riyanto  |  Flutter A

## Hasil Resume :

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
`git remote add origin https://github.com/nickname/namarepo`
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
`git clone  https://github.com/nickname/namarepo.git`
###### Ini ditujukan untuk menyalin sebuah repository publik ke lokal. Misalnya repository milik orang lain yang berisi source code dan bersifat publik.

#### Untuk perintah perintah lain bisa cek menggunakan perintah
`git --help`

### 3. Fitur Git dan Kelebihannya
* Branching dan merging
* Dapat bekerja secara bersamaan
* Memiliki integrasi built-in
* Mudah mencari bantuan

# Task

Pada task ini, membuat sebuah repository github dan mengimplementasikan github branching. Selain itu juga terdapat pengimplementasian instruksi git, penanganan konflik dan menggunakan merge no fast forward

Berikut repository hasil dari praktikum ini.

[View Repository](https://github.com/RohmanBenyRiyanto/Tugas-Git-Alterra-Academy)

## 1. Buat Sebuah Repository GIthub 

> Create Repositories

<img src="https://user-images.githubusercontent.com/72520643/154049053-51e06895-4f35-4eb3-9cc8-b88e97e57df8.png" width="700">
   
> Stock Repositories
   
<img src="https://user-images.githubusercontent.com/72520643/154048740-1ec6256e-c7e0-4c40-a2d4-9abb2b3e4bcd.png" width="700">

## 2. Implementasikan penggunaan branching yang terdiri dari master, development, featureA, dan featureB :

> Create Branch Development

<img src="https://user-images.githubusercontent.com/72520643/154051893-2e3002e1-edef-4980-b3f6-aaccb390d3de.png" width="700">

> Create Branch featureA

<img src="https://user-images.githubusercontent.com/72520643/154052010-c5c8f450-57fb-4a7e-adca-136aa2ce5e9d.png" width="700">

> Create Branch featureA

<img src="https://user-images.githubusercontent.com/72520643/154052072-694327d1-e269-48cd-9c29-629c4af00878.png" width="700">

> Branch List

<img src="https://user-images.githubusercontent.com/72520643/154052241-27e994b3-65df-41e5-9b3e-18776a88d836.png" width="700">

> Branch Preview In Repositories

<img src= "https://user-images.githubusercontent.com/72520643/154052335-6c62866f-104a-46a8-981b-7c85c67aa626.png" width="350">

## 3. Implementasikan intruksi git untuk push, pull, stash dan merge

> Push

<img src= "https://user-images.githubusercontent.com/72520643/154053066-69b6d83c-1ad9-471b-a66b-905e6a50104b.png" width="700">

> Pull 

<img src= "https://user-images.githubusercontent.com/72520643/154053561-7da077c7-94d7-48cd-b384-dbd7862d574a.png" width="700">

> Stash

<img src= "https://user-images.githubusercontent.com/72520643/154053902-8fb604e0-8227-4a66-b4cf-bbd7beff9090.png" width="350">

> Merge

<img src= "https://user-images.githubusercontent.com/72520643/154054244-53a49661-e0aa-44c8-9711-d7e231a68d69.png" width="700">

## 4. Implementasikan sebuah penanganan conflict di branch developement ketika setelah merge dari branch featureA lalu merge dari branch featureB (Conflict bisa terjadi jika kedua branch mengerjakan di file dan line code yang sama) : 

> Conflict

<img src= "https://user-images.githubusercontent.com/72520643/154054917-51ea273c-f536-40ed-9feb-a8ac2d4c51f9.png" width="700">

> Conflict View

<img src= "https://user-images.githubusercontent.com/72520643/154054727-4e2429e8-f6f2-4a49-9cbe-794188b66bdc.png" width="700">

> Conflict Solution

<img src= "https://user-images.githubusercontent.com/72520643/154055088-9711392e-9b01-448d-9e05-807e46c86bb4.png" width="700">

> Conflict Done

<img src= "https://user-images.githubusercontent.com/72520643/154055088-9711392e-9b01-448d-9e05-807e46c86bb4.png" width="700">

<img src= "https://user-images.githubusercontent.com/72520643/154055217-be715e6c-60b2-4f21-81da-9783d40e132d.png" width="700">

## Gunakan merge no fast forward

> Merge No Fast Forward

<img src= "https://user-images.githubusercontent.com/72520643/154055555-e54cc616-0310-4350-a995-8ff0ba6087be.png" width="700">

> View Graph

<img src= "https://user-images.githubusercontent.com/72520643/154055634-c9adb608-71f8-4cf2-83f2-e40e3862550a.png" width="700">
