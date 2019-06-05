using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace HuuTrongStudio.DBProvider
{
    public class Video_DAO
    {
        private static Video_DAO instance;
        private Video_DAO() { }
        public static Video_DAO Instance {
            get {
                if (instance == null)
                {
                    instance = new Video_DAO();
                }
                return instance;
            }
            private set => instance = value;
        }
        public DataTable getListvideo()
        {
            DataTable dt;

            dt = DataProvider.Instance1.ExecuteQuery("SELECT * FROM dbo.video");

            return dt;
        }

    }
}