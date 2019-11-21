using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace InlandMarinaDB
{
    public static class MarinaDBConnnection
    {
        public static SqlConnection GetConnection()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["InlandMarinaDBConn"].ConnectionString;
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();
            return connection;
        }

        public static DataTable getRows(string sql)
        {
            SqlConnection connection = GetConnection();
            SqlCommand command = new SqlCommand(sql, connection);
            SqlDataReader reader = command.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
            DataTable dataTable = new DataTable();
            dataTable.Load(reader);
            return dataTable;
        }

        public static bool insertRow(SqlCommand command)
        {
            SqlConnection connection = GetConnection();
            command.Connection = connection;
            return (command.ExecuteNonQuery() > 0);
        }
    }
}