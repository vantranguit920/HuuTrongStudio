using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace HuuTrongStudio.DBProvider
{
    public class BangGia_DB
    {
        private static BangGia_DB instance;

        private BangGia_DB() { }

        public static BangGia_DB Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new BangGia_DB();
                }
                return instance;
            }
            private set => instance = value;
        }

        public DataTable GetBanggia()
        {
            DataTable dt;

            dt = DataProvider.Instance1.ExecuteQuery("SELECT * FROM dbo.Banggia");

            return dt;

        }
        public bool insertBG(string name, int gia,string nd,string ndct)
        {
            return DBProvider.DataProvider.Instance1.ExecuteNonQuery("EXEC usp_insertBG @Name , @Gia , @ND , @NDCT ",new object[] {name,gia,nd,ndct }) > 0;
        }
        public bool updateBG(int ID, string name, int gia, string nd, string ndct)
        {
            return DBProvider.DataProvider.Instance1.ExecuteNonQuery("EXEC usp_updateBG @ID , @Name , @Gia , @ND , @NDCT ", new object[] {ID, name, gia, nd, ndct }) > 0;
        }
        public Model.ModelBanggia getBGbyid(int id)
        {
            DataTable dt = DBProvider.DataProvider.Instance1.ExecuteQuery("SELECT * FROM dbo.Banggia WHERE ID = "+id);
            return( new Model.ModelBanggia(dt.Rows[0]));

        }
        public List<Model.ModelBanggia> getlistBG()
        {
            List<Model.ModelBanggia> list = new List<Model.ModelBanggia>();
            DataTable dt;
            dt = DataProvider.Instance1.ExecuteQuery("SELECT * FROM dbo.Banggia");
            foreach(DataRow r in dt.Rows)
            {
                Model.ModelBanggia bg = new Model.ModelBanggia(r);
                list.Add(bg);
            }

            return list;
        }
    }
}