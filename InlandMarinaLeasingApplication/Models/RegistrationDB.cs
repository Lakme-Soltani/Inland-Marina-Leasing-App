using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace InlandMarinaDB
{
    public class RegistrationDB
    {

            public class Customer
            {
                public int ID { get; set; }
                public string FirstName { get; set; }
                public string LastName { get; set; }
                public int Phone { get; set; }
                public string City { get; set; }
                public string UserName { get; set; }
                public string Password { get; set; }
            }
           
        //string username = UserName.Text;

            public static Customer GetCustomer(int ID)
            {
                SqlConnection connection = MarinaDBConnnection.GetConnection();
                Customer customer = new Customer();
                try
                {
                    string sql = "SELECT ID, FirstName, LastName, Phone, City, UserName, Password" +
                        " FROM Customer " +
                        " WHERE ID =" + ID;
                    SqlCommand command = new SqlCommand(sql, connection);
                    SqlDataReader reader = command.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
                    while (reader.Read())
                    {
                        customer.FirstName = reader["FirstName"].ToString();
                        customer.LastName = reader["LastName"].ToString();
                        customer.Phone = Convert.ToInt32(reader["Phone"].ToString());
                        customer.City = reader["City"].ToString();
                        customer.UserName = reader["UserName"].ToString();
                        customer.Password = reader["Password"].ToString();
                        customer.ID = Convert.ToInt32(reader["ID"].ToString());
                    }
                }
                catch (Exception excp)
                {
                    
                    MessageBox.Show($"Something went wrong while trying to connect to your database, {excp}");
                }
                finally { connection.Close(); }
                return customer;
            }


            public static void AddCustomer(string FirstName, string LastName, string Phone, string City, string UserName, string Password)
            {
                string sql = "INSERT INTO Customer" +
                    " (FirstName, LastName, Phone, City, UserName, Password) " +
                        " VALUES " +
                        "(@FirstName, @LastName, @Phone, @City, @UserName, @Password)";

                SqlConnection connection = MarinaDBConnnection.GetConnection();
                SqlCommand command = new SqlCommand(sql, connection);

                command.Parameters.AddWithValue("@FirstName", FirstName);
                command.Parameters.AddWithValue("@LastName", LastName);
                command.Parameters.AddWithValue("@Phone", Phone);
                command.Parameters.AddWithValue("@City", City);
                command.Parameters.AddWithValue("@UserName", UserName);
                command.Parameters.AddWithValue("@Password", Password);
                command.ExecuteNonQuery();
            }

            public static bool isCustomerExist(string username)
            {
                SqlConnection connection = MarinaDBConnnection.GetConnection();
                string sql = "SELECT * FROM Customer WHERE UserName = @UserName";
                SqlCommand command = new SqlCommand(sql, connection);

                command.Parameters.AddWithValue("@UserName", username);
                SqlDataReader reader = command.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
                return reader.HasRows;
            }
    }
}