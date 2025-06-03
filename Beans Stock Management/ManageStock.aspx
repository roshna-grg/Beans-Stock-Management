<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageStock.aspx.cs" Inherits="Beans_Stock_Management.ManageStock" %>
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
                          <p style="font-family:Lobster; font-size:55px; text-align:center; color:FloralWhite;">Manage<br />Stocks</p>
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
            <br /><br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="stockID" DataSourceID="SqlDataSource1" Height="100%" Width="100%" Font-Size="16px" BackColor="LightGray"  BorderColor="#2F4C66" BorderStyle="Solid">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" />
                    <asp:BoundField DataField="stockID" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#507ca3" HeaderText="Stock ID" ItemStyle-HorizontalAlign="Center" ReadOnly="True" SortExpression="stockID">
                    <HeaderStyle CssClass="text-center" ForeColor="#507CA3" />
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="itemID" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#507ca3" HeaderText="Item ID" ItemStyle-HorizontalAlign="Center" SortExpression="itemID">
                    <HeaderStyle CssClass="text-center" ForeColor="#507CA3" />
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="itemName" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#507ca3" HeaderText="Item Name" ItemStyle-HorizontalAlign="Center" SortExpression="itemName">
                    <HeaderStyle CssClass="text-center" ForeColor="#507CA3" />
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="description" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#507ca3" HeaderText="Description" ItemStyle-HorizontalAlign="Center" SortExpression="description">
                    <HeaderStyle CssClass="text-center" ForeColor="#507CA3" />
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="price" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#507ca3" HeaderText="Price" ItemStyle-HorizontalAlign="Center" SortExpression="price">
                    <HeaderStyle CssClass="text-center" ForeColor="#507CA3" />
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="purchaseDate" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#507ca3" HeaderText="Purchase Date" ItemStyle-HorizontalAlign="Center" ReadOnly="True" SortExpression="purchaseDate">
                    <HeaderStyle CssClass="text-center" ForeColor="#507CA3" />
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="categoryID" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#507ca3" HeaderText="Category ID" ItemStyle-HorizontalAlign="Center" SortExpression="categoryID">
                    <HeaderStyle CssClass="text-center" ForeColor="#507CA3" />
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="stockDate" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#507ca3" HeaderText="Stock Date" ItemStyle-HorizontalAlign="Center" ReadOnly="True" SortExpression="stockDate">
                    <HeaderStyle CssClass="text-center" ForeColor="#507CA3" />
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StockConnection %>" SelectCommand="SELECT StockTable.stockID, StockTable.itemID, Item.itemName, Item.description, Item.price, FORMAT (Item.purchaseDate, 'yyyy/MM/dd') AS purchaseDate, Item.categoryID, FORMAT (StockTable.stockDate, 'yyyy/MM/dd') AS stockDate FROM Item, StockTable WHERE Item.itemID = StockTable.itemID AND StockTable.stockDate &lt; DATEADD(DAY, -25, @startDate)" DeleteCommand="delete from StockTable where stockID = @stockID">
                <DeleteParameters>
                    <asp:Parameter Name="stockID" />
                </DeleteParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="currentDateTB" Name="startDate" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
        </asp:Panel>
    </div>
</asp:Content>
