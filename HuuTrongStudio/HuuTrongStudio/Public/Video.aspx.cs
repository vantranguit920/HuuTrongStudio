using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HuuTrongStudio.Public
{
    public partial class Video : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadvideo();
            }
        }
        void loadvideo()
        {
            DataTable dt;
            dt = DBProvider.Video_DAO.Instance.getListvideo();
            DTLVideo.DataSource = dt;
            DTLVideo.DataBind();
            string link = Request.QueryString["ID"];
            ifVideo.Src = link;
        }
    }
}