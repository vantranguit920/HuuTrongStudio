using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HuuTrongStudio.Public
{
    public partial class BanggiaDV : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                loadmenu();

                loadnd();
            }
        }
        void loadmenu()
        {
            List<Model.ModelBanggia> list = DBProvider.BangGia_DB.Instance.getlistBG();
            for (int i = 0; i < list.Count; i++)
            {

                lbllistdv.Text = lbllistdv.Text + @"<li ><a href=BanggiaDV.aspx?Name=" + list[i].Id + ">" + list[i].Name + ": " + list[i].Gia + " VND" + "<i class=" + "icon-chevron-right" + "></i></a></li>";
            }

            //Session["listBG"] = list;

        }
        void loadnd()
        {
            string id = Request.QueryString["Name"];
            List<Model.ModelBanggia> list = (List<Model.ModelBanggia>)Session["listBG"];
            foreach (Model.ModelBanggia bg in list)
            {
                if (bg.Id.ToString() == id)
                {
                    title.InnerText = "Gói: " + bg.Name + " Giá:  " + bg.Gia + " VND";
                    BListDV.DataSource = bg.ListKM;
                    BListDV.DataBind();
                    h5ND.InnerText = bg.NoidungCT;
                }
            }
        }
    }
}