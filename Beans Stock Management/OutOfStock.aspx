<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OutOfStock.aspx.cs" Inherits="Beans_Stock_Management.OutOfStock" %>
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
                <table style="border-right: 3px solid gray; width:90%; height:180px;">
                  <tr>
                      <td>
                          <p style="font-family:Lobster; font-size:55px; text-align:center; color:FloralWhite;">Out of stocks</p>
                      </td>
                  </tr>
                </table>
            </div>
        </asp:Panel>

        <asp:Panel ID="Panel2" runat="server" Width="80%" CssClass="floatRight">
            <br /><br />
            <asp:Label ID="Label1" runat="server" Text="Sorted by item name" Font-Names="Poppins Light" Font-Size="20px" ForeColor="FloralWhite"></asp:Label>
            <br /><br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Height="100%" Width="100%" Font-Size="16px" BackColor="LightGray"  BorderColor="#2f4c66" BorderStyle="Solid">
                <Columns>
                    <asp:BoundField DataField="itemID" HeaderText="Item ID" SortExpression="itemID" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#507ca3"/>
                    <asp:BoundField DataField="itemName" HeaderText="Item Name" SortExpression="itemName" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#507ca3"/>
                    <asp:BoundField DataField="description" HeaderText="Description" SortExpression="description" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#507ca3"/>
                    <asp:BoundField DataField="price" HeaderText="Price" SortExpression="price" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#507ca3"/>
                    <asp:BoundField DataField="purchaseDate" HeaderText="Purchase Date" SortExpression="purchaseDate" ReadOnly="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#507ca3"/>
                    <asp:BoundField DataField="quantity" HeaderText="Quantity" SortExpression="quantity" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#507ca3"/>
                    <asp:BoundField DataField="stockDate" HeaderText="Stock Date" SortExpression="stockDate" ReadOnly="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#507ca3"/>
                </Columns>
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StockConnection %>" SelectCommand="SELECT StockTable.itemID, Item.itemName, Item.description, Item.price, FORMAT (Item.purchaseDate, 'yyyy/MM/dd') AS purchaseDate, StockTable.quantity, FORMAT (StockTable.stockDate, 'yyyy/MM/dd') AS stockDate FROM Item, StockTable WHERE Item.itemID = StockTable.itemID AND StockTable.quantity &lt;10 ORDER BY Item.itemName ASC"></asp:SqlDataSource>

            <br />
            <asp:Label ID="Label2" runat="server" Text="Sorted by item stock quantity" Font-Names="Poppins Light" Font-Size="20px" ForeColor="FloralWhite"></asp:Label>
            <br /><br />
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" Height="100%" Width="100%" Font-Size="16px" BackColor="LightGray"  BorderColor="#2f4c66" BorderStyle="Solid">
                <Columns>
                    <asp:BoundField DataField="itemID" HeaderText="Item ID" SortExpression="itemID" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#507ca3"/>
                    <asp:BoundField DataField="itemName" HeaderText="Item Name" SortExpression="itemName" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#507ca3" />
                    <asp:BoundField DataField="description" HeaderText="Description" SortExpression="description" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#507ca3" />
                    <asp:BoundField DataField="price" HeaderText="Price" SortExpression="price" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#507ca3"/>
                    <asp:BoundField DataField="purchaseDate" HeaderText="Purchase Date" SortExpression="purchaseDate" ReadOnly="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#507ca3"/>
                    <asp:BoundField DataField="quantity" HeaderText="Quantity" SortExpression="quantity" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#507ca3" />
                    <asp:BoundField DataField="stockDate" HeaderText="Stock Date" SortExpression="stockDate" ReadOnly="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#507ca3"/>
                </Columns>
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:StockConnection %>" SelectCommand="SELECT StockTable.itemID, Item.itemName, Item.description, Item.price, FORMAT (Item.purchaseDate, 'yyyy/MM/dd') AS purchaseDate, StockTable.quantity, FORMAT (StockTable.stockDate, 'yyyy/MM/dd') AS stockDate FROM Item, StockTable WHERE Item.itemID = StockTable.itemID AND StockTable.quantity &lt;10 ORDER BY StockTable.quantity DESC"></asp:SqlDataSource>

            <br />
            <asp:Label ID="Label3" runat="server" Text="Sorted by item stocked date" Font-Names="Poppins Light" Font-Size="20px" ForeColor="FloralWhite"></asp:Label>
            <br /><br />
            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" Height="100%" Width="100%" Font-Size="16px" BackColor="LightGray"  BorderColor="#2f4c66" BorderStyle="Solid">
                <Columns>
                    <asp:BoundField DataField="itemID" HeaderText="Item ID" SortExpression="itemID" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#507ca3" />
                    <asp:BoundField DataField="itemName" HeaderText="Item Name" SortExpression="itemName" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#507ca3" />
                    <asp:BoundField DataField="description" HeaderText="Description" SortExpression="description" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#507ca3"/>
                    <asp:BoundField DataField="price" HeaderText="Price" SortExpression="price" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#507ca3" />
                    <asp:BoundField DataField="purchaseDate" HeaderText="Purchase Date" SortExpression="purchaseDate" ReadOnly="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#507ca3" />
                    <asp:BoundField DataField="quantity" HeaderText="Quantity" SortExpression="quantity" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#507ca3" />
                    <asp:BoundField DataField="stockDate" HeaderText="Stock Date" SortExpression="stockDate" ReadOnly="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#507ca3"/>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:StockConnection %>" SelectCommand="SELECT StockTable.itemID, Item.itemName, Item.description, Item.price, FORMAT (Item.purchaseDate, 'yyyy/MM/dd') AS purchaseDate, StockTable.quantity, FORMAT (StockTable.stockDate, 'yyyy/MM/dd') AS stockDate FROM Item, StockTable WHERE Item.itemID = StockTable.itemID AND StockTable.quantity &lt;10 ORDER BY StockTable.stockDate ASC"></asp:SqlDataSource>
        </asp:Panel>
    </div>
</asp:Content>
