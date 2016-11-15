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
    public class JenisMotorDAL
    {
        private string GetConnStr()
        {
            return ConfigurationManager.ConnectionStrings["StokDbConnectionString"].ConnectionString;
        }

        public IEnumerable<JenisMotor> GetAll()
        {
            using (SqlConnection conn = new SqlConnection(GetConnStr()))
            {
                string strSql = @"select * from JenisMotor 
                                  order by NamaJenisMotor asc";

                var results = conn.Query<JenisMotor>(strSql);
                return results;
            }
        }

        
    }
}
