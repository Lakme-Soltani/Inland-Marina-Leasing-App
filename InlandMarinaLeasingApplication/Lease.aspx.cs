using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;
using InlandMarinaDB;

namespace InlandMarinaLeasingApplication
{
    public partial class Lease : System.Web.UI.Page
    {
        public List<Dock> docks = new List<Dock>();
        public List<string> slipInfo = new List<string>();

        protected void Page_Load(object sender, EventArgs e)
        {
            //redirect user to Login page when not logged in
            if (Session["UserName"] == null)
            {
                Response.Redirect("~/Login.aspx");
            }
            int customerID = Convert.ToInt32(Session["UserName"]);
            int LeasedSlipID = Convert.ToInt32(Session["LeasedSlipID"]);

            welcomeLabel.Text = $"<h3>Welcome back {OperationsDB.getCustomerInfoBy(customerID)}</h3>";

            docks = OperationsDB.getDocks();
            slipInfo = OperationsDB.getSlipInfoBy(customerID);
          

            List<string> slipsLeased = new List<string>();
            slipsLeased = OperationsDB.getSlipsByCustomer(customerID);
            ;
        }

        //protected void operationsRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        //{
        //    if (!OperationsDB.customerIsLoggedIn())
        //    {
        //        Response.Redirect("\\Registration.aspx", true);
        //        return;
        //    }
        //    var item = e.Item;
        //    //int slipID = Convert.ToInt32((item.FindControl("DropDownList1") as DropDownList).SelectedValue);
        //    int customerID = Convert.ToInt32(Session["UserName"]);
        //    if (OperationsDB.LeaseSlip(slipID, customerID))
        //    {
        //        Session["LeasedSlipID"] = slipID;
        //        Response.Redirect("\\LeaseSlip.aspx", true);
        //    }
        //    else
        //    {

        //    }
        //}

        //protected void operationsRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        //{
        //    if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        //    {
        //        Dock dock = (Dock)e.Item.DataItem;
                //DropDownList dropDown = (DropDownList)e.Item.FindControl("DropDownList1");
                //for (int i = 0; i < dock.slips.Count; i++)
                //{
                //    string itemContent = String.Format("Slip{0} - {1} x {2}", dock.slips[i].id, dock.slips[i].width, dock.slips[i].length);
                //    ListItem item = new ListItem(itemContent, dock.slips[i].id.ToString());
                //    dropDown.Items.Insert(i, item);
                //}

        //    }
        //}
    }
}