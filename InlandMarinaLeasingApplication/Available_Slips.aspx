<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Available_Slips.aspx.cs" Inherits="InlandMarinaLeasingApplication.Availablle_Slips" %>
<asp:Content ContentPlaceHolderID="head" runat="server">
<!--
Group Assignment: Michael Karpilovski, Kenton Stefanuk, Soltani Bourega, Thomas Onwude
Page Author:Soltani Bourega
CPRG 214 – Lab 2
Descripton: Boat slip leasing Application for Inland Marina
Date: 2019/09/18 - 23
-->
    <script src="Scripts/AvailableSlips.js"></script>
    <style type="text/css">
        .auto-style2 {
            margin-bottom: .75rem;
            margin-left: 0px;
        }
        .auto-style4 {
            margin-bottom: .75rem;
            margin-left: 508px;
        }
        .auto-style6 {
            color: #212529;
            background-color: #f8f9fa;
            margin-left: 378px;
        }
        .auto-style7 {
            color: #212529;
            background-color: #f8f9fa;
            width: 335px;
            margin-left: 432px;
        }
    </style>
</asp:Content>
<asp:Content ContentPlaceHolderID="mainPlaceHolder" runat="server"> 
<h1 style="font-family: Arial, Helvetica, sans-serif; font-size: medium; font-style: normal; font-variant: normal; text-transform: uppercase">&nbsp;</h1>
    <p aria-checked="undefined" aria-expanded="undefined" aria-multiselectable="False" class="auto-style7" draggable="true" style="font-size: 26px; font-family: Arial, Helvetica, sans-serif; font-weight: bold; color: #000000; background-color: #E9ECEF;">
        Available Slips &amp; Services</p>
    <p>&nbsp;</p>
     <asp:Label ID="Label1" runat="server" Text=" Select Dock " Font-Bold="True" Font-Names="Bahnschrift Light" Font-Size="Medium"></asp:Label>
<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SAITsqlDataSource0" DataTextField="Name" DataValueField="ID" CssClass="auto-style4" Font-Bold="True" Font-Size="Large" style="margin-left: 13px" Width="105px">
        </asp:DropDownList>
            <asp:SqlDataSource ID="SAITsqlDataSource0" runat="server" ConnectionString="<%$ ConnectionStrings:SAITMarinaConnectionString %>" SelectCommand="SELECT [Name], [ID] FROM [Dock]"></asp:SqlDataSource>

            <br />
        <br />
            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" CssClass="auto-style2" DataKeyNames="WaterService,Name,ElectricalService" DataSourceID="SAITSqlDataSource" Height="162px" Width="1064px">
                <Columns>
                    <asp:BoundField DataField="Name" HeaderText="NAME" SortExpression="Name" >
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle Font-Bold="True" Font-Size="Larger" HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:CheckBoxField DataField="WaterService" HeaderText="WATER SERVICE" SortExpression="WaterService">
                    <ControlStyle Font-Names="A,S,F" />
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" />
                    <ItemStyle Font-Bold="True" Font-Size="Larger" HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:CheckBoxField>
                    <asp:CheckBoxField DataField="ElectricalService" HeaderText="ELECTRICAL SERVICE" SortExpression="ElectricalService">
                    <ItemStyle Font-Bold="True" Font-Size="Larger" HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:CheckBoxField>
                </Columns>
                <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" HorizontalAlign="Center" VerticalAlign="Middle" />
                <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                <PagerTemplate>
                    ID
                </PagerTemplate>
                <RowStyle BackColor="White" ForeColor="#003399" />
                <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                <SortedAscendingCellStyle BackColor="#EDF6F6" />
                <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                <SortedDescendingCellStyle BackColor="#D6DFDF" />
                <SortedDescendingHeaderStyle BackColor="#002876" />
            </asp:GridView>
            <asp:SqlDataSource ID="SAITSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:SAITMarinaConnectionString %>" SelectCommand="SELECT [WaterService], [Name], [ElectricalService] FROM [Dock] WHERE ([ID] = @ID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="ID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        <br />
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text="Available Slips by Dock" Font-Bold="True" Font-Names="Bahnschrift Light" Font-Size="Medium"></asp:Label>
        <br />
        <br />
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="ID" DataSourceID="SAITSqlDataSource4" CssClass="auto-style2" Width="1060px">
                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="SLIP#" InsertVisible="False" ReadOnly="True" SortExpression="ID">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Width" HeaderText="WIDTH" SortExpression="Width" >
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Length" HeaderText="LENGTH" SortExpression="Length" >
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                        </Columns>
                        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" HorizontalAlign="Center" VerticalAlign="Middle" />
                        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                        <RowStyle BackColor="White" ForeColor="#003399" />
                        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                        <SortedAscendingCellStyle BackColor="#EDF6F6" />
                        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                        <SortedDescendingCellStyle BackColor="#D6DFDF" />
                        <SortedDescendingHeaderStyle BackColor="#002876" />
                    </asp:GridView>
                <asp:SqlDataSource ID="SAITSqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:MarinaConnectionString2 %>" SelectCommand="SELECT * FROM [Slip] WHERE (([DockID] = @DockID) AND ([ID] &lt;&gt; @ID) AND ([ID] &lt;&gt; @ID2) AND ([ID] &lt;&gt; @ID3))">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="DockID" PropertyName="SelectedValue" Type="Int32" />
                        <asp:ControlParameter ControlID="GridView1" DefaultValue="20" Name="ID" PropertyName="SelectedValue" Type="Int32" />
                        <asp:ControlParameter ControlID="GridView1" DefaultValue="42" Name="ID2" PropertyName="SelectedValue" Type="Int32" />
                        <asp:ControlParameter ControlID="GridView1" DefaultValue="88" Name="ID3" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
    </asp:SqlDataSource>
               <br />
            <asp:Button ID="leaseButton" runat="server" Font-Bold="True" Height="40px" Text="LEASE YOUR SLIP" OnClick="Button1_Click1" BackColor="#99CCFF" Font-Size="Medium" CssClass="auto-style6" />
            <br />
            <br />
            <p>
           </p>
            <p>
           </p>



</asp:Content>
