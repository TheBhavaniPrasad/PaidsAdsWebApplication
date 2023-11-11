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
    public partial class Role : System.Web.UI.Page
    {
        string Connstr = WebConfigurationManager.ConnectionStrings["Conn"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                ClearControls();
                FillTable();
            }
        }
        protected void BtnNew_Click(object sender, EventArgs e)
        {
            ClearControls();
        }
        protected void ClearControls()
        {
            txtRoleId.Text = string.Empty;
            TxtRole.Text = string.Empty;
            Chkboxisactive.Checked = false;
            LblMessage.Text = string.Empty; 
        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(Connstr))
            {
                using (SqlCommand cmd = new SqlCommand("GenRole", con))
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Role", TxtRole.Text);
                    cmd.Parameters.AddWithValue("@IsActive", Chkboxisactive.Checked);
                    cmd.Parameters.AddWithValue("@option", 1);
                    cmd.ExecuteNonQuery();
                }
            }
            LblMessage.Text = "saved Succesfully";
            FillTable();
        }
        protected void BtnUpdate_Click1(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(Connstr))
            {
                using (SqlCommand cmd = new SqlCommand("GenRole", con))
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Role", TxtRole.Text);
                    cmd.Parameters.AddWithValue("@RoleId", txtRoleId.Text);
                    cmd.Parameters.AddWithValue("@option", 2);
                    cmd.ExecuteNonQuery();
                }
                LblMessage.Text = "Updated  Succesfully";
                FillTable();
            }
        }
        protected void BtnDelete_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(Connstr))
            {
                using (SqlCommand cmd = new SqlCommand("GenRole", con))
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@RoleId", txtRoleId.Text);
                    cmd.Parameters.AddWithValue("@option", 3);
                    cmd.ExecuteNonQuery();
                }
                LblMessage.Text = "Deleted Succesfully";
                FillTable();
            }
        }
        protected void FillTable()
        {
            using (SqlConnection con = new SqlConnection(Connstr))
            {
                using (SqlCommand cmd = new SqlCommand("GenRole", con))
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@option", 4);
                    DataTable dt = new DataTable();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                    GvUserList.DataSource = dt;
                    GvUserList.DataBind();
                }

            }
        }
        protected void GvUserList_SelectedIndexChanged1(object sender, EventArgs e)
        {
            txtRoleId.Text = GvUserList.SelectedRow.Cells[2].Text;
            TxtRole.Text = GvUserList.SelectedRow.Cells[3].Text;
            Chkboxisactive.Checked = true;

        }
    }
}