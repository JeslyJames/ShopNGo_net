<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="ShopNGo.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Welcome to ShopNGo</h2>
    <p>Discover our range of fresh products and stay updated with the latest news.</p>
    
    <!-- Categories Section -->
    <h3>Categories</h3>
    <div class="categories">
        <asp:Repeater ID="RepeaterCategories" runat="server" DataSourceID="SqlDataSourceCategories">
            <ItemTemplate>
                <div class="category-card product-card">
                    <img src='<%# ResolveUrl(Eval("image_url").ToString()) %>' alt='<%# Eval("category_name") %>' class="category-image product-image" />
                    <h4 class="category-name product-name"><%# Eval("category_name") %></h4>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    
    <asp:SqlDataSource ID="SqlDataSourceCategories" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ShopNGoConnectionString %>" 
        SelectCommand="SELECT category_name, image_url FROM Categories"></asp:SqlDataSource>

    <!-- Deals Section -->
    <h3>Fresh Deals</h3>
    <div class="deals">
        <asp:Repeater ID="RepeaterDeals" runat="server" DataSourceID="SqlDataSourceDeals">
            <ItemTemplate>
                <div class="deal-card product-card">
                    <div class="discount-label">
                        <%# Eval("discount") %> off
                    </div>
                    <img src='<%# ResolveUrl(Eval("image_url").ToString()) %>' alt='<%# Eval("name") %>' class="deal-image product-image" />
                    <h4 class="deal-name product-name"><%# Eval("name") %></h4>
                    <p class="deal-description product-description"><%# Eval("description") %></p>
                    <div class="deal-prices product-prices">
                        <span class="original-price"><%# Eval("original_price", "{0:C}") %></span>
                        <span class="sale-price"><%# Eval("sale_price", "{0:C}") %></span>
                    </div>
                    <asp:Button ID="btnAddToCart" runat="server" Text="ADD" CssClass="add-to-cart-button" CommandName="AddToCart" CommandArgument='<%# Eval("product_id") %>' />
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    
    <asp:SqlDataSource ID="SqlDataSourceDeals" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ShopNGoConnectionString %>" 
        SelectCommand="SELECT product_id, name, description, original_price, sale_price, image_url, 
                       CAST((original_price - sale_price) / original_price * 100 AS INT) AS discount 
                       FROM Products WHERE sale_price IS NOT NULL"></asp:SqlDataSource>

    <!-- News Section -->
    <h3>News</h3>
    <div class="news">
        <asp:Repeater ID="RepeaterNews" runat="server" DataSourceID="SqlDataSourceNews">
            <ItemTemplate>
                <div class="news-card">
                    <h4 class="news-title"><%# Eval("title") %></h4>
                    <p class="news-content"><%# Eval("content") %></p>
                    <p class="news-date"><%# Eval("date", "{0:MMMM dd, yyyy}") %></p>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    
    <asp:SqlDataSource ID="SqlDataSourceNews" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ShopNGoConnectionString %>" 
        SelectCommand="SELECT title, content, date FROM News ORDER BY date DESC"></asp:SqlDataSource>
</asp:Content>
