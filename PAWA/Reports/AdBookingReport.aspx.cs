using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace PAWA.Reports
{
    public partial class AdBookingReport : System.Web.UI.Page
    {
        string Connstr = WebConfigurationManager.ConnectionStrings["Conn"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillAdBookinglist();
            }
        }
        protected void FillAdBookinglist()
        {
            using (SqlConnection con = new SqlConnection(Connstr))
            {
                string sqlstr = "select BookingId,AdType,a.ItemName,a.ItemPrice,ItemDescription,CreatedDate,ModifiedDate,Location,Amount,ab.IsActive from AdBooking ab inner join AdItem a on a.ItemNo = ab.ItemId where ab.IsActive = 1";
                SqlDataAdapter da = new SqlDataAdapter(sqlstr, con);
                DataTable dtbooking = new DataTable();
                da.Fill(dtbooking);
                GvBooking.DataSource = dtbooking;
                GvBooking.DataBind();
            }
        }

        protected void TxtBookingId_TextChanged(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(Connstr))
            {

                string sqlstr = "select BookingId,AdType,a.ItemName,a.ItemPrice,ItemDescription,CreatedDate,ModifiedDate,Location,Amount,ab.IsActive from AdBooking ab inner join AdItem a on a.ItemNo = ab.ItemId where ab.IsActive = 1 and BookingId like '" + TxtBookingId.Text + "%" + "'";
                SqlDataAdapter da = new SqlDataAdapter(sqlstr, con);
                DataTable dtbooking = new DataTable();
                da.Fill(dtbooking);
                GvBooking.DataSource = dtbooking;
                GvBooking.DataBind();
            }
        }
        protected void BtnGenerate_Click(object sender, EventArgs e)
        {
            ExportExcel();
        }
        private void ExportExcel()
        {
            Response.Clear();
            Response.Buffer = true;
            Response.ClearContent();
            Response.ClearHeaders();
            Response.Charset = "";
            string FileName = "AdBooking" + DateTime.Now + ".xls";
            StringWriter strwritter = new StringWriter();
            HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
            GvBooking.GridLines = GridLines.Both;
            GvBooking.HeaderStyle.Font.Bold = true;
            GvBooking.RenderControl(htmltextwrtter);
            Response.Write(strwritter.ToString());
            Response.End();
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }
    }
}