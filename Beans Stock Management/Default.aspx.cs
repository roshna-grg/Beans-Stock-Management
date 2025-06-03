using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Beans_Stock_Management
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataView checkData = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            bool stockCheck = checkData.Table.Rows.Count > 0;
            if (stockCheck)
            {
                Response.Write("<script language=javascript>alert('Some items are running out of stock')</script>");
            }
        }

        protected void itemBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Item.aspx");
        }

        protected void categoryBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Category.aspx");
        }

        protected void custBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Customer.aspx");
        }
    }
}