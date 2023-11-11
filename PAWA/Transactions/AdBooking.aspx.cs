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
    public partial class AdBooking : System.Web.UI.Page

    {
        string Connstr = WebConfigurationManager.ConnectionStrings["Conn"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                FillGrid();
                ClearControls();
                FillItemId();
            }
        }

        protected void BtnNew_Click(object sender, EventArgs e)
        {
            ClearControls();
        }
        protected void ClearControls()
        {
            txtBookingId.Text = string.Empty;
            DdlItemId.SelectedIndex = -1;
            TxtAdType.Text = string.Empty;
            DdlPrice.SelectedIndex = -1;
            TxtDate.Text = string.Empty;
            DdlLocation.SelectedIndex = -1;
            txtAmount.Text = string.Empty;
            LblMessage.Text = string.Empty;
            ChkIsActive.Checked = false;

        }
        protected void BtnClose_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/HomePage.aspx");
        }
        protected void BtnSave_Click(object sender, EventArgs e)
        {

            using (SqlConnection con = new SqlConnection(Connstr))
            {
                using (SqlCommand cmd = new SqlCommand("Use_Booking", con))
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("AdType", TxtAdType.Text);
                    cmd.Parameters.AddWithValue("ItemId", DdlItemId.SelectedValue);
                    cmd.Parameters.AddWithValue("@ItemDescription", TxtDescription.Text);
                    cmd.Parameters.AddWithValue("@Price", DdlPrice.SelectedValue);
                    cmd.Parameters.AddWithValue("@CreatedDate", TxtDate.Text);
                    cmd.Parameters.AddWithValue("@Location", DdlLocation.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@Amount", txtAmount.Text);
                    cmd.Parameters.AddWithValue("@IsActive",ChkIsActive.Checked);
                    cmd.Parameters.AddWithValue("@option", 1);
                    cmd.ExecuteNonQuery();
                }
            }
            LblMessage.Text = "saved Succesfully";
            FillGrid();
        }
        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(Connstr))
            {
                using (SqlCommand cmd = new SqlCommand("Use_Booking", con))
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ItemDescription", TxtDescription.Text);
                    cmd.Parameters.AddWithValue("@ModifiedDate", TxtDate.Text);
                    cmd.Parameters.AddWithValue("@Location", DdlLocation.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@Amount", txtAmount.Text);
                    cmd.Parameters.AddWithValue("@BookingId", txtBookingId.Text);
                    cmd.Parameters.AddWithValue("@option", 2);
                    cmd.ExecuteNonQuery();
                }
            }
            LblMessage.Text = "Updated Succesfully";
            FillGrid();

        }
        protected void BtnDelete_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(Connstr))
            {
                using (SqlCommand cmd = new SqlCommand("Use_Booking", con))
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@BookingId", txtBookingId.Text);
                    cmd.Parameters.AddWithValue("@option", 3);
                    cmd.ExecuteNonQuery();
                }
                LblMessage.Text = "Deleted Succesfully";
                FillGrid();
            }

        }
        
        protected void FillItemId()
        {
            using (SqlConnection con = new SqlConnection(Connstr))
            {
                con.Open();
                string sqlstr = "select ItemNo,ItemName from AdItem where IsActive=1";
                DataTable dtitemid = new DataTable();
                SqlDataAdapter ds = new SqlDataAdapter(sqlstr, con);
                ds.Fill(dtitemid);
                DdlItemId.DataSource = dtitemid;
                DdlItemId.DataBind();
                DdlItemId.DataValueField = "ItemNo";
                DdlItemId.DataTextField = "ItemName";
                DdlItemId.DataBind();
            }
        }

        protected void FillGrid()
        {
            using (SqlConnection con = new SqlConnection(Connstr))
            {
                using (SqlCommand cmd = new SqlCommand("Use_Booking", con))
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@option", 4);
                    DataTable dt = new DataTable();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                    GvBooking.DataSource = dt;
                    GvBooking.DataBind();
                }
            }
        }
       

        protected void GvBooking_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtBookingId.Text = GvBooking.SelectedRow.Cells[1].Text;
            TxtAdType.Text= GvBooking.SelectedRow.Cells[2].Text;
            DdlItemId.SelectedItem.Text = GvBooking.SelectedRow.Cells[3].Text;
            TxtDescription.Text= GvBooking.SelectedRow.Cells[5].Text;
            DdlLocation.SelectedItem.Text = GvBooking.SelectedRow.Cells[8].Text;
            txtAmount.Text = GvBooking.SelectedRow.Cells[9].Text;
            
        }
        protected void DdlItemId_SelectedIndexChanged(object sender, EventArgs e)
        {
            FillItemPrice();
        }
        protected void FillItemPrice()
        {
            using (SqlConnection con = new SqlConnection(Connstr))
            {
                con.Open();
                string sqlstr = "select ItemPrice,ItemNo from AdItem where IsActive=1 and ItemNo='" +DdlItemId.SelectedValue+ "' ";
                DataTable dtitemid = new DataTable();
                SqlDataAdapter ds = new SqlDataAdapter(sqlstr, con);
                ds.Fill(dtitemid);
                DdlPrice.DataSource = dtitemid;
                DdlPrice.DataBind();
                DdlPrice.DataValueField = "ItemNo";
                DdlPrice.DataTextField = "ItemPrice";
                DdlPrice.DataBind();
            }
        }

    }
}