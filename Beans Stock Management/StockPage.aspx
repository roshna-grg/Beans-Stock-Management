<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StockPage.aspx.cs" Inherits="Beans_Stock_Management.StockPage" %>
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
                          <p style="font-family:Lobster; font-size:55px; text-align:center; color:FloralWhite;">Stock</p>
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
                        <asp:Label ID="categoryL" runat="server" Text="Category name" Font-Names="Poppins Light" Font-Size="20px" ForeColor="FloralWhite"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="categoryNameDDL" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="categoryName" DataValueField="categoryID" Font-Names="Poppins Light" Font-Size="18px"></asp:DropDownList>

                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:StockConnection %>" SelectCommand="SELECT [categoryID], [categoryName] FROM [Category]"></asp:SqlDataSource>
                    </td>
                </tr>
            </table>
            <br /><br />
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource4" Height="100%" Width="100%" Font-Size="16px" BackColor="LightGray"  BorderColor="#2f4c66" BorderStyle="Solid">
                <Columns>
                    <asp:BoundField DataField="itemName" HeaderText="itemName" SortExpression="itemName" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#507ca3"/>
                    <asp:BoundField DataField="description" HeaderText="description" SortExpression="description" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#507ca3"/>
                    <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#507ca3"/>
                    <asp:BoundField DataField="purchaseDate" HeaderText="purchaseDate" SortExpression="purchaseDate" ReadOnly="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#507ca3"/>
                    <asp:BoundField DataField="manufactureDate" HeaderText="manufactureDate" SortExpression="manufactureDate" ReadOnly="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#507ca3"/>
                    <asp:BoundField DataField="expiryDate" HeaderText="expiryDate" SortExpression="expiryDate" ReadOnly="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#507ca3"/>
                    <asp:BoundField DataField="quantity" HeaderText="quantity" SortExpression="quantity" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#507ca3"/>
                    <asp:BoundField DataField="stockDate" HeaderText="stockDate" SortExpression="stockDate" ReadOnly="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#507ca3"/>
                </Columns>
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:StockConnection %>" SelectCommand="SELECT Item.itemName, Item.description, Item.price, FORMAT (Item.purchaseDate, 'yyyy/MM/dd') AS purchaseDate, FORMAT (Item.manufactureDate, 'yyyy/MM/dd') AS manufactureDate, FORMAT (Item.expiryDate, 'yyyy/MM/dd') AS expiryDate, StockTable.quantity, FORMAT (StockTable.stockDate, 'yyyy/MM/dd') AS stockDate FROM Category, StockTable, Item WHERE Category.categoryID = Item.categoryID AND Item.itemID = StockTable.itemID AND Category.categoryID = @categoryID">
                <SelectParameters>
                    <asp:ControlParameter ControlID="categoryNameDDL" Name="categoryID" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>

            <br /><br />
            <table>
                <tr style="height:50px">
                    <td style="width:50%">
                        <asp:Label ID="itemNameL" runat="server" Text="Item Name" Font-Names="Poppins Light" Font-Size="20px" ForeColor="FloralWhite"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="itemNameDDL" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="itemName" DataValueField="itemID" Font-Names="Poppins Light" Font-Size="18px"></asp:DropDownList>

                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StockConnection %>" SelectCommand="SELECT [itemID], [itemName] FROM [Item]"></asp:SqlDataSource>
                    </td>
                </tr>
            </table>
            <br /><br />
            <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource2" AutoGenerateColumns="False" Height="100%" Width="100%" Font-Size="16px" BackColor="LightGray"  BorderColor="#2f4c66" BorderStyle="Solid">
                <Columns>
                    <asp:BoundField DataField="itemName" HeaderText="itemName" SortExpression="itemName" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#507ca3"/>
                    <asp:BoundField DataField="description" HeaderText="description" SortExpression="description" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#507ca3"/>
                    <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#507ca3"/>
                    <asp:BoundField DataField="purchaseDate" HeaderText="purchaseDate" SortExpression="purchaseDate" ReadOnly="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#507ca3"/>
                    <asp:BoundField DataField="manufactureDate" HeaderText="manufactureDate" SortExpression="manufactureDate" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#507ca3"/>
                    <asp:BoundField DataField="expiryDate" HeaderText="expiryDate" SortExpression="expiryDate" ReadOnly="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#507ca3"/>
                    <asp:BoundField DataField="quantity" HeaderText="quantity" SortExpression="quantity" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#507ca3"/>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:StockConnection %>" SelectCommand="SELECT Item.itemName, Item.description, Item.price, FORMAT (Item.purchaseDate, 'yyyy/MM/dd') AS purchaseDate, Item.manufactureDate, FORMAT (Item.expiryDate, 'yyyy/MM/dd') AS expiryDate, StockTable.quantity FROM Item, StockTable WHERE Item.itemID = StockTable.itemID AND StockTable.itemID = @itemID">
                <SelectParameters>
                    <asp:ControlParameter ControlID="itemNameDDL" Name="itemID" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </asp:Panel>
    </div>
</asp:Content>
