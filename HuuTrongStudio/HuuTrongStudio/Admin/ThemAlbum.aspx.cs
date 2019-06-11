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
        static string pathimg;
        static int a;
        static string pathtong = "~/assets";
        protected void Page_Load(object sender, EventArgs e)
        {
            btn_upload.Attributes.Add("onclick", "document.getElementById('" + FileUpload1.ClientID + "').click(); return false;");
            if (!IsPostBack)
            {
                fillgridview();
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            clear();
        }
        public void clear()
        {
            fillgridview();
            txtTenAlbum.Text = "";
            txtPath.Text = "";
            lbThanhcong.Text = lbThatbai.Text = "";
            btnSave.Text = "Lưu";
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {

            string id1 = (DataProvider.Instance1.ExecuteQuery("dbo.maxID")).Rows[0][0].ToString();
            string id2= (DataProvider.Instance1.ExecuteQuery("dbo.getcurrid")).Rows[0][0].ToString();
            path = "/Album/" + (DataProvider.Instance1.ExecuteQuery("dbo.getcurrid")).Rows[0][0].ToString() + "/";
            anhdaidien();
            if (hfIDloai.Value == "" && hfedit.Value == "")
            {
                DataProvider.Instance1.ExecuteQuery("dbo.themalbum @ID , @Ten , @Path , @Pathimg ", new object[] {0,
                txtTenAlbum.Text.Trim(), path.ToString(),pathimg.ToString() });
                taomoithumuc();
                //Them anh vao db
                for (int i = 0; i < Request.Files.Count; i++)
                {
                    HttpPostedFile file = Request.Files[i];
                    if (file.ContentLength > 0)
                    {
                        string fname = Path.GetFileName(file.FileName);
                        String pathimg2 = pathtong.ToString() + path.ToString() + fname;
                        //Insert chi tiet album
                        file.SaveAs(Server.MapPath(Path.Combine(pathtong.ToString() + path.ToString(), fname)));
                        DataProvider.Instance1.ExecuteQuery("dbo.themhoaccapnhatctalubm @ID , @IDalbum , @Path ", new object[] {0, id2.ToString(),
                pathimg2 });
                        lbThatbai.Text = fname;
                    }
                }
            }
            else
            {
               string path3 = "/Album/" + a.ToString() + "/";
                for (int i = 0; i < Request.Files.Count; i++)
                {
                    HttpPostedFile file = Request.Files[i];
                    if (file.ContentLength > 0)
                    {
                        string fname = Path.GetFileName(file.FileName);
                        String pathimg4 = pathtong.ToString() + path3.ToString() + fname;
                        //Insert chi tiet album
                        file.SaveAs(Server.MapPath(Path.Combine(pathtong.ToString() + path3.ToString(), fname)));
                        DataProvider.Instance1.ExecuteQuery("dbo.capnhatctalbum @IDalbum , @Path ", new object[] {a.ToString(),
                pathimg4 });
                        lbThatbai.Text = fname;
                    }
                }
                string b = DataProvider.Instance1.ExecuteQuery("dbo.getPathimg @ID", new object[] { a }).Rows[0][0].ToString();
                DataProvider.Instance1.ExecuteQuery("dbo.capnhatalbum @ID , @Pathimg", new object[] { a + 1, b.ToString() });
                show_dataid(a);
                ModalPopupExtender1.Show();
            }
            string id = hfIDloai.Value;
            clear();
            if (hfIDloai.Value == "")
                lbThanhcong.Text = "Lưu thành công!";
            else
                lbThanhcong.Text = "Cập nhật thành công!";
            fillgridview();
            hfIDloai.Value = "";
            btnSave.Text = "Lưu";        
        }
        private void fillgridview()
        {
            gvTuongtacloai.DataSource = DataProvider.Instance1.ExecuteQuery("dbo.viewallalbum");
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
           
            int IDtable = Convert.ToInt32((sender as Button).CommandArgument);
            hfIDloai.Value = IDtable.ToString();
            hfedit.Value = IDtable.ToString();
            txtTenAlbum.Text = (DataProvider.Instance1.ExecuteQuery("dbo.getTenAlbum @ID", new object[] { Convert.ToInt32(hfIDloai.Value) })).Rows[0]["Ten"].ToString();
            txtPath.Text = (DataProvider.Instance1.ExecuteQuery("dbo.getPath @ID", new object[] { Convert.ToInt32(hfIDloai.Value) })).Rows[0]["Path"].ToString();
            show_dataid(Convert.ToInt32(hfIDloai.Value)-1);
            a = Convert.ToInt32(hfIDloai.Value) - 1;
            ModalPopupExtender1.Show();
        }
        private void taomoithumuc()
        {
            string dir_s = Server.MapPath(pathtong.ToString()) + path.ToString();
            if (!Directory.Exists(dir_s))
            {
                Directory.CreateDirectory(dir_s);
            }
        }
        protected void Deleteclick(object sender, EventArgs e)
        {
            string pathid;       
            int IDtable = Convert.ToInt32((sender as Button).CommandArgument);
            hfIDloai.Value = IDtable.ToString();
            temp = Convert.ToInt32(hfIDloai.Value);
            pathid = (DataProvider.Instance1.ExecuteQuery("dbo.getPath @ID", new object[] { temp })).Rows[0]["Path"].ToString();
            delete(temp);
            string dir_s = Server.MapPath(pathtong.ToString()) + pathid.ToString();
            if (Directory.Exists(dir_s))
            {
                Directory.Delete(dir_s,true);
            }
            fillgridview();
        }

        private void delete(int key)
        {
            int key1 = key - 1;
            DataProvider.Instance1.ExecuteQuery("dbo.xoactalbum @ID", new object[] { key1 });
            DataProvider.Instance1.ExecuteQuery("dbo.xoaalbum @ID", new object[] { key });
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
            hfedit.Value = "";
            hfIDloai.Value = "";
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
            hfIDloai.Value = "";
            clear();
            show_dataid(-1);
            ModalPopupExtender1.Show();
        }

        private void anhdaidien()
        {    
            pathimg = pathtong.ToString() + path.ToString();
            for (int i = 0; i < Request.Files.Count; i++)
            {
                HttpPostedFile file = Request.Files[i];
                if (file.ContentLength > 0)
                {
                    string fname = Path.GetFileName(file.FileName);
                    pathimg += fname;
                    return;
                }
            }
        }
        protected void btn_saveimage_Click(object sender, EventArgs e)
        {

            //for (int i = 0; i < Request.Files.Count; i++)
            //{
            //    HttpPostedFile file = Request.Files[i];
            //    if (file.ContentLength > 0)
            //    {
            //        string fname = Path.GetFileName(file.FileName);
            //        String pathimg2 = "./Public/assets/Album/" + "max[ID] -1/" + fname;

            //        //Insert chi tiet album
            //        file.SaveAs(Server.MapPath(Path.Combine("~/Asset", fname)));
            //        DataProvider.Instance1.ExecuteQuery("dbo.themhoaccapnhatctablum @ID  , @Path ", new object[] {(hfIDloai.Value==""?0:Convert.ToInt32(hfIDloai.Value)),
            //    fname });
            //        lbThatbai.Text = fname;
            //    }
            //}
        }
        private void show_dataid(int key)
        {
            DataList1.DataSource = DataProvider.Instance1.ExecuteQuery("dbo.viewctalbumid @ID ", new object[] { key });
            DataList1.DataBind();              
        }

        protected void btn_close_Click(object sender, EventArgs e)
        {
           
            hfedit.Value = "";
            hfIDloai.Value = "";
            clear();
            ModalPopupExtender1.Hide();
        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void btn_deleteimage(object sender, EventArgs e)
        {
            int IDtable = Convert.ToInt32((sender as Button).CommandArgument);
            hfIDloai.Value = IDtable.ToString();
            int temp1 = Convert.ToInt32(hfIDloai.Value);
            string deletepath = DataProvider.Instance1.ExecuteQuery("dbo.getPathct @ID", new object[] { temp1 }).Rows[0]["Path"].ToString();
            //Thieu ham xoa file !!!!!!!!!!!!!!!!!!  
            File.Delete(MapPath(deletepath));
            DataProvider.Instance1.ExecuteQuery("dbo.xoactalbumid @ID", new object[] { temp1 });
            string b = DataProvider.Instance1.ExecuteQuery("dbo.getPathimg @ID", new object[] { a }).Rows[0][0].ToString();
            DataProvider.Instance1.ExecuteQuery("dbo.capnhatalbum @ID , @Pathimg", new object[] { a + 1, b.ToString() });
            show_dataid(a);
            fillgridview();
            ModalPopupExtender1.Show();
        }

        protected void Button3_Click1(object sender, EventArgs e)
        {

        }
    }
}