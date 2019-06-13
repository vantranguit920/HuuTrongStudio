using HuuTrongStudio.DBProvider;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HuuTrongStudio.Admin
{
    public partial class QLAlbum : System.Web.UI.Page
    {
        static int temp;
        static string path;
        static string pathimg;
        string pathAlbum;
        static int a;
        static string pathtong = "~/assets/Album";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                btn_upload.Attributes.Add("onclick", "document.getElementById('" + FileUpload1.ClientID + "').click(); return false;");

                ViewState["action"] = 0;
                fillgridview();
            }

        }
        public static string convertToUnSign3(string s)
        {
            Regex regex = new Regex("\\p{IsCombiningDiacriticalMarks}+");
            string temp = s.Normalize(NormalizationForm.FormD);
            string s1 = regex.Replace(temp, String.Empty).Replace('\u0111', 'd').Replace('\u0110', 'D');
            string s2 = " ";
            while (s2.Contains(s1))
            {
                s1.Replace(" ", "");
            }
            return s1;
            
        }

        protected void btn_them_Click(object sender, EventArgs e)
        {
            ViewState["action"] = 1;
            txtTenAlbum.ReadOnly = false;
            hfIDloai.Value = "";
            clear();
            show_dataid(-1);
            ModalPopupExtender1.Show();
                    }
        private void show_dataid(int key)
        {
            DataList1.DataSource = DBProvider.Album_DAO.Instance.GetCTAnlbum(key);
            DataList1.DataBind();
        }
        public void clear()
        {
            fillgridview();
            txtTenAlbum.Text = "";
            txtPath.Text = "";
            lbThanhcong.Text = lbThatbai.Text = "";
            btnSave.Text = "Lưu";
        }
        private void fillgridview()
        {
            gvTuongtacloai.DataSource = DBProvider.DataProvider.Instance1.ExecuteQuery("dbo.viewallalbum");
            gvTuongtacloai.DataBind();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            int action = (int)ViewState["action"];
            if (action == 1)
            {
                if (!string.IsNullOrWhiteSpace(txtTenAlbum.Text))
                {
                    path =  "/" + convertToUnSign3(txtTenAlbum.Text);

                    if (taomoithumuc())//tao thu muc thanh cong
                    {
                        //insert Album
                        if (insertAlbum(txtTenAlbum.Text))
                        {
                            //Insert CTAlbum
                            

                            for (int i = 0; i < Request.Files.Count; i++)
                            {
                                HttpPostedFile file = Request.Files[i];
                                if (file.ContentLength > 0)
                                {
                                    string pathimgI = pathAlbum + "/";
                                    string fname = Path.GetFileName(file.FileName);
                                    pathimgI += fname;
                                    file.SaveAs(Server.MapPath(Path.Combine(pathAlbum, fname)));
                                    DBProvider.Album_DAO.Instance.insertCTAlbum(pathimgI);
                                }
                            }



                        }
                        else
                        {

                        }


                    }
                    
                    

                }

            }
            else if(action == 0)
            {
                pathAlbum = txtPath.Text;
                for (int i = 0; i < Request.Files.Count; i++)
                {
                    HttpPostedFile file = Request.Files[i];
                    if (file.ContentLength > 0)
                    {
                        string pathimgI = pathAlbum + "/";
                        string fname = Path.GetFileName(file.FileName);
                        pathimgI += fname;
                        file.SaveAs(Server.MapPath(Path.Combine(pathAlbum, fname)));
                        DBProvider.Album_DAO.Instance.insertCTAlbum(a,pathimgI);
                    }
                }
                DBProvider.Album_DAO.Instance.updatealbum(a,txtTenAlbum.Text);
            }
            fillgridview();
          
        }

        private bool insertAlbum(string name)
        {
           
            string pathimgI =pathAlbum+"/";
            
            for (int i = 0; i < Request.Files.Count; i++)
            {
                HttpPostedFile file = Request.Files[i];
                if (file.ContentLength > 0)
                {
                    string fname = Path.GetFileName(file.FileName);
                    pathimgI += fname;
                    break;
                }
            }

            if (DBProvider.Album_DAO.Instance.insertAlbum(name, pathAlbum, pathimgI))
            {
                return true;
            }
            else
            {
                return false;
            }


        }

        private bool taomoithumuc()
        {
            string dir_s = Server.MapPath(pathtong.ToString()) + path.ToString();
            if (!Directory.Exists(dir_s))
            {
                Directory.CreateDirectory(dir_s);
                pathAlbum = pathtong + path;
                return true;
            }
            else
            {
                return false;

            }
        }

        protected void btn_edit_edit_Click(object sender, EventArgs e)
        {
            ViewState["action"] = 0;
            txtTenAlbum.ReadOnly = true;
            int IDtable = Convert.ToInt32((sender as Button).CommandArgument);
            a = IDtable;
            txtTenAlbum.ReadOnly = false;

            txtTenAlbum.Text = (DataProvider.Instance1.ExecuteQuery("dbo.getTenAlbum @ID", new object[] {a})).Rows[0]["NAME"].ToString();
            txtPath.Text = (DataProvider.Instance1.ExecuteQuery("dbo.getPath @ID", new object[] { a })).Rows[0]["PathAl"].ToString();

            show_dataid(IDtable);
            ModalPopupExtender1.Show();

        }

        protected void btn_deleteimage_Click(object sender, EventArgs e)
        {
            int IDtable = Convert.ToInt32((sender as Button).CommandArgument);
            
            
            string deletepath = DataProvider.Instance1.ExecuteQuery("dbo.getPathct @ID", new object[] { IDtable }).Rows[0]["PathImg"].ToString();
            
            File.Delete(MapPath(deletepath));
            //delete database
            DBProvider.DataProvider.Instance1.ExecuteNonQuery("DELETE dbo.CTAlbum WHERE ID = "+IDtable);
            show_dataid(a);
            fillgridview();
            ModalPopupExtender1.Show();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

            int IDtable = Convert.ToInt32((sender as Button).CommandArgument);
            string p = (DataProvider.Instance1.ExecuteQuery("dbo.getPath @ID", new object[] { IDtable })).Rows[0]["PathAl"].ToString();
            if (DBProvider.DataProvider.Instance1.ExecuteNonQuery("DELETE dbo.CTAlbum WHERE IDALBUM = "+ IDtable ) > 0)
            {
                if (DBProvider.DataProvider.Instance1.ExecuteNonQuery("DELETE dbo.Album WHERE ID = " + IDtable) > 0)
                {

                    //File.Delete(MapPath(p));
                    Directory.Delete(MapPath(p),true);
                    
                    fillgridview();
                }
                    
            }
        }
    }
}