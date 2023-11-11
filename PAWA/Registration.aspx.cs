using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;
namespace PAWA
{
    public partial class Registration : System.Web.UI.Page
    {
        string Connstr = WebConfigurationManager.ConnectionStrings["Conn"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
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
                    GridUser.DataSource = dt;
                    GridUser.DataBind();
                }
                
            }
        }
        protected void FillRoles()
        {
            using (SqlConnection con = new SqlConnection(Connstr))
            {
                     con.Open();
                     string sqlstr = "select RoleId,Role from Roleform where IsActive=1";
                    DataTable dt = new DataTable();
                    SqlDataAdapter da = new SqlDataAdapter(sqlstr,con);
                    da.Fill(dt);
                    DdlRole.DataSource = dt;
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
        protected void BtnSignIn_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(Connstr))
            {
                using (SqlCommand cmd = new SqlCommand("Use_Register", con))
                {
                    int active = 0;
                    if (chkIsActive.Checked == true)
                    {
                        active = 1;
                    }
                    else
                    {
                        active = 0;
                    }
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@UName", txtName.Text);
                    cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
                    cmd.Parameters.AddWithValue("@MNumber", txtMobileNumber.Text);
                    cmd.Parameters.AddWithValue("@EmailId", txtEmailId.Text);
                    cmd.Parameters.AddWithValue("@Role", DdlRole.SelectedValue);
                    cmd.Parameters.AddWithValue("@IsActive", active);
                    cmd.Parameters.AddWithValue("@option", 1);
                    cmd.ExecuteNonQuery();
                }
            }
            LblMessage.Text = "saved Succesfully";
            FillGrid();
        }
    }
}