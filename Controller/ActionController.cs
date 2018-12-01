using Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SampleHash;
using DataAccessLayer;
using System.Web.UI.WebControls;

namespace Controller
{
    public class ActionController
    {
        public static int SaveRegister(Model_User _UserRegister)
        {
            _UserRegister.Password = SampleHash.SampleHash.ComputeHash(_UserRegister.Password, "SHA256", null);
            _UserRegister.Sanswer = SampleHash.SampleHash.ComputeHash(_UserRegister.Sanswer, "SHA256", null);
            string SQL = "INSERT INTO Users (name, username, email, gender, country, dob, pass, photo, securityquestion, securityanswer) VALUES (@Name, @Username, @Email, @Gender, @Country, @Dob, @Password, @Photo, @Securityquestion, @Securityanswer)";
            SqlCommand cmd = new SqlCommand(SQL);
            cmd.Parameters.AddWithValue("@Name", _UserRegister.Name);
            cmd.Parameters.AddWithValue("@Username", _UserRegister.Username);
            cmd.Parameters.AddWithValue("@Email", _UserRegister.Email);
            cmd.Parameters.AddWithValue("@Gender", _UserRegister.Gender);
            cmd.Parameters.AddWithValue("@Country", _UserRegister.Country);
            cmd.Parameters.AddWithValue("@Dob", _UserRegister.DOB);
            cmd.Parameters.AddWithValue("@Password", _UserRegister.Password);
            cmd.Parameters.AddWithValue("@Photo", _UserRegister.photo);
            cmd.Parameters.AddWithValue("@Securityquestion", _UserRegister.Squestion);
            cmd.Parameters.AddWithValue("@Securityanswer", _UserRegister.Sanswer);


            if (UserAvailability(_UserRegister.Username) <= 0)
            {
                if (DataAccess.ExecuteNonQuery(cmd) > 0)
                {
                    return 1;
                }
                else
                    return 0;
            }
            else
                return 0;
        }
        public static int SendMessage(Model_Message SendMessage)
        {
            string SQL = "INSERT INTO inbox (Username, textmessage, senttime, sender) VALUES (@Username, @textmessage, @Senttime, @Sender)";
            SqlCommand cmd = new SqlCommand(SQL);
            cmd.Parameters.AddWithValue("@Username", SendMessage.Username);
            cmd.Parameters.AddWithValue("@textmessage", SendMessage.Message);
            cmd.Parameters.AddWithValue("@Senttime", SendMessage.Senttime);


            if (SendMessage.Sender == null || SendMessage.Sender == "")
            {
                cmd.Parameters.AddWithValue("@Sender", "Anonymous");
                if (DataAccess.ExecuteNonQuery(cmd) > 0)
                {
                    return 1;
                }
                else
                    return 0;

            }

            else if (SendMessage.Sender != null)

                cmd.Parameters.AddWithValue("@Sender", SendMessage.Sender);
            if (DataAccess.ExecuteNonQuery(cmd) > 0)
            {
                return 1;
            }
            else
                return 0;

        }
        public static int SaveBlog(Model_User _UserRegister, Model_Blog _BlogSave)
        {
            string SQL = "INSERT INTO BlogTable (Username, Name, B_Category, B_Title, B_Post, B_Image, B_File, B_FileName, B_Date) VALUES(@username, @name, @bCategory, @bTitle, @bPost, @bImage, @bFile, @bFileName, @bDate)";
            SqlCommand cmd = new SqlCommand(SQL);
            cmd.Parameters.AddWithValue("@username", _UserRegister.Username);
            cmd.Parameters.AddWithValue("@name", _UserRegister.Name);
            cmd.Parameters.AddWithValue("@bCategory", _BlogSave.B_Cat);
            cmd.Parameters.AddWithValue("@bTitle", _BlogSave.B_Title);
            cmd.Parameters.AddWithValue("@bPost", _BlogSave.B_Post);
            cmd.Parameters.AddWithValue("@bImage", _BlogSave.B_Image);
            cmd.Parameters.AddWithValue("@bFile", _BlogSave.B_File);
            cmd.Parameters.AddWithValue("@bFileName", _BlogSave.B_FileName);
            cmd.Parameters.AddWithValue("@bDate", DateTime.Now);
            if (BlogTitleAvailability(_BlogSave.B_Title) <= 0)
            {
                if (DataAccess.ExecuteNonQuery(cmd) > 0)
                {
                    return 1;
                }
                else
                    return 0;
            }
            else
                return 0;
        }
        public static int UserAvailability(string username)
        {
            string SQL = "SELECT COUNT (*) FROM Users WHERE username=@username";
            SqlCommand cmd = new SqlCommand(SQL);

            cmd.Parameters.AddWithValue("@username", username);
            int existanceNumber = Convert.ToInt32(DataAccess.ExecuteScalar(cmd));
            return existanceNumber;
        }
        public static int BlogTitleAvailability(string blogTitle)
        {
            string SQL = "SELECT COUNT (*) FROM BlogTable WHERE B_Title=@B_Title";
            SqlCommand cmd = new SqlCommand(SQL);

            cmd.Parameters.AddWithValue("@B_Title", blogTitle);
            int existanceNumber = Convert.ToInt32(DataAccess.ExecuteScalar(cmd));
            return existanceNumber;
        }
        public static int NameAvailability(string name, string username)
        {
            string SQL = "SELECT COUNT (*) FROM Users WHERE name=@name AND username=@username";
            SqlCommand cmd = new SqlCommand(SQL);

            cmd.Parameters.AddWithValue("@name", name);
            cmd.Parameters.AddWithValue("@username", username);
            int existanceNumber = Convert.ToInt32(DataAccess.ExecuteScalar(cmd));
            return existanceNumber;
        }
        public static int NameAvailabilityCore(string name)
        {
            string SQL = "SELECT COUNT (*) FROM Users WHERE name=@name";
            SqlCommand cmd = new SqlCommand(SQL);

            cmd.Parameters.AddWithValue("@name", name);
            //cmd.Parameters.AddWithValue("@username", username);
            int existanceNumber = Convert.ToInt32(DataAccess.ExecuteScalar(cmd));
            return existanceNumber;
        }
        public static int UpdateRegister(Model_User _UserUpdate)
        {
            _UserUpdate.Sanswer = SampleHash.SampleHash.ComputeHash(_UserUpdate.Sanswer, "SHA256", null);
            string SQL = "UPDATE Users SET name=@Name, email=@Email, gender=@Gender, country=@Country, dob=@Dob, photo=@photo, securityquestion=@SecurityQuestion, securityanswer=@SecurityAnswer WHERE username=@Session_Username";
            SqlCommand cmd = new SqlCommand(SQL);
            cmd.Parameters.AddWithValue("@Name", _UserUpdate.Name);
            cmd.Parameters.AddWithValue("@Email", _UserUpdate.Email);
            cmd.Parameters.AddWithValue("@Gender", _UserUpdate.Gender);
            cmd.Parameters.AddWithValue("@Country", _UserUpdate.Country);
            cmd.Parameters.AddWithValue("@Dob", _UserUpdate.DOB);
            cmd.Parameters.AddWithValue("@photo", _UserUpdate.photo);
            cmd.Parameters.AddWithValue("@SecurityQuestion", _UserUpdate.Squestion);
            cmd.Parameters.AddWithValue("@SecurityAnswer", _UserUpdate.Sanswer);
            cmd.Parameters.AddWithValue("@Session_Username", _UserUpdate.Username);


            if (NameAvailability(_UserUpdate.Name, _UserUpdate.Username) == 1 || NameAvailabilityCore(_UserUpdate.Name) == 0)
            {
                if (DataAccess.ExecuteNonQuery(cmd) > 0)
                {
                    return 1;
                }
                else
                    return 0;
            }
            else
                return 0;
        }
        //these parameters will keep passing the value of user's input into the selected field!
        public static bool CheckLogin(string username, string password)
        {
            string sqlSUCKER = string.Format("SELECT pass FROM Users WHERE username = @username");
            SqlCommand cmd = new SqlCommand(sqlSUCKER);
            string HashedPassword = string.Empty;
            cmd.Parameters.AddWithValue("@username", username);

            DataTable dtPass = new DataTable();
            dtPass = DataAccess.ExecuteReader(cmd);
            foreach (DataRow row in dtPass.Rows)
            {
                HashedPassword = row["pass"].ToString();
            }

            if (SampleHash.SampleHash.VerifyHash(password, "SHA256", HashedPassword))
            {
                return true;
            }
            else
                return false;
        }
        public static string GetImage(string username)
        {
            byte[] ImageByte;
            string SQL = "SELECT photo FROM Users WHERE username=@username";
            SqlCommand cmd = new SqlCommand(SQL);
            cmd.Parameters.AddWithValue("@username", username);
            DataTable dtImage = new DataTable();
            dtImage = DataAccess.ExecuteReader(cmd);

            ImageByte = (byte[])dtImage.Rows[0]["photo"];
            if (ImageByte != null)
            {
                string imageBase64 = Convert.ToBase64String(ImageByte);
                return imageBase64;
            }
            else
                return null;
        }
        public static Tuple<string, string, string, string, string, string> Get(string username)
        {
            Model_User _User = new Model_User();
            string SQL = "SELECT name, email, gender, country, dob, securityquestion FROM Users WHERE username = @username";
            SqlCommand cmd = new SqlCommand(SQL);
            cmd.Parameters.AddWithValue("@username", username);
            DataTable dtProfile = new DataTable();
            dtProfile = DataAccess.ExecuteReader(cmd);
            if (dtProfile != null)
            {
                foreach (DataRow row in dtProfile.Rows)
                {
                    _User.Name = row["name"].ToString();
                    _User.Email = row["email"].ToString();
                    _User.Gender = row["gender"].ToString();
                    _User.Country = row["country"].ToString();
                    _User.DOB = row["dob"].ToString();
                    _User.Squestion = row["securityquestion"].ToString();
                }


            }
            return new Tuple<string, string, string, string, string, string>(_User.Name, _User.Email, _User.Gender, _User.Country, _User.DOB, _User.Squestion);
        }
        public static string GetName(string username)
        {
            string Name;
            string SQL = "SELECT name FROM Users WHERE username = @username";
            SqlCommand cmd = new SqlCommand(SQL);
            cmd.Parameters.AddWithValue("@username", username);
            DataTable dtName = new DataTable();
            dtName = DataAccess.ExecuteReader(cmd);
            Name = (string)dtName.Rows[0]["name"];
            if (Name != null)
            {
                return Name;
            }
            else
                return null;
        }
        public static DataSet DataSet_Profile(string username)
        {
            string SQL = "SELECT name, username, email, gender, country, dob, photo, securityquestion FROM Users WHERE username = @Username";
            SqlCommand cmd = new SqlCommand(SQL);
            cmd.Parameters.AddWithValue("@Username", username);
            //DataList dl = new DataList();
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter();
            da = DataAccess.DataAdapter(cmd);
            da.Fill(ds);
            //dl.DataSource = ds;
            return ds;
        }
        public static DataSet DataSet_Blog(string title)
        {
            string SQL = "SELECT Username, Name, B_Category, B_Title, B_Post, B_Image, B_File, B_Date FROM BlogTable WHERE B_Title = @B_Title";
            SqlCommand cmd = new SqlCommand(SQL);
            cmd.Parameters.AddWithValue("@B_Title", title);
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter();
            da = DataAccess.DataAdapter(cmd);
            da.Fill(ds);
            return ds;
        }
        public static byte[] GetImageByte(string username)
        {
            byte[] ImageByte;
            string SQL = "SELECT photo FROM Users WHERE username=@username";
            SqlCommand cmd = new SqlCommand(SQL);
            cmd.Parameters.AddWithValue("@username", username);
            DataTable dtImage = new DataTable();
            dtImage = DataAccess.ExecuteReader(cmd);

            ImageByte = (byte[])dtImage.Rows[0]["photo"];
            if (ImageByte != null)
            {
                return ImageByte;
            }
            else
                return null;
        }
    }
}
