using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Threading.Tasks;
using System.Text;
using System.Data;

namespace InlandMarinaDB
{
    public static class OperationsDB
    {
        public static List<string> getSlipInfoBy(int ID)
        {
            List<string> slipInfo = new List<string>();
            SqlConnection connection = MarinaDBConnnection.GetConnection();
            try
            {
                string sql = "SELECT s.ID, s.Length, s.Width, d.Name, d.ElectricalService, d.WaterService ";
                sql += "FROM Slip s ";
                sql += "JOIN DOCK d on s.DockID = d.ID ";
                sql += "WHERE s.ID = " + ID;

                SqlCommand command = new SqlCommand(sql, connection);
                SqlDataReader reader = command.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
                while (reader.Read())
                {
                    slipInfo.Add(reader["ID"].ToString()); //0
                    slipInfo.Add(reader["Length"].ToString());//1
                    slipInfo.Add(reader["Width"].ToString());//2
                    slipInfo.Add(reader["Name"].ToString()); //3
                    slipInfo.Add(reader["ElectricalService"].ToString()); //4
                    slipInfo.Add(reader["WaterService"].ToString());//5
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
            }
            finally
            {
                connection.Close();
            }
            return slipInfo;
        }

        public static string getCustomerInfoBy(int ID)
        {
            String customerName = "";
            SqlConnection connection = MarinaDBConnnection.GetConnection();
            try
            {
                string sql = "SELECT FirstName + ', ' + LastName as FullName ";
                sql += "FROM Customer WHERE ID = " + ID;

                SqlCommand command = new SqlCommand(sql, connection);
                SqlDataReader reader = command.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
                while (reader.Read())
                {
                    customerName = reader["FullName"].ToString();
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
            }
            finally
            {
                connection.Close();
            }
            return customerName;
        }

        public static List<string> getSlipsByCustomer(int ID)
        {
            List<string> leasedSlips = new List<string>();
            SqlConnection connection = MarinaDBConnnection.GetConnection();
            try
            {
                string sql = "SELECT d.Name as DockName, d.ElectricalService + ',' + d.WaterService as Services, l.SlipID as Slip#, CONCAT_WS(' x ', s.Length, s.Width) as SlipDimensions(LxW);";
                    sql += " FROM Lease l";
                    sql += "JOIN Slip s on s.ID = l.SlipID";
                    sql += "JOIN DOCK d on s.DockID = d.ID ";
                    sql += "JOIN Customer c on c.ID = l.CustomerID";
                    sql += "WHERE l.CustomerID = " + ID;
                    sql += "ORDER BY l.ID DESC";

                SqlCommand command = new SqlCommand(sql, connection);
                SqlDataReader reader = command.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
                while (reader.Read())
                {
                    leasedSlips.Add(reader["DockName"].ToString());//0
                    leasedSlips.Add(reader["Services"].ToString());//1
                    leasedSlips.Add(reader["Slip#"].ToString());//2
                    leasedSlips.Add(reader["SlipDimensions(LxW)"].ToString());//3

                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
            }
            finally
            {
                connection.Close();
            }
            return leasedSlips;
        }

        public static List<Dock> getDocks()
        {
            DataTable dt = MarinaDBConnnection.getRows("SELECT ID, Name, WaterService, ElectricalService FROM Dock");
            List<Dock> docks = new List<Dock>();
            foreach (DataRow dr in dt.Rows)
            {
                int id = (int)dr["ID"];
                string name = dr["Name"].ToString();
                bool waterService = (bool)dr["WaterService"];
                bool electricalService = (bool)dr["ElectricalService"];
                List<Slip> slips = getAvailableSlips(id);

                Dock dock = new Dock(id, name, waterService, electricalService, slips);
                docks.Add(dock);
            }
            return docks;
        }

        public static bool LeaseSlip(int slipID, int CustomerID)
        {
            string sql = "INSERT INTO Lease (SlipID, CustomerID) VALUES (@slipID, @customerID)";
            SqlCommand command = new SqlCommand(sql);
            command.Parameters.AddWithValue("@slipID", slipID);
            command.Parameters.AddWithValue("@customerID", CustomerID);
            return MarinaDBConnnection.insertRow(command);
        }

        private static List<Slip> getAvailableSlips(int dockID)
        {
            string sql = "SELECT s.ID, s.Width, s.Length ";
            sql += "FROM Slip as s ";
            sql += "left Join Lease as l on l.SlipID = s.ID ";
            sql += "WHERE l.SlipID is NULL AND s.DockID = " + dockID.ToString();
            DataTable dt = MarinaDBConnnection.getRows(sql);
            List<Slip> slips = new List<Slip>();
            foreach (DataRow dr in dt.Rows)
            {
                int id = (int)dr["ID"];
                int width = (int)dr["Width"];
                int length = (int)dr["Length"];

                Slip slip = new Slip(id, width, length);
                slips.Add(slip);
            }
            return slips;
        }

        public static bool customerIsLoggedIn()
        {
            return HttpContext.Current.Session["UserName"] != null;
        }
    }
}