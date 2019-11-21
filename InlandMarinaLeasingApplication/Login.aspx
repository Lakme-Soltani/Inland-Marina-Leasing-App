<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Login.aspx.cs" Inherits="InlandMarinaLeasingApplication.Login" %>
<asp:Content ContentPlaceHolderID="head" runat="server">
    <!--
Group Assignment: Michael Karpilovski, Kenton Stefanuk, Soltani Bourega, Thomas Onwude
Page Author: Michael Karpilovski, Thomas Onwude
CPRG 214 – Lab 2
Descripton: Boat slip leasing Application for Inland Marina
Date: 2019/09/ 18 - 23
-->
    <script src="Scripts/Login.js"></script>
</asp:Content>
<asp:Content ContentPlaceHolderID="mainPlaceHolder" runat="server"> 
    
    <h3>Kindly log in...</h3>
    <p>&nbsp;</p>

<div class="form-group row">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<Label class="col-form-label col-md-2">Username:&nbsp;&nbsp;</Label>
    <div class="col-md-10 col-sm-10 col-lg-6">
        <asp:TextBox ID="userNameTextBox" runat="server" CssClass="form-control"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="userNameTextBox" CssClass="danger" ErrorMessage="RequiredFieldValidator" ValidationGroup="login" ForeColor="Red">Username input required</asp:RequiredFieldValidator>
   </div>
</div>

<div class="form-group row">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<Label class="col-form-label col-md-2">Password:&nbsp;&nbsp;</Label>
    <div class="col-md-8 col-sm-10 col-lg-6">
        <asp:TextBox ID="passwordTextBox" runat="server" CssClass="form-control"></asp:TextBox>
         <asp:Label ID="passwordInvalidLabel" runat="server" Text="" ForeColor="Red"></asp:Label>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="passwordTextBox" CssClass="danger" Display="Dynamic" ErrorMessage="RequiredFieldValidator" ValidationGroup="login" ForeColor="Red">Password input required</asp:RequiredFieldValidator>
    </div>
 </div>



<div class="form-group row">
    <div class="col-md-offset-2 col-md-10">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<asp:Button ID="continueButton" runat="server" Text="Continue" CssClass="btn btn-secondary" OnClick="continueButton_Click"  />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="cancelButton" runat="server" Text="Cancel" CssClass="btn btn-secondary"
             CausesValidation="False" PostBackUrl="~/Home.aspx" />
        <br />
    </div>
</div>

</asp:Content>
