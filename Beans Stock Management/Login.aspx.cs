using System;
using System.Data;
using System.Threading;
using System.Web.Security;
using System.Web.UI;

namespace Beans_Stock_Management
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            String aUsername = "admin";
            String aPassword = "admin";

            String chkUsername = TextBoxUsername.Text;
            String chkPassword = TextBoxPassword.Text;

            DataView data = (DataView)SqlDataSourceLogin.Select(DataSourceSelectArguments.Empty);
            bool authenticated = data.Table.Rows.Count > 0;

            if (chkUsername.Equals(aUsername) && chkPassword.Equals(aPassword))
            {
                Response.Redirect("UserProfile.aspx");
            }
            else if (chkUsername.Equals("") || chkPassword.Equals(""))
            {
                Response.Write("<script language=javascript>alert('Please fill all the fields')</script>");
            }
            else if (authenticated)
            {
                Response.Redirect("Default.aspx");
            }
            else
            {
                Response.Write("<script language=javascript>alert('Incorrect credentials')</script>");
            }
        }
    }
}