using HuuTrongStudio.DBProvider;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HuuTrongStudio
{
    public partial class ThemVideo : System.Web.UI.Page
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
            txtpath.Text = "";
            txtTenVideo.Text = "";
            lbThanhcong.Text = lbThatbai.Text = "";
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            DataProvider.Instance1.ExecuteNonQuery("dbo.themhoaccapnhatvideo @ID , @img , @Path", new object[] {(hfIDloai.Value==""?0:Convert.ToInt32(hfIDloai.Value)),
                txtTenVideo.Text.Trim(),});
            string id = hfIDloai.Value;
            clear();
            if (hfIDloai.Value == "")
                lbThanhcong.Text = "Lưu thành công!";
            else
                lbThanhcong.Text = "Cập nhật thành công!";
            fillgridview();
            hfIDloai.Value = "";
            btnSave.Text = "Lưu";
        }
        void fillgridview()
        {
            gvTuongtacloai.DataSource = DataProvider.Instance1.ExecuteQuery("dbo.viewloaidichvu");

            gvTuongtacloai.DataBind();
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
            hfIDloai.Value = IDtable.ToString();
            txtTenVideo.Text = (DataProvider.Instance1.ExecuteQuery("dbo.getTenloaidichvu @ID", new object[] { Convert.ToInt32(hfIDloai.Value) })).Rows[0]["TenLoaiDichVu"].ToString();
            txtpath.Text = (DataProvider.Instance1.ExecuteQuery("dbo.getNoidung @ID", new object[] { Convert.ToInt32(hfIDloai.Value) })).Rows[0]["NoiDung"].ToString();
            btnSave.Text = "Cập nhật";
        }

        protected void Deleteclick(object sender, EventArgs e)
        {
            int IDtable = Convert.ToInt32((sender as Button).CommandArgument);
            hfIDloai.Value = IDtable.ToString();
            temp = Convert.ToInt32(hfIDloai.Value);
            delete(temp);
        }

        void delete(int key)
        {
            DataProvider.Instance1.ExecuteQuery("dbo.Xoaloai @ID", new object[] { key });
            clear();
            fillgridview();
            lbThanhcong.Text = "Xóa thành công!";
            hfIDloai.Value = "";
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