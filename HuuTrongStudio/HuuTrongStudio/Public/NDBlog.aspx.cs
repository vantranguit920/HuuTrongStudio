using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HuuTrongStudio.Public
{
    public partial class NDBlog : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int id = int.Parse(Request.QueryString["ID"]);
                rpcontent.DataSource = DBProvider.BlogDB.Instance.getlistBlog(id);
                rpcontent.DataBind();
                Dtlblog.DataSource = DBProvider.BlogDB.Instance.getlistBlog();
                Dtlblog.DataBind();
            }

        }
    }
}