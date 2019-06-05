using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HuuTrongStudio.Public
{
    public partial class Album : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadpicture();
            }
        }
        void loadpicture()
        {
            int x = int.Parse(Request.QueryString["ID"].ToString());
            string name = Request.QueryString["Name"].ToString();
            lblName.Text = name;
            DTListpic.DataSource = DBProvider.Album_DAO.Instance.GetCTAnlbum(x);
            DTListpic.DataBind();
        }
    }
}