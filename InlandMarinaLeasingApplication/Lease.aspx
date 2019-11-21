<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Lease.aspx.cs" Inherits="InlandMarinaLeasingApplication.Lease" %>
<asp:Content ContentPlaceHolderID="head" runat="server">
    <!--
Group Assignment: Michael Karpilovski, Kenton Stefanuk, Soltani Bourega, Thomas Onwude
Page Author: Kenton Stefanuk
CPRG 214 – Lab 2
Descripton: Boat slip leasing Application for Inland Marina
Date: 2019/09/ 18 - 23
-->
    <script src="Scripts/Lease.js"></script>
</asp:Content>

<asp:Content ContentPlaceHolderID="mainPlaceHolder" runat="server"> 
    <h1 itemtype="Models/Dock.cs">Lease Slip page</h1>

<asp:Label ID="welcomeLabel" runat="server"></asp:Label>

<div class="container">
    <h5 class="display-4">Available Slips</h5>
    <p><strong>Select slip below</strong></p>

    <div class="card">
    <%--<asp:Repeater ID="operationsRepeater" runat="server" ItemType="Dock" OnItemCommand="operationsRepeater_ItemCommand" OnItemDataBound="operationsRepeater_ItemDataBound">
        <ItemTemplate>--%>
        <div class="card-header">
            <asp:DropDownList ID="dockDropDownList" runat="server" AutoPostBack="True" DataSourceID="ObjectDataSource" DataTextField="name" DataValueField="id">
            </asp:DropDownList>
            <asp:ObjectDataSource ID="ObjectDataSource" runat="server" SelectMethod="getDocks" TypeName="InlandMarinaDB.OperationsDB">
            </asp:ObjectDataSource>
<%--            <asp:Label ID="waterServiceLabel" Visible="<%# Item.waterService %>" runat="server" Text="Label"></asp:Label>--%>
        </div>
        <div class="card-body text-primary">
            <asp:GridView ID="availableSlipsGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="Slip #" DataSourceID="SqlDataSource">
                <Columns>
                    <asp:BoundField DataField="Slip #" HeaderText="Slip #" InsertVisible="False" ReadOnly="True" SortExpression="Slip #" />
                    <asp:BoundField DataField="SlipDimensions (L x W)" HeaderText="SlipDimensions (L x W)" ReadOnly="True" SortExpression="SlipDimensions (L x W)" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:MarinaConnectionString %>" SelectCommand="SELECT s.ID AS [Slip #], CONCAT_WS(' x ', s.Length, s.Width) AS [SlipDimensions (L x W)] FROM Slip AS s LEFT OUTER JOIN Lease AS l ON l.SlipID = s.ID WHERE (s.DockID = @DockID) AND (l.SlipID IS NULL)">
                <SelectParameters>
                    <asp:Parameter Name="DockID" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
      <%--</ItemTemplate>
    </asp:Repeater>--%>
    </div>
    
  

    
 </div>

<div class="container">
    <h5 class="display-4">Purchase Summary</h5>
    <p class="display-4">&nbsp;</p>
  
    <asp:GridView id="leaseSummaryGridView" runat="server">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Label ID="leaseSummaryLabel" Text="<%# Container.DataItem %>" runat="server" ></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
           <asp:TemplateField>
                <ItemTemplate>
                    <asp:Label ID="leaseSummaryLabel" Text="<%# Container.DataItem %>" runat="server" ></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Label ID="leaseSummaryLabel" Text="<%# Container.DataItem %>" runat="server" ></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Label ID="leaseSummaryLabel" Text="<%# Container.DataItem %>" runat="server" ></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</div>


</asp:Content>
