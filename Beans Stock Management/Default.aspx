<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Beans_Stock_Management._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
        body{
            background-color:#111f28;
        }
    </style>
    <div class="jumbotron" style="background-color:lightslategray;">
        <h1 style="font-family:Arial; font-weight:bold">Beans Stock Management System</h1>
        <p class="lead">This system is used to manage the detail of items, the customer’s details and keep records of selling items to the customers</p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2 style="font-family:Poppins; font-weight:bold; color:#688ea6;">Items</h2>
            <p style="font:lighter 15px Poppins; color:floralwhite;">
                To add items in the system ->>
            </p>
            <p>
                <asp:Button ID="itemBtn" runat="server" Text="Explore &raquo;" class="btn btn-default" OnClick="itemBtn_Click"/>
            </p>
        </div>
        <div class="col-md-4">
            <h2 style="font-family:Poppins; font-weight:bold; color:#688ea6;">Category</h2>
            <p style="font:lighter 15px Poppins;color:floralwhite;">
                To add category in the system ->>
            </p>
            <p>
                <asp:Button ID="categoryBtn" runat="server" Text="Explore &raquo;" class="btn btn-default" OnClick="categoryBtn_Click"/>
            </p>
        </div>
        <div class="col-md-4">
            <h2 style="font-family:Poppins; font-weight:bold; color:#688ea6;">Customer</h2>
            <p style="font:lighter 15px Poppins;color:floralwhite;">
                To add customer details in the syste ->>
            </p>
            <p>
                <asp:Button ID="custBtn" runat="server" Text="Explore &raquo;" class="btn btn-default" OnClick="custBtn_Click"/>
            </p>
        </div>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StockConnection %>" SelectCommand="SELECT itemID, quantity FROM StockTable WHERE quantity &lt; 10"></asp:SqlDataSource>
</asp:Content>
