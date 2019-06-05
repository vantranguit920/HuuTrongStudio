using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HuuTrongStudio.Public
{
    public partial class NewAlbum : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
            
            if (!IsPostBack)
            {
                loadalbum();
                               
            }

        }
        void loadalbum()
        {
            DataTable dt;
            dt = DBProvider.Album_DAO.Instance.GetAlbum();
            DataList1.DataSource = dt;
            DataList1.DataBind();
        }
    }
}