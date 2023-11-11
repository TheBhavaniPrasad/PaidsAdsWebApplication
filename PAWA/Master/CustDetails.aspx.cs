using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;


namespace PAWA.Master
{
    public partial class UserDetails : System.Web.UI.Page
    {
        string Connstr = WebConfigurationManager.ConnectionStrings["Conn"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillGrid();
                ClearControls();
            }
        }
        protected void FillGrid()
        {
            using (SqlConnection con = new SqlConnection(Connstr))
            {
                using (SqlCommand cmd = new SqlCommand("GenCustomerDetails", con))
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@option", 4);
                    DataTable dt = new DataTable();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                    GvCustomer.DataSource = dt;
                    GvCustomer.DataBind();
                }
            }
        }

        protected void BtnNew_Click(object sender, EventArgs e)
        {
            ClearControls();
        }
        protected void ClearControls()
        {
            txtCustId.Text = string.Empty;
            txtCustName.Text = string.Empty;
            txtContactNo.Text = string.Empty;
            txtEmailId.Text = string.Empty;
            txtAddress.Text = string.Empty;
            txtDate.Text = string.Empty;
            LblMessage.Text= string.Empty;
        }
        protected void BtnSave_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(Connstr))
            {
                using (SqlCommand cmd = new SqlCommand("GenCustomerDetails", con))
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@CustomerName", txtCustName.Text);
                    cmd.Parameters.AddWithValue("@ContactNo", txtContactNo.Text);
                    cmd.Parameters.AddWithValue("@EmailId", txtEmailId.Text);
                    cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                    cmd.Parameters.AddWithValue("@CreatedDate", txtDate.Text);
                    cmd.Parameters.AddWithValue("@option", 1);
                    cmd.ExecuteNonQuery();
                }
                LblMessage.Text = "saved Succesfully";
                FillGrid();
            }

        }

        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(Connstr))
            {
                using (SqlCommand cmd = new SqlCommand("GenCustomerDetails", con))
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ContactNo", txtContactNo.Text);
                    cmd.Parameters.AddWithValue("@EmailId", txtEmailId.Text);
                    cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                    cmd.Parameters.AddWithValue("@ModifiedDate", txtDate.Text);
                    cmd.Parameters.AddWithValue("@CustomerId", txtCustId.Text);
                    cmd.Parameters.AddWithValue("@option", 2);
                    cmd.ExecuteNonQuery();
                }
                LblMessage.Text = "saved Succesfully";
                FillGrid();
            }
        }

        protected void BtnDelete_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(Connstr))
            {
                using (SqlCommand cmd = new SqlCommand("GenCustomerDetails", con))
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@CustomerId", txtCustId.Text);
                    cmd.Parameters.AddWithValue("@option", 3);
                    cmd.ExecuteNonQuery();
                }
                LblMessage.Text = "Deleted Succesfully";
                FillGrid();
            }
        }

        protected void GvCustomer_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtCustId.Text = GvCustomer.SelectedRow.Cells[2].Text;
            txtCustName.Text = GvCustomer.SelectedRow.Cells[3].Text;
            txtContactNo.Text = GvCustomer.SelectedRow.Cells[4].Text;
            txtEmailId.Text = GvCustomer.SelectedRow.Cells[5].Text;
            txtAddress.Text = GvCustomer.SelectedRow.Cells[6].Text;
            txtDate.Text = GvCustomer.SelectedRow.Cells[7].Text;
        }
    }
}