using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HuuTrongStudio.DBProvider
{
    public class VideoDB
    {
        private static VideoDB instance;

        public static VideoDB Instance {
            get {
                if (instance == null)
                {
                    instance = new VideoDB();
                }
                return instance;
            }
            private set => instance = value;
        }
        private VideoDB() { }
        public bool InsertVideo(string img ,string name, string link)
        {
            return DBProvider.DataProvider.Instance1.ExecuteNonQuery("EXEC usp_insertVideo @img , @name , @link ",new object[] {img,name,link }) >0;
        }
    }
}