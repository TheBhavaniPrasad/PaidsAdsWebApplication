using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
namespace PAWA.Transactions
{
    public partial class PaymentDetails : System.Web.UI.Page
    {
        string Connstr = WebConfigurationManager.ConnectionStrings["Conn"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillGrid();
                ClearControls();
                FillBooking();
            }
        }
        protected void ClearControls()
        {
            txtPaymentId.Text= string.Empty;
            DdlBookid1.SelectedIndex = -1;
            ddlRecievedPrice.SelectedIndex =-1;
            txtTotalAmount.Text = string.Empty;
            txtBalance.Text = string.Empty;
            txtReason.Text = string.Empty;
            LblMessage.Text = string.Empty;
        }
        protected void BtnClose_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/HomePage.aspx");
        }
        protected void FillBooking()
        {
            using (SqlConnection con = new SqlConnection(Connstr))
            {
                con.Open();
                string sqlstr = "select BookingId,AdType from AdBooking Where Isactive=1";
                DataTable dtBooking = new DataTable();
                SqlDataAdapter ds = new SqlDataAdapter(sqlstr, con);
                ds.Fill(dtBooking);
                DdlBookid1.DataSource = dtBooking;
                DdlBookid1.DataBind();
                DdlBookid1.DataValueField = "BookingId";
                DdlBookid1.DataTextField = "AdType";
                DdlBookid1.DataBind();
            }
        }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(Connstr))
            {
                using (SqlCommand cmd = new SqlCommand("GenPayment", con))
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@BookingId", DdlBookid1.SelectedValue);
                    cmd.Parameters.AddWithValue("@RecievedPrice", ddlRecievedPrice.SelectedValue);
                    cmd.Parameters.AddWithValue("@TotalAmount", txtTotalAmount.Text);
                    cmd.Parameters.AddWithValue("@Balance", txtBalance.Text);
                    cmd.Parameters.AddWithValue("@Reason", txtReason.Text);
                    cmd.Parameters.AddWithValue("@IsActive", ChKIsActive.Checked);
                    cmd.Parameters.AddWithValue("@option", 1);
                    cmd.ExecuteNonQuery();
                }
            }
            LblMessage.Text = "saved Succesfully";
            FillGrid();
        }
        protected void FillGrid()
        {
            using (SqlConnection con = new SqlConnection(Connstr))
            {
                using (SqlCommand cmd = new SqlCommand("GenPayment", con))
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@option", 2);
                    DataTable dt = new DataTable();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                    GPayView.DataSource = dt;
                    GPayView.DataBind();
                }
            }
        }
        protected void txtBalance_TextChanged(object sender, EventArgs e)
        {
            if (int.TryParse(ddlRecievedPrice.SelectedItem.Text, out int Rp) && int.TryParse(txtTotalAmount.Text, out int Ta))
            {
                int difference = Rp-Ta;
                txtBalance.Text = difference.ToString();
            }
        }

        protected void FillAmount()
        {
            using (SqlConnection con = new SqlConnection(Connstr))
            {
                con.Open();
                string sqlstr = "Select Distinct BookingId,Amount,IsActive from AdBooking where BookingId = '" + DdlBookid1.SelectedValue + "'and IsActive=1";
                DataTable dtAmount = new DataTable();
                SqlDataAdapter ds = new SqlDataAdapter(sqlstr, con);
                ds.Fill(dtAmount);
                ddlRecievedPrice.DataSource = dtAmount;
                ddlRecievedPrice.DataBind();
                ddlRecievedPrice.DataValueField = "BookingId";
                ddlRecievedPrice.DataTextField = "Amount";
                ddlRecievedPrice.DataBind();
            }

        }

        protected void DdlBookid1_SelectedIndexChanged(object sender, EventArgs e)
        {
            FillAmount();
        }

     
    }
}