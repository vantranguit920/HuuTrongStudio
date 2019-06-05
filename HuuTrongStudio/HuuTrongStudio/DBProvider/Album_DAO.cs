using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace HuuTrongStudio.DBProvider
{
    public class Album_DAO
    {
        private static Album_DAO instance;

        private Album_DAO() { }

        public static Album_DAO Instance {
            get
            {
                if (instance == null)
                {
                    instance = new Album_DAO();
                }
                return instance;
            }
            private set => instance = value; }

        public DataTable GetAlbum()
        {
            DataTable dt;

            dt = DataProvider.Instance1.ExecuteQuery("SELECT * FROM dbo.Album");

            return dt;

        }
        public DataTable GetCTAnlbum(int id)
        {
            DataTable dt;
            dt = DataProvider.Instance1.ExecuteQuery("SELECT * FROM dbo.CTAlbum WHERE IDALBUM = @ID ", new object[] {id});
            return dt;
        }
    }
}