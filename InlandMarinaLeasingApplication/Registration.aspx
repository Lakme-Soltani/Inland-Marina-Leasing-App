<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="InlandMarinaLeasingApplication.Registration" %>
<asp:Content ContentPlaceHolderID="head" runat="server">
    <!--
Group Assignment: Michael Karpilovski, Kenton Stefanuk, Soltani Bourega, Thomas Onwude
Page Author: Michael Karpilovski
CPRG 214 – Lab 2
Descripton: Boat slip leasing Application for Inland Marina
Date: 2019/09/18 - 23
-->
    <script src="Scripts/Registration.js"></script>
</asp:Content>
<asp:Content ContentPlaceHolderID="mainPlaceHolder" runat="server"> 
 
    <h1>Registration page</h1>


  
        
            <asp:Label ID="failedLabel" runat="server" Text="User name already exist. Sign in or use a differnt user name." ForeColor="Red" Visible="False" Font-Size="Medium"></asp:Label>
            <asp:Label ID="successLabel" runat="server" Text="Registration successful, You can now login" Visible="False"></asp:Label>
           <div class="container-fluid"> 
            <div class="form-group row">
            <Label class="col-form-label col-md-2">&nbsp;FirstName:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</Label>
                <div class="col-md-8 col-sm-10 col-lg-6">
                    <asp:TextBox ID="firstNameTextBox" cssclass="form-control" runat="server" placeholder="First Name" ValidationGroup="register"></asp:TextBox><br />
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="firstNameTextBox" ErrorMessage="RequiredFieldValidator" CssClass="text-danger" Text="Please input First name" ValidationGroup="register"></asp:RequiredFieldValidator>
                </div>
            </div>
            
            <div class="form-group row">
            <Label class="col-form-label col-md-2">&nbsp;LastName:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</Label>
                <div class="col-md-8 col-sm-10 col-lg-6">
                   <asp:TextBox ID="lastNameTextBox" cssclass="form-control"  runat="server" placeholder="Last Name" ValidationGroup="register"></asp:TextBox><br />
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="lastNameTextBox" ErrorMessage="RequiredFieldValidator" CssClass="text-danger" Text="Please input Last Name" ValidationGroup="register"></asp:RequiredFieldValidator>
                </div>
            </div>
 
            <div class="form-group row">
            <Label class="col-form-label col-md-2">&nbsp;Phone #:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</Label>
                <div class="col-md-8 col-sm-10 col-lg-6">
                    <asp:TextBox ID="phoneTextBox" cssclass="form-control" runat="server" placeholder="Phone Number" ValidationGroup="register"></asp:TextBox><br />
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="phoneTextBox" ErrorMessage="RequiredFieldValidator" CssClass="text-danger" Text="Please input Phone" Display="Dynamic" ValidationGroup="register"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="phoneTextBox" CssClass="text-danger" Display="Dynamic" ErrorMessage="RegularExpressionValidator" ValidationExpression="((\(\d{3}\) ?)|(\d{3}))?\d{3}\d{4}" ValidationGroup="register">Phone Number Must be Ten Digits</asp:RegularExpressionValidator>
                </div>
            </div>

            <div class="form-group row">
            <Label class="col-form-label col-md-2">&nbsp;City:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</Label>
                <div class="col-md-8 col-sm-10 col-lg-6">
                  <asp:TextBox ID="cityTextBox" cssclass="form-control" runat="server" placeholder="City" ValidationGroup="register"></asp:TextBox><br />
               <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="cityTextBox" ErrorMessage="RequiredFieldValidator" CssClass="text-danger" Text="Please input City" ValidationGroup="register"></asp:RequiredFieldValidator>
                </div>
            </div>
           
            <div class="form-group row">
            <Label class="col-form-label col-md-2">&nbsp;UserName:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</Label>
                <div class="col-md-8 col-sm-10 col-lg-6">
                 <asp:TextBox ID="userNameTextBox" cssclass="form-control" runat="server" placeholder="UserName" ValidationGroup="register"></asp:TextBox><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="userNameTextBox" ErrorMessage="RequiredFieldValidator" CssClass="text-danger" Text="Please input User name" ValidationGroup="register"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-group row">
            <Label class="col-form-label col-md-2">&nbsp;Password:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</Label>
                <div class="col-md-8 col-sm-10 col-lg-6">
                <asp:TextBox type="password" ID="passwordTextBox" cssclass="form-control"  runat="server" placeholder="Password" ValidationGroup="register"></asp:TextBox><br />
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="passwordTextBox" ErrorMessage="RequiredFieldValidator" CssClass="text-danger" Text="Please input password" ValidationGroup="register"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group row">
             <div class="col-md-offset-2 col-md-10">
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 <asp:Button ID="registerButton" class="btn btn-secondary btn-lg" runat="server" Text="Register" OnClick="registerButton_Click" ValidationGroup="register" />
          
                </div>
            </div>
            <br />
        </div>


</asp:Content>

