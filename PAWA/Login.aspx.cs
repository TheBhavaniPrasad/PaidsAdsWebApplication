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
    public partial class Login : System.Web.UI.Page
    {
        string Connstr = WebConfigurationManager.ConnectionStrings["Conn"].ToString();
        protected void BtnLogin_Click1(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(Connstr))
            {
                using (SqlCommand cmd = new SqlCommand("Use_Register", con))
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;                 
                    cmd.Parameters.AddWithValue("@EmailId",txtUserName.Text);
                    cmd.Parameters.AddWithValue("@Password",txtPassword.Text);
                    cmd.Parameters.AddWithValue("@option", 5);
                    int count = Convert.ToInt32(cmd.ExecuteScalar());
                    if (count == 1)
                    {
                        Response.Redirect("HomePage.aspx");
                    }
                    else
                    {
                        Message.Text = "User Not Exist Pls Register";
                        txtUserName.Text = string.Empty;
                        txtPassword.Text = string.Empty;
                    }
                }
            }
        }

    }

}