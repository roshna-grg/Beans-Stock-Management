using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Beans_Stock_Management
{
    public partial class Item : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void addBtn_Click(object sender, EventArgs e)
        {
            String item_id = itemIDTB.Text;
            String item_name = itemNameTB.Text;
            String item_description = descriptionTB.Text;
            String price = priceTB.Text;

            DateTime pDate = Convert.ToDateTime(purchaseTB.Text);
            string purchase_date = pDate.ToString("yyyy/MM/dd");

            String category_id = categoryDDL.SelectedValue;

            DateTime mDate = Convert.ToDateTime(manufactureTB.Text);
            String manufacture_date = mDate.ToString("yyyy/MM/dd");

            DateTime eDate = Convert.ToDateTime(expiryTB.Text);
            String expiry_Date = eDate.ToString("yyyy/MM/dd");

            try
            {
                if (item_id.Equals("") || item_name.Equals("") || item_description.Equals("") || price.Equals("") || category_id.Equals("") || pDate.Equals(""))
                {
                    Response.Write("<script language=javascript>alert('Please fill all the fields.')</script>");
                }
                else
                {
                    SqlDataSource2.InsertParameters["itemID"].DefaultValue = item_id.ToString();
                    SqlDataSource2.InsertParameters["itemName"].DefaultValue = item_name.ToString();
                    SqlDataSource2.InsertParameters["description"].DefaultValue = item_description.ToString();
                    SqlDataSource2.InsertParameters["price"].DefaultValue = price.ToString();
                    SqlDataSource2.InsertParameters["purchaseDate"].DefaultValue = purchase_date.ToString();
                    SqlDataSource2.InsertParameters["categoryID"].DefaultValue = category_id.ToString();
                    SqlDataSource2.InsertParameters["manufactureDate"].DefaultValue = manufacture_date.ToString();
                    SqlDataSource2.InsertParameters["expiryDate"].DefaultValue = expiry_Date.ToString();
                    SqlDataSource2.Insert();

                    Response.Write("<script language=javascript>alert('Successfully added')</script>");

                    itemIDTB.Text = "";
                    itemNameTB.Text = "";
                    descriptionTB.Text = "";
                    priceTB.Text = "";
                }
            }
            catch (SqlException ex)
            {
                Response.Write("<script language=javascript>alert('Item ID already exists.')</script>");
            }
        }
    }
}