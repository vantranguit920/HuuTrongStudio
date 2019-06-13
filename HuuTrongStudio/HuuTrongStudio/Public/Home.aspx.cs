using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

namespace HuuTrongStudio.Public
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //DataTable dt2;
            if (!IsPostBack)
            {
                loadAlbum();
               
                loadBG();

                loadvideo();

                //dt2 = DBProvider.BangGia_DB.Instance.GetBanggia();
                //DTlistBG.DataSource = dt2;
                //DTlistBG.DataBind();
            }

        }

        protected void btnXemthem_Click(object sender, EventArgs e)
        {
            Response.Redirect("NewAlbum.aspx");
            //string dir_s = Server.MapPath("../") + "NewAlbumxxx";
            //if (!Directory.Exists(dir_s))
            //{
            //    Directory.CreateDirectory(dir_s);
            //}
        }

        protected void DTlistBG_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        void loadAlbum()
        {

            DataTable dt;
            dt = DBProvider.Album_DAO.Instance.GetAlbum();
            DataList1.DataSource = dt;
            DataList1.DataBind();
        }
        void loadBG()
        {
            List<Model.ModelBanggia> list = DBProvider.BangGia_DB.Instance.getlistBG();
            Session["listBG"] = list;
            DTlistBG.DataSource = list;
            DTlistBG.DataBind();
        }
        void loadvideo()
        {
            DataTable dt;
            dt = DBProvider.Video_DAO.Instance.getListvideo();
            DTLVideo.DataSource = dt;
            DTLVideo.DataBind();
        }

        
    }
}