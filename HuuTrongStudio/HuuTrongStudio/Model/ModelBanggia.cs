using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace HuuTrongStudio.Model
{
    public class ModelBanggia
    {
        string name;
        int gia;
        string noidung;
        int id;
        string noidungCT;
        string[] listKM;
        public string Name { get => name; set => name = value; }
        public int Gia { get => gia; set => gia = value; }
        public string Noidung { get => noidung; set => noidung = value; }
        public int Id { get => id; set => id = value; }
        public string NoidungCT { get => noidungCT; set => noidungCT = value; }
        public string[] ListKM { get => listKM; set => listKM = value; }

        public ModelBanggia() { }
        public ModelBanggia(DataRow r)
        {
            Id = Int32.Parse(r["ID"].ToString());
            Name = r["Name"].ToString();
            Gia = Int32.Parse(r["Gia"].ToString());
            Noidung = r["NoiDung"].ToString();
            NoidungCT= r["NDCT"].ToString();
            listKM = noidung.Split('.');
        }
    }
}