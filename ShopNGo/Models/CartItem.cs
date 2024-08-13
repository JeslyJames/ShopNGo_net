using System;
using System.Diagnostics;
namespace ShopNGo
{
    public class CartItem
    {
        public int ProductId { get; set; }
        public string Name { get; set; }
        public decimal Price { get; set; }
        public int Quantity { get; set; }
        
        public decimal TotalPrice
        {
            get { return Price* Quantity;}
        }
    }
}
