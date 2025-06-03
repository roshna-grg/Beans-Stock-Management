<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="Beans_Stock_Management.Category" %>
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

    <div style="height:280px">
        <asp:Panel ID="Panel1" runat="server" Width="40%" CssClass="floatLeft">
            <div style="margin-top:30px">
                <table style="border-right: 3px solid gray; width:80%; height:180px;">
                    <tr>
                        <td>
                            <p style="font-family:Lobster; font-size:55px; text-align:center; color:FloralWhite;">Category</p>
                        </td>
                    </tr>
                </table>
            </div>
        </asp:Panel>
        <asp:Panel ID="Panel2" runat="server" Width="60%" CssClass="floatRight">
            <br />
            <table>
                <tr style="height:50px">
                    <td style="width:55%">
                        <asp:Label ID="categoryIDL" runat="server" Text="Category ID" Font-Names="Poppins Light" Font-Size="20px" ForeColor="FloralWhite"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="categoryIDTB" runat="server" TextMode="Number" Font-Names="Poppins Light" Font-Size="18px"></asp:TextBox>
                    </td>
                </tr>
                <tr style="height:50px">
                    <td>
                        <asp:Label ID="ctgName" runat="server" Text="Category Name" Font-Names="Poppins Light" Font-Size="20px" ForeColor="FloralWhite"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="ctgNameTB" runat="server" Font-Names="Poppins Light" Font-Size="18px"></asp:TextBox>
                    </td>
                </tr>
                <tr style="height:50px">
                    <td>
                        <asp:Label ID="ctgDesc" runat="server" Text="Description" Font-Names="Poppins Light" Font-Size="20px" ForeColor="FloralWhite"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="ctgDescTB" runat="server" TextMode="MultiLine" Font-Names="Poppins Light" Font-Size="18px"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <br /><br />
            <asp:Button ID="ctgAdd" runat="server" Text="Add" OnClick="ctgAdd_Click" Font-Size="18px" Height="38px" Width="96px"/>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StockConnection %>" DeleteCommand="DELETE FROM [Category] WHERE [categoryID] = @categoryID" InsertCommand="INSERT INTO [Category] ([categoryID], [categoryName], [description]) VALUES (@categoryID, @categoryName, @description)" SelectCommand="SELECT * FROM [Category]" UpdateCommand="UPDATE [Category] SET [categoryName] = @categoryName, [description] = @description WHERE [categoryID] = @categoryID">
                <DeleteParameters>
                    <asp:Parameter Name="categoryID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="categoryID" Type="Int32" />
                    <asp:Parameter Name="categoryName" Type="String" />            
                   <asp:Parameter Name="description" Type="String" />            
                </InsertParameters>
                <UpdateParameters>
                   <asp:Parameter Name="categoryName" Type="String" />
                   <asp:Parameter Name="description" Type="String" />
                   <asp:Parameter Name="categoryID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </asp:Panel>
    </div>
</asp:Content>
