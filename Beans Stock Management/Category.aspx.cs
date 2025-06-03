using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Beans_Stock_Management
{
    public partial class Category : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ctgAdd_Click(object sender, EventArgs e)
        {
            string category_id = categoryIDTB.Text;
            string category_name = ctgNameTB.Text;
            string category_description = ctgDescTB.Text;

            try
            {
                if (category_id.Equals("") || category_name.Equals("") || category_description.Equals(""))
                {
                    Response.Write("<script language=javascript>alert('Please fill all the fields.')</script>");
                }
                else
                {
                    SqlDataSource1.InsertParameters["categoryID"].DefaultValue = category_id.ToString();
                    SqlDataSource1.InsertParameters["categoryName"].DefaultValue = category_name.ToString();
                    SqlDataSource1.InsertParameters["description"].DefaultValue = category_description.ToString();
                    SqlDataSource1.Insert();

                    Response.Write("<script language=javascript>alert('Category successfully added.')</script>");

                    categoryIDTB.Text = "";
                    ctgNameTB.Text = "";
                    ctgDescTB.Text = "";
                }
            }
            catch (SqlException ex)
            {
                Response.Write("<script language=javascript>alert('Category ID already exists.')</script>");
            }
        }

    }
}