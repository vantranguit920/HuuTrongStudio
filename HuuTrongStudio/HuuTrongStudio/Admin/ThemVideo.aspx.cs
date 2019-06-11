using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HuuTrongStudio.Admin
{
    public partial class ThemVideo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (DBProvider.VideoDB.Instance.InsertVideo(txtGia.Text, txtnameDV.Text, txtKM.Text))
                Response.Write("<script> alert('Them thanh cong!')</script>");
        }
    }
}