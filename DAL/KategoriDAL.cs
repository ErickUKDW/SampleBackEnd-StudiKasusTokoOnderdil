using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using BO;
using Dapper;
using System.Data.SqlClient;
using System.Configuration;

namespace DAL
{
    public class KategoriDAL
    {
        private string GetConnStr()
        {
            return ConfigurationManager.ConnectionStrings["StokDbConnectionString"].ConnectionString;
        }

        public IEnumerable<Kategori> GetAll()
        {
            using (SqlConnection conn = new SqlConnection(GetConnStr()))
            {

                string strSql = @"select * from Kategori 
                                  order by NamaKategori";

                return conn.Query<Kategori>(strSql);

                /*List<Kategori> lstKategori = new List<Kategori>();
                SqlCommand cmd = new SqlCommand(strSql, conn);
                conn.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if(dr.HasRows)
                {
                    while(dr.Read())
                    {
                        lstKategori.Add(new Kategori
                        {
                            KategoriId = Convert.ToInt32(dr["KategoriId"]),
                            NamaKategori = dr["NamaKategori"].ToString()
                        });
                    }
                }
                dr.Close();
                cmd.Dispose();
                conn.Close();

                return lstKategori;*/
            }
        }

        public Kategori GetById(int KategoriId)
        {
            using (SqlConnection conn = new SqlConnection(GetConnStr()))
            {
                string strSql = @"select * from Kategori 
                              where KategoriId=@KategoriId";
                var par = new
                {
                    KategoriId = KategoriId
                };
                return conn.Query<Kategori>(strSql, par).SingleOrDefault();
            }

        }

        public void Create(Kategori kategori)
        {
            using (SqlConnection conn = new SqlConnection(GetConnStr()))
            {
                string strSql = @"insert into Kategori(NamaKategori) 
                                  values(@NamaKategori)";
                var par = new { NamaKategori = kategori.NamaKategori };
                try
                {
                    conn.Execute(strSql, par);
                }
                catch (SqlException sqlEx)
                {
                    throw new Exception(sqlEx.Number + " - " + sqlEx.Message);
                }
            }
        }

        public void Update(Kategori kategori)
        {
            using (SqlConnection conn = new SqlConnection(GetConnStr()))
            {

                string strSql = @"update Kategori set NamaKategori=@NamaKategori 
                                  where KategoriId=@KategoriId";
                var par = new
                {
                    NamaKategori = kategori.NamaKategori,
                    KategoriId = kategori.KategoriId
                };

                try
                {
                    conn.Execute(strSql, par);
                }
                catch (SqlException sqlEx)
                {
                    throw new Exception(sqlEx.Number + " - " + sqlEx.Message);
                }
            }
        }

        public void Delete(int KategoriId)
        {
            using (SqlConnection conn = new SqlConnection(GetConnStr()))
            {
                string strSql = @"delete from Kategori 
                                  where KategoriId=@KategoriId";
                var par = new { KategoriId = KategoriId };
                try
                {
                    conn.Execute(strSql, par);
                }
                catch (SqlException sqlEx)
                {
                    throw new Exception(sqlEx.Number + " - " + sqlEx.Message);
                }
            }
        }

        public IEnumerable<Kategori> SearchByName(string namaKategori)
        {
            using (SqlConnection conn = new SqlConnection(GetConnStr()))
            {
                string strSql = @"select * from Kategori where 
                                  NamaKategori like @NamaKategori 
                                  order by NamaKategori asc";
                var par = new { NamaKategori = "%" + namaKategori + "%" };

                var results = conn.Query<Kategori>(strSql, par);
                return results;
            }
        }

    }
}
