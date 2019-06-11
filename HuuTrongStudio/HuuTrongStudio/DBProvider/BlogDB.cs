using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace HuuTrongStudio.DBProvider
{
    public class BlogDB
    {
        private static BlogDB instance;

        public static BlogDB Instance
        {
            get {
                if (instance == null)
                {
                    instance = new BlogDB();
                }
                return instance; }
            private set => instance = value;
        }
        private BlogDB() { }
        public DataTable getlistBlog()
        {
            DataTable dt = DBProvider.DataProvider.Instance1.ExecuteQuery("SELECT * FROM dbo.Blog ");
            return dt;
        }
        public bool insertblog(string img,string sub,string content,string author,DateTime dt)
        {
            return DBProvider.DataProvider.Instance1.ExecuteNonQuery("EXEC usp_insertblog @sub , @linkimg , @content , @author , @date " , new object[] {sub,img,content,author,dt }) > 0;

        }
        public DataTable getlistBlog(int id)
        {
            DataTable dt = DBProvider.DataProvider.Instance1.ExecuteQuery("SELECT * FROM dbo.Blog where ID= "+id);
            return dt;
        }
    }
}