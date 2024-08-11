using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShopNGo.Models
{
    public class CartItemDisplayModel
    {
        public int ProductId { get; set; }
        public string ProductName { get; set; }
        public int Quantity { get; set; }
        public decimal TotalPrice { get; set; }
    }
}
