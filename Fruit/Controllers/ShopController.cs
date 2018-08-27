using Fruit.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Fruit.ViewModel;
namespace Fruit.Controllers
{
    public class ShopController : Controller
    {
        private FruitDbEntities db = new FruitDbEntities();
        // GET: Shop
        public ActionResult Index(int? Id)
        {
            ShopModel model = new ShopModel();
            model.Products = db.Products.Include("Category").Where(m=>Id==null || m.CategoryId==Id).Where(n=>n.BoxOrNot==false).ToList();
            model.Categories = db.Categories.ToList();
            return View(model);
        }

        public ActionResult Detail(int id)
        {
            Product prod = db.Products.Find(id);
            ViewBag.related = db.Products.Where(m => m.CategoryId == prod.CategoryId && m.Id!=prod.Id && m.BoxOrNot==false).ToList();
            return View(prod);
        }

    }
}