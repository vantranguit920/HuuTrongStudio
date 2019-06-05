using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace HuuTrongStudio.Public
{
    public partial class Lienhe : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                drdGoiDV.DataSource = (List<Model.ModelBanggia>)Session["listBG"];
                drdGoiDV.DataTextField = "Name";
                drdGoiDV.DataValueField = "Id";
                drdGoiDV.SelectedIndex = 0;
                drdGoiDV.DataBind();
                lblDV.Text = drdGoiDV.SelectedItem.Text;
                
            }
            
        }

        protected void drdGoiDV_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblDV.Text = drdGoiDV.SelectedItem.Text;
        }
        
        protected void Unnamed_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;
            if (DBProvider.Donhang_DAO.Instance.InsertDonhang(txtName.Text, txtPhone.Text, txtEmail.Text, drdGoiDV.SelectedItem.Text, txtGhiChu.Text + " "))
            {
                Response.Write("<script>alert('Đặt thành công!!')</script>");
                Response.Redirect("Home.aspx");
            }
            else
            {
                Response.Write("<script>alert('Đặt thất bại!!')</script>");
            }

        }
    }
}