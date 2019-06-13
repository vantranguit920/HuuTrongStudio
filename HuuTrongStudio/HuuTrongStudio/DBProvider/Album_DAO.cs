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
        public bool insertAlbum(string name, string pathAl,string pathImg)
        {
            return DBProvider.DataProvider.Instance1.ExecuteNonQuery("EXEC uploadAlbum @Name , @PathAl , @PathImg " , new object[] {name,pathAl,pathImg })>0;
        }
        public bool insertCTAlbum(string pathImg)
        {
            return DBProvider.DataProvider.Instance1.ExecuteNonQuery("EXEC ups_insertCTalbum  @pathimg ", new object[] { pathImg }) > 0;

        }
        public bool insertCTAlbum(int id, string pathImg)
        {
            return DBProvider.DataProvider.Instance1.ExecuteNonQuery("EXEC ups_insertCTalbumbyid @id , @pathimg ", new object[] {id, pathImg }) > 0;

        }
        public DataTable GetCTAnlbum(int id)
        {
            DataTable dt;
            dt = DataProvider.Instance1.ExecuteQuery("SELECT * FROM dbo.CTAlbum WHERE IDALBUM = @ID ", new object[] {id});
            return dt;
        }
        public bool updatealbum(int id,string name)
        {
            return DBProvider.DataProvider.Instance1.ExecuteNonQuery("EXEC usp_updateAlbum @id , @name ", new object[] { id, name }) > 0;

        }
    }
}
