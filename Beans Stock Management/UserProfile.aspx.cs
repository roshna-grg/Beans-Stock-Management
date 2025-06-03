using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Beans_Stock_Management
{
    public partial class UserProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void logoutBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void addBtn_Click(object sender, EventArgs e)
        {
            string user_name = usernameTB.Text;
            string full_name = fullnameTB.Text;
            string user_contact = contactTB.Text;
            string user_password = passwordTB.Text;

            try
            {
                if (user_name.Equals("") || full_name.Equals("") || user_contact.Equals("") || user_password.Equals(""))
                {
                    Response.Write("<script language=javascript>alert('Please fill all the fields.')</script>");
                }
                else if (user_contact.Length > 10)
                {
                    Response.Write("<script language=javascript>alert('Please enter valid number.')</script>");
                }
                else
                {
                    SqlDataSource2.InsertParameters["username"].DefaultValue = user_name.ToString();
                    SqlDataSource2.InsertParameters["fullname"].DefaultValue = full_name.ToString();
                    SqlDataSource2.InsertParameters["contact"].DefaultValue = user_contact.ToString();
                    SqlDataSource2.InsertParameters["password"].DefaultValue = user_password.ToString();
                    SqlDataSource2.Insert();

                    Response.Write("<script language=javascript>alert('Successfully added.')</script>");

                    usernameTB.Text = "";
                    fullnameTB.Text = "";
                    contactTB.Text = "";
                    passwordTB.Text = "";
                }
            }
            catch (SqlException ex)
            {
                Response.Write("<script language=javascript>alert('Username already exists.')</script>");
            }
        }
    }
}