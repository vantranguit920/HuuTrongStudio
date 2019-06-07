using HuuTrongStudio.DBProvider;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HuuTrongStudio.Admin
{
    public partial class DichVu : System.Web.UI.Page
    {
        static int temp;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fillgridview();
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            clear();
        }
        public void clear()
        {
            txtgia.Text = "";
            txtNoidung.Text = "";
            txtTen.Text = "";
            lbThanhcong.Text = lbThatbai.Text = "";
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            DataProvider.Instance1.ExecuteNonQuery("dbo.ThemhoacCapnhat @ID , @Name , @Gia , @Noidung", new object[] {(hfID.Value==""?0:Convert.ToInt32(hfID.Value)),
                txtTen.Text.Trim(),txtNoidung.Text.Trim(),txtgia.Text.Trim()});
            string id = hfID.Value;
            clear();
            if (hfID.Value == "")
                lbThanhcong.Text = "Lưu thành công!";
            else
                lbThanhcong.Text = "Cập nhật thành công!";
            fillgridview();
            hfID.Value = "";
            btnSave.Text = "Lưu";
        }
        void fillgridview()
        {
            gvTuongtac.DataSource = DataProvider.Instance1.ExecuteQuery("dbo.viewall");
            gvTuongtac.DataBind();
        }
        protected void Edit(object sender, EventArgs e)
        {
        }

        protected void gvTuongtac_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void Editclick(object sender, EventArgs e)
        {
            int IDtable = Convert.ToInt32((sender as Button).CommandArgument);
            hfID.Value = IDtable.ToString();
            txtTen.Text = (DataProvider.Instance1.ExecuteQuery("dbo.getTen @ID", new object[] { Convert.ToInt32(hfID.Value) })).Rows[0]["Ten"].ToString();
            txtgia.Text = (DataProvider.Instance1.ExecuteQuery("dbo.getGia @ID", new object[] { Convert.ToInt32(hfID.Value) })).Rows[0]["Gia"].ToString();
            txtNoidung.Text = (DataProvider.Instance1.ExecuteQuery("dbo.Noidung @ID", new object[] { Convert.ToInt32(hfID.Value) })).Rows[0]["Noidung"].ToString();
            btnSave.Text = "Cập nhật";
        }

        protected void Deleteclick(object sender, EventArgs e)
        {
            int IDtable = Convert.ToInt32((sender as Button).CommandArgument);
            hfID.Value = IDtable.ToString();
            temp = Convert.ToInt32(hfID.Value);
            delete(temp);
        }

        void delete(int key)
        {
            DataProvider.Instance1.ExecuteQuery("dbo.Xoa @ID", new object[] { key });
            clear();
            fillgridview();
            lbThanhcong.Text = "Xóa thành công!";
            hfID.Value = "";
        }
        protected void gvTuongtac_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
  
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            delete(temp);
        }
    }
}