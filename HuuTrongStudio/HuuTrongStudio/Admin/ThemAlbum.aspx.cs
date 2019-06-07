using HuuTrongStudio.DBProvider;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;

namespace HuuTrongStudio
{
    public partial class ThemAlbum : System.Web.UI.Page
    {
        static int temp;
        static string path;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fillgridview();
            }
            show_data();
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            clear();
        }
        public void clear()
        {
            fillgridview();
            txtTenloai.Text = "";
            txtPath.Text = "";
            lbThanhcong.Text = lbThatbai.Text = "";
            btnSave.Text = "Lưu";
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            path = "/Album/" + (DataProvider.Instance1.ExecuteQuery("dbo.maxID")).Rows[0][0].ToString() + "/";
            DataProvider.Instance1.ExecuteQuery("dbo.themhoaccapnhatalbum @ID , @Ten , @Path ", new object[] {(hfIDloai.Value==""?0:Convert.ToInt32(hfIDloai.Value)),
                txtTenloai.Text.Trim(), path.ToString() });
            string id = hfIDloai.Value;
            clear();
            if (hfIDloai.Value == "")
                lbThanhcong.Text = "Lưu thành công!";
            else
                lbThanhcong.Text = "Cập nhật thành công!";
            fillgridview();
            hfIDloai.Value = "";
            btnSave.Text = "Lưu";
            taomoithumuc();
        }
        void fillgridview()
        {
            gvTuongtacloai.DataSource = DataProvider.Instance1.ExecuteQuery("dbo.viewallAlbum");

            gvTuongtacloai.DataBind();
        }
        protected void Edit(object sender, EventArgs e)
        {
        }

        protected void gvTuongtac_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void Editclick(object sender, EventArgs e)
        {
            ModalPopupExtender1.Show();
            int IDtable = Convert.ToInt32((sender as Button).CommandArgument);
            hfIDloai.Value = IDtable.ToString();
            txtTenloai.Text = (DataProvider.Instance1.ExecuteQuery("dbo.getTenAlbum @ID", new object[] { Convert.ToInt32(hfIDloai.Value) })).Rows[0]["TenAlbum"].ToString();
            txtPath.Text = (DataProvider.Instance1.ExecuteQuery("dbo.getPath @ID", new object[] { Convert.ToInt32(hfIDloai.Value) })).Rows[0]["Path"].ToString();
            btnSave.Text = "Cập nhật";
        }
        private void taomoithumuc()
        {
            string dir_s = Server.MapPath("~/Asset") + path.ToString();
            if (!Directory.Exists(dir_s))
            {
                Directory.CreateDirectory(dir_s);
            }
        }
        protected void Deleteclick(object sender, EventArgs e)
        {
            string path;       
            int IDtable = Convert.ToInt32((sender as Button).CommandArgument);
            hfIDloai.Value = IDtable.ToString();
            temp = Convert.ToInt32(hfIDloai.Value);
            path = (DataProvider.Instance1.ExecuteQuery("dbo.getPath @ID", new object[] { temp })).Rows[0]["Path"].ToString();
            delete(temp);
            string dir_s = Server.MapPath("~/Asset") + path;
            if (Directory.Exists(dir_s))
            {
                Directory.Delete(dir_s);
            }
            fillgridview();
        }

        void delete(int key)
        {
            DataProvider.Instance1.ExecuteQuery("dbo.XoaAlbum @ID", new object[] { key });
            clear();
            fillgridview();
            lbThanhcong.Text = "Xóa thành công!";
            hfIDloai.Value = "";
        }
        protected void gvTuongtac_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            delete(temp);
            fillgridview();
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Button3_Click(object sender, EventArgs e)
        {

        }

        protected void btn_them_Click(object sender, EventArgs e)
        {
            ModalPopupExtender1.Show();
        }

        protected void btn_saveimage_Click(object sender, EventArgs e)
        {
            string p = (DataProvider.Instance1.ExecuteQuery("dbo.getPath @ID", new object[] { Convert.ToInt32(hfIDloai.Value) })).Rows[0]["Path"].ToString();
            for (int i = 0; i < Request.Files.Count; i++)
            {
                HttpPostedFile file = Request.Files[i];
                if (file.ContentLength > 0)
                {
                    string fname = Path.GetFileName(file.FileName);
                    file.SaveAs(Server.MapPath(Path.Combine("~/Asset" + p, fname)));
                    DataProvider.Instance1.ExecuteQuery("dbo.themhoaccapnhatctablum @ID  , @Path ", new object[] {(hfIDloai.Value==""?0:Convert.ToInt32(hfIDloai.Value)),
                fname });
                    lbThatbai.Text = fname;
                }
            }
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
                row["path"] = "~/Asset/" + r[i].Name;
                dt.Rows.Add(row);
            }
            DataList1.DataSource = dt;
            DataList1.DataBind();
        }

        protected void btn_close_Click(object sender, EventArgs e)
        {

        }
    }
}