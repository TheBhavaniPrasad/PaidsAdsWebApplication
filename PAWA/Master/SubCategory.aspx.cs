using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace PAWA.Master
{
    public partial class SubCategory : System.Web.UI.Page
    {
        string Connstr = WebConfigurationManager.ConnectionStrings["Conn"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillSubCategory();
                FillCategory();
                ClearControls();
            }
        }
        protected void FillSubCategory()
        {
            using (SqlConnection con = new SqlConnection(Connstr))
            {
                using (SqlCommand cmd = new SqlCommand("Use_SubCategory", con))
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@option", 4);
                    DataTable dt = new DataTable();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                    GvSubCategory.DataSource = dt;
                    GvSubCategory.DataBind();
                }
            }
        }
        protected void ClearControls()
        {
            DdlCategory.SelectedIndex = -1;
            TxtSubCategoryId.Text= string.Empty;
            TxtSubCategoryName.Text = string.Empty;
            ChkIsActive.Checked = false;
            Message.Text = string.Empty;
        }
        protected void FillCategory()
        {
            using (SqlConnection con = new SqlConnection(Connstr))
            {
                con.Open();
                string sqlstr = "select CategoryId,CategoryName from tblCategory where IsActive=1";
                DataTable dtsubCategory = new DataTable();
                SqlDataAdapter ds = new SqlDataAdapter(sqlstr, con);
                ds.Fill(dtsubCategory);
                DdlCategory.DataSource = dtsubCategory;
                DdlCategory.DataBind();
                DdlCategory.DataValueField = "CategoryId";
                DdlCategory.DataTextField = "CategoryName";
                DdlCategory.DataBind();

            }
        }
        protected void BtnNew_Click(object sender, EventArgs e)
        {
            ClearControls();
        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(Connstr))
            {
                using (SqlCommand cmd = new SqlCommand("Use_SubCategory", con))
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@CategoryId", DdlCategory.SelectedValue);
                    cmd.Parameters.AddWithValue("@SubCategoryId", TxtSubCategoryId.Text);
                    cmd.Parameters.AddWithValue("@SubCategoryName", TxtSubCategoryName.Text);
                    cmd.Parameters.AddWithValue("@IsActive", ChkIsActive.Checked);
                    cmd.Parameters.AddWithValue("@option", 1);
                    cmd.ExecuteNonQuery();
                }
            }
            Message.Text = "saved Succesfully";
            FillSubCategory();
        }

        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(Connstr))
            {
                using (SqlCommand cmd = new SqlCommand("Use_SubCategory", con))
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@SubCategoryName", TxtSubCategoryName.Text);
                    cmd.Parameters.AddWithValue("@SubCategoryId", TxtSubCategoryId.Text);
                    cmd.Parameters.AddWithValue("@option", 2);
                    cmd.ExecuteNonQuery();
                }
            }
            Message.Text = "Updated Succesfully";
            FillSubCategory();
        }

        protected void BtnDelete_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(Connstr))
            {
                using (SqlCommand cmd = new SqlCommand("Use_SubCategory", con))
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@SubCategoryId", TxtSubCategoryId.Text);
                    cmd.Parameters.AddWithValue("@option", 3);
                    cmd.ExecuteNonQuery();
                }
            }
            Message.Text = "Deleted Succesfully";
            FillSubCategory();
        }

        protected void GvSubCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            DdlCategory.SelectedItem.Text = GvSubCategory.SelectedRow.Cells[1].Text;
            TxtSubCategoryId.Text = GvSubCategory.SelectedRow.Cells[2].Text;
            TxtSubCategoryName.Text = GvSubCategory.SelectedRow.Cells[3].Text;
            ChkIsActive.Checked = true;
        }
    }
}