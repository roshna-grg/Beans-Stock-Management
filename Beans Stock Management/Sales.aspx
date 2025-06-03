<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Sales.aspx.cs" Inherits="Beans_Stock_Management.Sales" %>
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
                          <p style="font-family:Lobster; font-size:55px; text-align:center; color:FloralWhite;">Sales</p>
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
                        <asp:Label ID="itemCodeL" runat="server" Text="Item Code" Font-Names="Poppins Light" Font-Size="20px" ForeColor="FloralWhite"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="itemCodeDDL" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="itemID" DataValueField="itemID" Font-Names="Poppins Light" Font-Size="18px" Width="193px"></asp:DropDownList>

                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StockConnection %>" SelectCommand="SELECT [itemID] FROM [Item]"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr style="height:50px">
                    <td>
                        <asp:Label ID="quantityL" runat="server" Text="Quantity" Font-Names="Poppins Light" Font-Size="20px" ForeColor="FloralWhite"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="quantityTB" runat="server" TextMode="Number" AutoPostBack="true" Font-Names="Poppins Light" Font-Size="18px"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <br /><br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" Height="100%" Width="100%" Font-Size="16px" BackColor="LightGray"  BorderColor="#2f4c66" BorderStyle="Solid">
                <Columns>
                    <asp:BoundField DataField="itemName" HeaderText="Item Name" SortExpression="itemName" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#507ca3"/>
                    <asp:BoundField DataField="description" HeaderText="Description" SortExpression="description" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#507ca3"/>
                    <asp:BoundField DataField="categoryName" HeaderText="Category Name" SortExpression="categoryName" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#507ca3"/>
                    <asp:BoundField DataField="purchaseDate" HeaderText="Purchase Date" SortExpression="purchaseDate" ReadOnly="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#507ca3"/>
                    <asp:BoundField DataField="manufactureDate" HeaderText="Manufacture Date" SortExpression="manufactureDate" ReadOnly="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#507ca3"/>
                    <asp:BoundField DataField="expiryDate" HeaderText="Expiry Date" SortExpression="expiryDate" ReadOnly="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#507ca3"/>
                    <asp:BoundField DataField="price" HeaderText="Price" SortExpression="price" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#507ca3"/>
                    <asp:BoundField DataField="totalPrice" HeaderText="Total Price" ReadOnly="True" SortExpression="totalPrice" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#507ca3"/>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:StockConnection %>" SelectCommand="SELECT Item.itemName, Item.description, Category.categoryName, FORMAT (Item.purchaseDate, 'yyyy/MM/dd') AS purchaseDate, FORMAT (Item.manufactureDate, 'yyyy/MM/dd') AS manufactureDate, FORMAT (Item.expiryDate, 'yyyy/MM/dd') AS expiryDate, Item.price, Item.price * @quantity AS totalPrice FROM Category, Item WHERE Category.categoryID = Item.categoryID AND ITEM.itemID = @itemID">
                <SelectParameters>
                    <asp:ControlParameter ControlID="quantityTB" DefaultValue="1" Name="quantity" PropertyName="Text" />
                    <asp:ControlParameter ControlID="itemCodeDDL" Name="itemID" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </asp:Panel>
    </div>
</asp:Content>
