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