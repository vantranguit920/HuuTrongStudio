using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace HuuTrongStudio.DBProvider
{
    public class DataProvider
    {
        private static DataProvider Instance;

        private string ConnectionSTR = "";
        private DataProvider() { }

        public static DataProvider Instance1 {
            get { if (Instance == null) Instance = new DataProvider(); return Instance; }
            private set { DataProvider.Instance = value;} 
                                             }


        public DataTable ExecuteQuery(string query, object[] parameter = null)
        {

            DataTable data = new DataTable();

            using (SqlConnection connection = new SqlConnection(ConnectionSTR))//mở kết nối sql
            {
                connection.Open();

                SqlCommand command = new SqlCommand(query, connection);

                if (parameter != null)
                {
                    //kiểm tra câu lệnh truy vấn và các tham số truyền vào
                    string[] listPara = query.Split(' ');// cắt chuỗi để lấy các tham số
                    int i = 0;
                    foreach (string item in listPara)
                    {
                        if (item.Contains('@'))//kiểm tra phần tử nào trong mảng có tý tự @ trước.
                        {
                            command.Parameters.AddWithValue(item, parameter[i]);//add vào mảng các tham số
                            i++;
                        }
                    }
                }

                SqlDataAdapter adapter = new SqlDataAdapter(command);//tạo adapter sql

                adapter.Fill(data);//đổ dữ liệu vào biến data.

                connection.Close();//đóng kết nối
            }

            return data;// trả về kết quả cho hàm
        }


        public int ExecuteNonQuery(string query, object[] parameter = null)
        {
            int data = 0;

            using (SqlConnection connection = new SqlConnection(ConnectionSTR))//mở kết nối với sql
            {
                connection.Open();

                SqlCommand command = new SqlCommand(query, connection);

                if (parameter != null)
                {
                    string[] listPara = query.Split(' ');
                    int i = 0;
                    foreach (string item in listPara)
                    {
                        if (item.Contains('@'))
                        {
                            command.Parameters.AddWithValue(item, parameter[i]);
                            i++;
                        }
                    }
                }

                data = command.ExecuteNonQuery();

                connection.Close();
            }

            return data;
        }
        public object ExecuteSalar(string query, object[] parameter = null)
        {
            object ob = 0;

            using (SqlConnection connection = new SqlConnection(ConnectionSTR))
            {
                connection.Open();

                SqlCommand command = new SqlCommand(query, connection);

                if (parameter != null)
                {
                    string[] listPara = query.Split(' ');
                    int i = 0;
                    foreach (string item in listPara)
                    {
                        if (item.Contains('@'))
                        {
                            command.Parameters.AddWithValue(item, parameter[i]);
                            i++;
                        }
                    }
                }

                SqlDataAdapter adapter = new SqlDataAdapter(command);
                ob = command.ExecuteNonQuery();
                connection.Close();
            }

            return ob;// trả về số dòng đc thực thi
            //sd:insert, update, delete
        }

    }
}