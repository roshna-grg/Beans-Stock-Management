using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Beans_Stock_Management
{
    public partial class Customer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void addBtn_Click(object sender, EventArgs e)
        {
            String user_name = usernameTB.Text;
            String customer_Name = nameTB.Text;
            String customer_Address = addressTB.Text;
            String contact_No = contactTB.Text;
            String cust_email = emailTB.Text;
            String member_Type = memberTypeDDL.SelectedValue;
            String pass_word = passwordTB.Text;

            try
            {
                if (user_name.Equals("") || customer_Name.Equals("") || customer_Address.Equals("") || contact_No.Equals("") || cust_email.Equals("") || member_Type.Equals("") || pass_word.Equals(""))
                {
                    Response.Write("<script language=javascript>alert('Please fill all the fields.')</script>");
                }
                else if (contact_No.Length > 10)
                {
                    Response.Write("<script language=javascript>alert('Please enter correct contact number.')</script>");
                }
                else
                {
                    SqlDataSource1.InsertParameters["username"].DefaultValue = user_name.ToString();
                    SqlDataSource1.InsertParameters["customerName"].DefaultValue = customer_Name.ToString();
                    SqlDataSource1.InsertParameters["customerAddress"].DefaultValue = customer_Address.ToString();
                    SqlDataSource1.InsertParameters["contactNo"].DefaultValue = contact_No.ToString();
                    SqlDataSource1.InsertParameters["email"].DefaultValue = cust_email.ToString();
                    SqlDataSource1.InsertParameters["memberType"].DefaultValue = member_Type.ToString();
                    SqlDataSource1.InsertParameters["password"].DefaultValue = pass_word.ToString();
                    SqlDataSource1.Insert();

                    Response.Write("<script language=javascript>alert('Successfully added.')</script>");

                    usernameTB.Text = "";
                    nameTB.Text = "";
                    addressTB.Text = "";
                    contactTB.Text = "";
                    emailTB.Text = "";
                    memberTypeDDL.SelectedIndex = 0;
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