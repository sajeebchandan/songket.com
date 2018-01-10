using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Configuration;
using System.Net;
using System.Net.Sockets;

namespace OOSDDemo
{
    public class Logger
    {
        public static void Log(Exception exception)
        {
            StringBuilder sbExceptionMessage = new StringBuilder();

            do
            {
                sbExceptionMessage.Append("Exception Type " + Environment.NewLine);
                sbExceptionMessage.Append(exception.GetType().Name);
                sbExceptionMessage.Append(Environment.NewLine + Environment.NewLine);
                sbExceptionMessage.Append("Message:: " + Environment.NewLine);
                sbExceptionMessage.Append(exception.Message + Environment.NewLine + Environment.NewLine);
                sbExceptionMessage.Append("Stace Trace:: " + Environment.NewLine);
                sbExceptionMessage.Append(exception.StackTrace + Environment.NewLine + Environment.NewLine);

                exception = exception.InnerException;
            }
            while (exception != null);


            string connectionString = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            string sqlINSERT = "INSERT INTO Ex (DateAndTime, message, IPaddress) VALUES(@dateandtime, @msg, @ipaddress)";
            SqlConnection conn;
            SqlCommand cmd;
            conn = new SqlConnection(connectionString);
            try
            {
                conn.Open();
                cmd = new SqlCommand(sqlINSERT, conn);
                cmd.Parameters.AddWithValue("@dateandtime", DateTime.Now);
                cmd.Parameters.AddWithValue("@msg", sbExceptionMessage.ToString());
                cmd.Parameters.AddWithValue("@ipaddress", GetLocalIPAddress());

                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {

            }
            finally
            {
                conn.Close();
            }
        }



        public static string GetLocalIPAddress()
        {
            var host = Dns.GetHostEntry(Dns.GetHostName());
            foreach (var ip in host.AddressList)
            {
                if (ip.AddressFamily == AddressFamily.InterNetwork)
                {
                    return ip.ToString();
                }
            }
            throw new Exception("No network adapters with an IPv4 address in the system!");
        }
    }
}
