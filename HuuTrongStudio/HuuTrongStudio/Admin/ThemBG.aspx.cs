using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HuuTrongStudio.Admin
{
    public partial class ThemBG : System.Web.UI.Page
    {
        int id;
        string action;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState["action"]  = Request.QueryString["action"].ToString().Trim();
                ViewState["id"] = Int32.Parse(Request.QueryString["ID"].ToString());
                if (((string)ViewState["action"]).Equals("update"))
                {
                    loadBG();
                }
            }

        }
        void loadBG()
        {
            Model.ModelBanggia model = DBProvider.BangGia_DB.Instance.getBGbyid((int)ViewState["id"]);
            txtnameDV.Text = model.Name;
            txtGia.Text = model.Gia.ToString();
            txtKM.Text = model.Noidung;
            txtND.InnerText = model.NoidungCT;
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                if (((string)ViewState["action"]).Equals("update"))
                {
                    if(DBProvider.BangGia_DB.Instance.updateBG((int)ViewState["id"], txtnameDV.Text, Int32.Parse(txtGia.Text), txtKM.Text, txtND.InnerText))
                    Response.Redirect("QLBanggia.aspx");
                }
                else
                {
                    if(DBProvider.BangGia_DB.Instance.insertBG(txtnameDV.Text, Int32.Parse(txtGia.Text), txtKM.Text, txtND.InnerText))
                    Response.Redirect("QLBanggia.aspx");
                }
            }
           
        }
    }
}