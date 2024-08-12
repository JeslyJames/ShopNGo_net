<%@ Page Async="true" Title="Order Confirmation" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ConfirmPage.aspx.cs" Inherits="ShopNGo.ConfirmPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" type="text/css" href="~/Content/ConfirmPage.css" />
    
    <header class="jumbotron">
        <h1>Order Confirmation</h1>
    </header>

    <div class="confirmation-container">
        <h2>Thank you for your order!</h2>
        <p>Your order has been successfully processed. A confirmation email has been sent to your email address.</p>
        <p>If you have any questions, feel free to contact our support team.</p>

        <div class="text-center">
            <asp:Button ID="btnGoHome" runat="server" CssClass="btn btn-primary" Text="Go to Home" OnClick="btnGoHome_Click" />
        </div>
    </div>
</asp:Content>
