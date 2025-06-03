<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Beans_Stock_Management.Profile" %>
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
                            <p style="font-family:Lobster; font-size:55px; text-align:center; color:FloralWhite;">Profile</p>
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
                        <asp:Label ID="usernameL" runat="server" Text="Username" Font-Names="Poppins Light" Font-Size="20px" ForeColor="FloralWhite"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="usernameTB" runat="server" Font-Names="Poppins Light" Font-Size="18px"></asp:TextBox>
                    </td>
                </tr>
                <tr style="height:50px">
                    <td>
                        <asp:Label ID="passwordL" runat="server" Text="Password" Font-Names="Poppins Light" Font-Size="20px" ForeColor="FloralWhite"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="passwordTB" runat="server" Font-Names="Poppins Light" Font-Size="18px" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr style="height:50px">
                    <td>
                        <asp:Label ID="newPassL" runat="server" Text="New Password" Font-Names="Poppins Light" Font-Size="20px" ForeColor="FloralWhite"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="newPassTB" runat="server" Font-Names="Poppins Light" Font-Size="18px" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <br /><br />
            <asp:Button ID="updateBtn" runat="server" Text="Update" OnClick="updateBtn_Click" Font-Size="18px" Height="38px" Width="96px"/>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StockConnection %>" SelectCommand="SELECT username, password FROM UserTable WHERE username = @username AND password = @password">
                <SelectParameters>
                    <asp:ControlParameter ControlID="usernameTB" Name="username" PropertyName="Text" />
                    <asp:ControlParameter ControlID="passwordTB" Name="password" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:StockConnection %>" DeleteCommand="DELETE FROM [UserTable] WHERE [username] = @username" InsertCommand="INSERT INTO [UserTable] ([username], [password]) VALUES (@username, @password)" SelectCommand="SELECT [username], [password] FROM [UserTable]" UpdateCommand="UPDATE [UserTable] SET [password] = @password WHERE [username] = @username">
                <DeleteParameters>
                    <asp:Parameter Name="username" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="username" Type="String" />
                    <asp:Parameter Name="password" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="password" Type="String" />
                    <asp:Parameter Name="username" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </asp:Panel>
    </div>
</asp:Content>
