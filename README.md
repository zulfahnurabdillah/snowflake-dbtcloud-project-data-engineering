
# Proyek Data Engineering End-to-End: Analisis Data MovieLens 20M

Proyek ini mendemonstrasikan alur kerja ELT (Extract, Load, Transform) lengkap. Data mentah dari dataset MovieLens 20M diambil, dimuat ke dalam data warehouse (Snowflake), ditransformasi menggunakan dbt untuk membuat model data Star Schema yang bersih, dan disiapkan untuk analisis di alat Business Intelligence (Tableau).

## 🚀 Tech Stack

* **Data Warehouse:** Snowflake
* **Alat Pemuatan Data:** SnowSQL (CLI)
* **Alat Transformasi:** dbt Cloud
* **Alat Visualisasi:** Tableau (Direncanakan)
* **Version Control:** Git & GitHub

## 🏛️ Arsitektur & Alur Data (ELT)

1.  **Extract:** Dataset MovieLens 20M (6 file CSV) diunduh secara manual.
2.  **Load:** File CSV mentah dimuat ke schema `RAW` di database Snowflake menggunakan perintah `PUT` dan `COPY INTO` melalui SnowSQL.
3.  **Transform:** dbt terhubung ke database Snowflake untuk menjalankan serangkaian model SQL. Proses ini membersihkan, menata, dan menggabungkan data mentah dari schema `RAW` dan membangunnya kembali sebagai model data Star Schema yang bersih di dalam schema `ANALYTICS`.
4.  **Visualize (Tahap Berikutnya):** Tableau akan terhubung ke schema `ANALYTICS` di Snowflake untuk membuat dashboard analitis.
