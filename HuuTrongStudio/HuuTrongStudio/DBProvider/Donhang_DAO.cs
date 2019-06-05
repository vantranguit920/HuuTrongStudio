using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HuuTrongStudio.DBProvider
{
    public class Donhang_DAO
    {
        private static Donhang_DAO instance;

        public static Donhang_DAO Instance {
            get
            {
                if (instance == null)
                {
                    instance = new Donhang_DAO();
                }
                return instance;
            }
            private set => instance = value;
        }
        private Donhang_DAO() { }
        public bool InsertDonhang( string name, string phone, string mail,string dv,string ghichu)
        {
            return DBProvider.DataProvider.Instance1.ExecuteNonQuery("EXEC dbo.usp_InsertDonhang @Name , @Phone , @Email , @DV , @Ghichu ", new object[] {name,phone,mail,dv,ghichu }) > 0;

        }
    }
}