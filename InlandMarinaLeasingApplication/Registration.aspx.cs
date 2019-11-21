using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using InlandMarinaDB;

namespace InlandMarinaLeasingApplication
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void registerButton_Click(object sender, EventArgs e)
        {
            if (RegistrationDB.isCustomerExist(userNameTextBox.Text))
            {
                failedLabel.Visible = true;
                return;
            }

            failedLabel.Visible = false;
            string encryptedPwd = LoginUtility.GetEncryptedValue(passwordTextBox.Text);
            RegistrationDB.AddCustomer(firstNameTextBox.Text, lastNameTextBox.Text, 
                                                    phoneTextBox.Text, cityTextBox.Text, 
                                                    userNameTextBox.Text, encryptedPwd);
           successLabel.Visible = true;
        }
    }
}