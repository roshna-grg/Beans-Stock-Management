using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Beans_Stock_Management
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void updateBtn_Click(object sender, EventArgs e)
        {
            String user_name = usernameTB.Text;
            String pass_word = passwordTB.Text;
            String new_password = newPassTB.Text;

            if ( user_name.Equals("") || pass_word.Equals("") || new_password.Equals(""))
            {
                Response.Write("<script language=javascript>alert('Please fill all the fields.')</script>");
            }
            else {
                DataView checkProfile = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
                bool profileCheck = checkProfile.Table.Rows.Count > 0;
                if (profileCheck)
                {
                    SqlDataSource2.UpdateParameters["username"].DefaultValue = user_name.ToString();
                    SqlDataSource2.UpdateParameters["password"].DefaultValue = new_password.ToString();
                    SqlDataSource2.Update();

                    Response.Write("<script language=javascript>alert('Successfully updated.')</script>");

                    usernameTB.Text = "";
                    passwordTB.Text = "";
                    newPassTB.Text = "";

                }
                else
                {
                    Response.Write("<script language=javascript>alert('Incorrect data.')</script>");
                }
            }
        }
    }
}