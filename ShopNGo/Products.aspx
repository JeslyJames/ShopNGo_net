<%@ Page Title="Products" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="ShopNGo.Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Our Products</h2>

    <!-- Fruits Section -->
    <h3>Fruits</h3>
    <div class="products">
        <asp:Repeater ID="RepeaterFruits" runat="server" DataSourceID="SqlDataSourceFruits">
            <ItemTemplate>
                <div class="product-card">
                    <img src='<%# ResolveUrl(Eval("image_url").ToString()) %>' alt='<%# Eval("name") %>' class="product-image" />
                    <h4 class="product-name"><%# Eval("name") %></h4>
                    <p class="product-description"><%# Eval("description") %></p>
                    <div class="product-prices">
                        <span class="original-price"><%# Eval("original_price", "{0:C}") %></span>
                        <span class="sale-price"><%# Eval("sale_price", "{0:C}") %></span>
                    </div>
                    <asp:Button ID="btnAddToCart" runat="server" Text="ADD" CssClass="add-to-cart-button" CommandName="AddToCart" CommandArgument='<%# Eval("product_id") %>' />
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>

    <!-- Vegetables Section -->
    <h3>Vegetables</h3>
    <div class="products">
        <asp:Repeater ID="RepeaterVegetables" runat="server" DataSourceID="SqlDataSourceVegetables">
            <ItemTemplate>
                <div class="product-card">
                    <img src='<%# ResolveUrl(Eval("image_url").ToString()) %>' alt='<%# Eval("name") %>' class="product-image" />
                    <h4 class="product-name"><%# Eval("name") %></h4>
                    <p class="product-description"><%# Eval("description") %></p>
                    <div class="product-prices">
                        <span class="original-price"><%# Eval("original_price", "{0:C}") %></span>
                        <span class="sale-price"><%# Eval("sale_price", "{0:C}") %></span>
                    </div>
                    <asp:Button ID="btnAddToCart" runat="server" Text="ADD" CssClass="add-to-cart-button" CommandName="AddToCart" CommandArgument='<%# Eval("product_id") %>' />
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>

    <!-- Dairy Section -->
    <h3>Dairy</h3>
    <div class="products">
        <asp:Repeater ID="RepeaterDairy" runat="server" DataSourceID="SqlDataSourceDairy">
            <ItemTemplate>
                <div class="product-card">
                    <img src='<%# ResolveUrl(Eval("image_url").ToString()) %>' alt='<%# Eval("name") %>' class="product-image" />
                    <h4 class="product-name"><%# Eval("name") %></h4>
                    <p class="product-description"><%# Eval("description") %></p>
                    <div class="product-prices">
                        <span class="original-price"><%# Eval("original_price", "{0:C}") %></span>
                        <span class="sale-price"><%# Eval("sale_price", "{0:C}") %></span>
                    </div>
                    <asp:Button ID="btnAddToCart" runat="server" Text="ADD" CssClass="add-to-cart-button" CommandName="AddToCart" CommandArgument='<%# Eval("product_id") %>' />
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>

    <!-- Meat Section -->
    <h3>Meat</h3>
    <div class="products">
        <asp:Repeater ID="RepeaterMeat" runat="server" DataSourceID="SqlDataSourceMeat">
            <ItemTemplate>
                <div class="product-card">
                    <img src='<%# ResolveUrl(Eval("image_url").ToString()) %>' alt='<%# Eval("name") %>' class="product-image" />
                    <h4 class="product-name"><%# Eval("name") %></h4>
                    <p class="product-description"><%# Eval("description") %></p>
                    <div class="product-prices">
                        <span class="original-price"><%# Eval("original_price", "{0:C}") %></span>
                        <span class="sale-price"><%# Eval("sale_price", "{0:C}") %></span>
                    </div>
                    <asp:Button ID="btnAddToCart" runat="server" Text="ADD" CssClass="add-to-cart-button" CommandName="AddToCart" CommandArgument='<%# Eval("product_id") %>' />
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>

    <!-- SQL DataSources for each section -->
    <asp:SqlDataSource ID="SqlDataSourceFruits" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ShopNGoConnectionString %>" 
        SelectCommand="SELECT product_id, name, description, original_price, sale_price, image_url, stock_quantity, price FROM Products WHERE category_id = 1"></asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSourceVegetables" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ShopNGoConnectionString %>" 
        SelectCommand="SELECT product_id, name, description, original_price, sale_price, image_url, stock_quantity, price FROM Products WHERE category_id = 2"></asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSourceDairy" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ShopNGoConnectionString %>" 
        SelectCommand="SELECT product_id, name, description, original_price, sale_price, image_url, stock_quantity, price FROM Products WHERE category_id = 3"></asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSourceMeat" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ShopNGoConnectionString %>" 
        SelectCommand="SELECT product_id, name, description, original_price, sale_price, image_url, stock_quantity, price FROM Products WHERE category_id = 5"></asp:SqlDataSource>
</asp:Content>
