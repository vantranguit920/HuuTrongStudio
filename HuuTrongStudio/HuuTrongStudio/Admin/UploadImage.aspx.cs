using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using HuuTrongStudio.DBProvider;

namespace HuuTrongStudio
{
    public partial class UploadImage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            show_data();
        }

        private void show_data()
        {
            DirectoryInfo d = new DirectoryInfo(MapPath("~/Asset/"));
            FileInfo[] r = d.GetFiles();
            DataTable dt = new DataTable();
            dt.Columns.Add("path");
            for (int i = 0; i < r.Length; i++)
            {
                DataRow row = dt.NewRow();
                row["path"] = "~/Asset/"+ r[i].Name;
                dt.Rows.Add(row);
            }
            DataList1.DataSource = dt;
            DataList1.DataBind();
        }
        protected void btn_save_Click(object sender, EventArgs e)
        {
            if(FileUpload1.HasFile)
            {
                string path = "~/Asset/" + Guid.NewGuid().ToString() + "" + Path.GetExtension(FileUpload1.FileName);
                FileUpload1.SaveAs(MapPath(path));
                Response.Write("Lưu ảnh thành công!");
                //DataProvider.Instance1.ExecuteQuery("dbo.themhoaccapnhatctalbum @ID , @Path", new object[] { (hf.Value==""?0:Convert.ToInt32(hf.Value)),
                //});
            }
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Button3_Click(object sender, EventArgs e)
        {

        }
    }
}