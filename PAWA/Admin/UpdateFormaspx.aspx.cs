using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace PAWA.Admin
{
    public partial class UpdateFormaspx : System.Web.UI.Page
    {
        string Connstr = WebConfigurationManager.ConnectionStrings["Conn"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                ClearControls();
                FillGrid();
                FillRoles();
            }
        }
        protected void FillGrid()
        {
            using (SqlConnection con = new SqlConnection(Connstr))
            {
                using (SqlCommand cmd = new SqlCommand("Use_Register", con))
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@option", 4);
                    DataTable dt = new DataTable();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                    GvReg.DataSource = dt;
                    GvReg.DataBind();
                }
            }
        }
        protected void FillRoles()
        {
            using (SqlConnection con = new SqlConnection(Connstr))
            {
                con.Open();
                string sqlstr = "select RoleId,Role from Roleform where IsActive=1";
                DataTable dtuser = new DataTable();
                SqlDataAdapter ds = new SqlDataAdapter(sqlstr, con);
                ds.Fill(dtuser);
                DdlRole.DataSource = dtuser;
                DdlRole.DataBind();
                DdlRole.DataValueField = "RoleId";
                DdlRole.DataTextField = "Role";
                DdlRole.DataBind();

            }
        }
        protected void BtnNew_Click(object sender, EventArgs e)
        {
            ClearControls();
        }
        protected void ClearControls()
        {
            txtUserId.Text = string.Empty;
            txtName.Text = string.Empty;
            txtPassword.Text = string.Empty;
            txtCPassword.Text = string.Empty;
            txtMobileNumber.Text = string.Empty;
            txtEmailId.Text = string.Empty;
            DdlRole.SelectedIndex = -1;
            chkIsActive.Checked = false;
            LblMessage.Text = string.Empty;
        }

        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(Connstr))
            {
                using (SqlCommand cmd = new SqlCommand("Use_Register", con))
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@UName", txtName.Text);
                    cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
                    cmd.Parameters.AddWithValue("@Role", DdlRole.SelectedValue);
                    cmd.Parameters.AddWithValue("@UserId", txtUserId.Text);
                    cmd.Parameters.AddWithValue("@option", 2);
                    cmd.ExecuteNonQuery();
                }
                LblMessage.Text = "Updated  Succesfully";
                FillGrid();
                ClearControls();
            }
        }

        protected void BtnDelete_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(Connstr))
            {
                using (SqlCommand cmd = new SqlCommand("Use_Register", con))
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@UserId", txtUserId.Text);
                    cmd.Parameters.AddWithValue("@option", 3);
                    cmd.ExecuteNonQuery();
                }
                LblMessage.Text = "Deleted Succesfully";
                FillGrid();
                ClearControls();
            }
        }
        protected void GvReg_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtUserId.Text = GvReg.SelectedRow.Cells[1].Text; 
            txtName.Text = GvReg.SelectedRow.Cells[2].Text; 
            txtMobileNumber.Text = GvReg.SelectedRow.Cells[4].Text; 
            txtEmailId.Text = GvReg.SelectedRow.Cells[5].Text;
            DdlRole.SelectedItem.Text= GvReg.SelectedRow.Cells[6].Text;
            chkIsActive.Checked = true;
        }
    }
}