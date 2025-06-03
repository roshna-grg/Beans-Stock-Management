<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="Beans_Stock_Management.Details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br /><br />
    <style type="text/css">
        body{
            background-color:#311432;
        }
        .floatRight {
            float: right;
        }

        .floatLeft {
            float: left;
        }
    </style>

    <div>
        <asp:Panel ID="Panel1" runat="server" Width="20%" CssClass="floatLeft">
            <div style="margin-top:50px">
                <table style="border-right: 3px solid gray; width:90%; height:344px;">
                  <tr>
                      <td>
                          <p style="font-family:Lobster; font-size:55px; text-align:center; color:FloralWhite;">Details</p>
                      </td>
                  </tr>
                </table>
            </div>
        </asp:Panel>

        <asp:Panel ID="Panel2" runat="server" Width="80%" CssClass="floatRight">
            <br /><br />
            <table>
                <tr style="height:50px">
                    <td style="width:50%">
                        <asp:Label ID="currentDateL" runat="server" Text="Current Date" Font-Names="Poppins Light" Font-Size="20px" ForeColor="FloralWhite"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="currentDateTB" runat="server" ReadOnly="True" Font-Names="Poppins Light" Font-Size="18px"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <br />
            <asp:Label ID="Label1" runat="server" Text="List of all customers who have not bought any items in the last 31 days" Font-Names="Poppins Light" Font-Size="20px" ForeColor="FloralWhite"></asp:Label>
            <br /><br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Height="100%" Width="100%" Font-Size="16px" BackColor="LightGray"  BorderColor="#2f4c66" BorderStyle="Solid">
                <Columns>
                    <asp:BoundField DataField="username" HeaderText="Username" SortExpression="username" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#507ca3"/>
                    <asp:BoundField DataField="customerName" HeaderText="Customer Name" SortExpression="customerName" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#507ca3"/>
                    <asp:BoundField DataField="customerAddress" HeaderText="Address" SortExpression="customerAddress" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#507ca3"/>
                    <asp:BoundField DataField="contactNo" HeaderText="Contact No" SortExpression="contactNo" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#507ca3"/>
                    <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#507ca3"/>
                    <asp:BoundField DataField="memberType" HeaderText="Member Type" SortExpression="memberType" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#507ca3"/>
                    <asp:BoundField DataField="purchase_date" HeaderText="Purchase Date" SortExpression="purchase_date" ReadOnly="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#507ca3"/>
                </Columns>
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StockConnection %>" SelectCommand="SELECT Purchase.username, Customer.customerName, Customer.customerAddress, Customer.contactNo, Customer.email, Customer.memberType, FORMAT (Purchase.purchase_date, 'yyyy/MM/dd') AS purchase_date FROM Customer, Purchase WHERE Customer.username = Purchase.username AND Purchase.purchase_date &lt; DATEADD(DAY, -31, @startDate)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="currentDateTB" Name="startDate" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>

            <br /><br />
            <asp:Label ID="Label2" runat="server" Text="List of all items that hasn't been sold in the last 31 days" Font-Names="Poppins Light" Font-Size="20px" ForeColor="FloralWhite"></asp:Label>
            <br /><br />
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" Height="100%" Width="100%" Font-Size="16px" BackColor="LightGray"  BorderColor="#2f4c66" BorderStyle="Solid">
                <Columns>
                    <asp:BoundField DataField="itemName" HeaderText="Item Name" SortExpression="itemName" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#507ca3"/>
                    <asp:BoundField DataField="description" HeaderText="Description" SortExpression="description" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#507ca3"/>
                    <asp:BoundField DataField="price" HeaderText="Price" SortExpression="price" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#507ca3"/>
                    <asp:BoundField DataField="purchaseDate" HeaderText="Purchase Date" SortExpression="purchaseDate" ReadOnly="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#507ca3"/>
                    <asp:BoundField DataField="manufactureDate" HeaderText="Manufacture Date" SortExpression="manufactureDate" ReadOnly="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#507ca3" />
                    <asp:BoundField DataField="expiryDate" HeaderText="Expiry Date" SortExpression="expiryDate" ReadOnly="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#507ca3"/>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:StockConnection %>" SelectCommand="SELECT Item.itemName, Item.description, Item.price, FORMAT (Item.purchaseDate, 'yyyy/MM/dd') AS purchaseDate, FORMAT (Item.manufactureDate, 'yyyy/MM/dd') AS manufactureDate, FORMAT (Item.expiryDate, 'yyyy/MM/dd') AS expiryDate FROM Item, Purchase WHERE Item.itemID = Purchase.itemID AND Purchase.purchase_date &lt; DATEADD(DAY, -31,@startDate)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="currentDateTB" Name="startDate" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
        </asp:Panel>
    </div>
</asp:Content>
