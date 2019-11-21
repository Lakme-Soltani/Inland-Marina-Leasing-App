using InlandMarinaDB;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;



namespace InlandMarinaLeasingApplication
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["UserName"] != null)
            {
                Session.Remove("UserName");
                Session.Remove("LeasedSlipID");
                Response.Redirect("Home.aspx");
            }
        }

        protected void continueButton_Click(object sender, EventArgs e)
        {
            SqlConnection connection = MarinaDBConnnection.GetConnection();
            string sql = "SELECT * FROM Customer WHERE UserName = @UserName";
            SqlCommand command = new SqlCommand(sql, connection);

            command.Parameters.AddWithValue("@UserName", userNameTextBox.Text);
            SqlDataReader reader = command.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
            if (reader.HasRows == false)
            {
                passwordInvalidLabel.Text = "Username does not exist!";
            }
            else
            {
                while (reader.Read())
                {
                    string decryptedPwd = LoginUtility.GetDecryptedValue(reader["Password"].ToString());

                    if (passwordTextBox.Text == decryptedPwd)
                    {
                        //Create a session
                        Session["UserName"] = reader["ID"].ToString();
                        //Assign customer id to the session
                        Response.Redirect("Lease.aspx");
                    }
                    else
                    {
                        passwordInvalidLabel.Text = "Password is invalid";
                    }
                }

                
            }

           
        }
    }
}