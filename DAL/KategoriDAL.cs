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

    }
}
