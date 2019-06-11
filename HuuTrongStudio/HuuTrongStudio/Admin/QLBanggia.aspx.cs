using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HuuTrongStudio.Admin
{
    public partial class QLBanggia : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ( !IsPostBack){
                loadBG();
            }

        }
        void loadBG()
        {
            List<Model.ModelBanggia> list = DBProvider.BangGia_DB.Instance.getlistBG();
            Session["listBG"] = list;
            DTlistBG.DataSource = list;
            DTlistBG.DataBind();
        }

        protected void btnXemthem_Click(object sender, EventArgs e)
        {
            Response.Redirect("ThemBG.aspx?ID=0&action=insert");
        }
    }
}