using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.WebControls;

namespace DataAccessLayer
{
    public static class DataAccess
    {
        public static SqlConnection con = new SqlConnection("Data Source=.; Initial Catalog=TEST; Integrated Security=True");

        public static SqlConnection GetCon()
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            return con;
        }
        public static int ExecuteNonQuery(SqlCommand cmd)
        {
            cmd.Connection = GetCon();
            int NoOfRowsEffected = -1;
            NoOfRowsEffected = cmd.ExecuteNonQuery();
            con.Close();


            return NoOfRowsEffected;
        }

        public static object ExecuteScalar(SqlCommand cmd)
        {
            cmd.Connection = GetCon();
            object count = -1;
            count = cmd.ExecuteScalar();
            con.Close();


            return count;
        }


        public static DataTable ExecuteReader(SqlCommand cmd)
        {
            cmd.Connection = GetCon();
            SqlDataReader rdr;
            rdr = cmd.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(rdr);
            con.Close();


            return dt;
        }

        public static SqlDataAdapter DataAdapter(SqlCommand cmd)
        {
            cmd.Connection = GetCon();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            con.Close();


            return da;
        }
    }
}
