﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Beans_Stock_Management
{
    public partial class Details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DateTime today = DateTime.Today;
            currentDateTB.Text = today.ToString("yyyy/MM/dd");
        }
    }
}