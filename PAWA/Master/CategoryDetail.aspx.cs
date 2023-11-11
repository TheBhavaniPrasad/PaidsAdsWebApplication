using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PAWA.Master
{
    public partial class CategoryDetail : System.Web.UI.Page
    {
        string Connstr = WebConfigurationManager.ConnectionStrings["Conn"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillTable();
                ClearControls();
            }
        }
        protected void FillTable()
        {
            using (SqlConnection con = new SqlConnection(Connstr))
            {
                using (SqlCommand cmd = new SqlCommand("GenCtgry", con))
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@option", 4);
                    DataTable dt = new DataTable();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                    GvCategory.DataSource = dt;
                    GvCategory.DataBind();
                }
            }
        }
        protected void ClearControls()
        {
            TxtCategoryId.Text = string.Empty;
            TxtCategoryName.Text = string.Empty;
            ChkIsActive.Checked = false;
            Message.Text = string.Empty;
        }
        protected void BtnNew_Click(object sender, EventArgs e)
        {
            ClearControls();
        }
        protected void BtnSave_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(Connstr))
            {
                using (SqlCommand cmd = new SqlCommand("GenCtgry", con))
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@CategoryName", TxtCategoryName.Text);
                    cmd.Parameters.AddWithValue("@IsActive", ChkIsActive.Checked);
                    cmd.Parameters.AddWithValue("@option", 1);
                    cmd.ExecuteNonQuery();
                }
            }
            Message.Text = "saved Succesfully";
            FillTable();
        }

        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(Connstr))
            {
                using (SqlCommand cmd = new SqlCommand("GenCtgry", con))
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@CategoryName", TxtCategoryName.Text);
                    cmd.Parameters.AddWithValue("@CategoryId", TxtCategoryId.Text);
                    cmd.Parameters.AddWithValue("@option", 2);
                    cmd.ExecuteNonQuery();
                }
            }
            Message.Text = "Updated Succesfully";
            FillTable();
        }

        protected void BtnDelete_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(Connstr))
            {
                using (SqlCommand cmd = new SqlCommand("GenCtgry", con))
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@CategoryId", TxtCategoryId.Text);
                    cmd.Parameters.AddWithValue("@option", 3);
                    cmd.ExecuteNonQuery();
                }
                Message.Text = "Deleted Succesfully";
                FillTable();
            }
        }
        protected void GvCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            TxtCategoryId.Text = GvCategory.SelectedRow.Cells[1].Text;
            TxtCategoryName.Text = GvCategory.SelectedRow.Cells[2].Text;
            ChkIsActive.Checked = true;
        }
    }
}