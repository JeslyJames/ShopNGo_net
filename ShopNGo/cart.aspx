<%@ Page Async="true" Title="Your Shopping Cart" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="ShopNGo.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="cart-container">
        <h2>Your Shopping Cart</h2>
        
        <!-- Repeater for Cart Items -->
        <asp:Repeater ID="RepeaterCart" runat="server" OnItemCommand="RepeaterCart_ItemCommand">
            <ItemTemplate>
                <div class="cart-item">
                    <h4 class="cart-item-name"><%# Eval("Name") %></h4>
                    <p class="cart-item-price"><%# Eval("TotalPrice", "{0:C}") %></p>
                    <div class="cart-item-quantity">
                        Quantity: 
                        <asp:TextBox ID="txtQuantity" runat="server" Text='<%# Eval("Quantity") %>' CssClass="quantity-input" Type="Number" min="1" max="20" step="1" />
                        <asp:Button ID="btnUpdate" runat="server" Text="Update" CommandName="UpdateQuantity" CommandArgument='<%# Eval("ProductId") %>' CssClass="btn btn-warning" />
                        <asp:Button ID="btnRemove" runat="server" Text="Remove" CommandName="RemoveFromCart" CommandArgument='<%# Eval("ProductId") %>' CssClass="btn btn-danger" />
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        
        <!-- Total Price Display -->
        <div class="cart-total">
            <asp:Label ID="lblTotalPrice" runat="server" CssClass="total-price" />
        </div>

        <!-- Cart Actions -->
        <div class="cart-actions">
            <asp:Button ID="btnEmpty" runat="server" Text="Empty Cart" OnClick="btnEmpty_Click" CssClass="btn btn-warning" />
            <asp:Button ID="btnCheckOut" runat="server" PostBackUrl="~/Checkout.aspx" Text="Check Out" CssClass="btn btn-success" />
            <asp:Button ID="btnContinue" runat="server" PostBackUrl="~/Products.aspx" Text="Continue Shopping" CssClass="btn btn-primary" />
        </div>

        <!-- Message Label -->
        <asp:Label ID="lblMessage" runat="server" CssClass="text-info"></asp:Label>
    </div>
</asp:Content>
