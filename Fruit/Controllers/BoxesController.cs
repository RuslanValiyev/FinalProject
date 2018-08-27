using Fruit.Models;
using Fruit.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Fruit.Controllers
{
    public class BoxesController : Controller
    {
        // GET: Boxes
        private FruitDbEntities db = new FruitDbEntities();

        public ActionResult Index(int? Id)
        {
            ShopModel model = new ShopModel();
            model.Products = db.Products.Include("Category").Where(m => Id == null || m.CategoryId == Id).Where(n => n.BoxOrNot == true).ToList();
            model.Categories = db.Categories.ToList();
            return View(model);
        }

        public ActionResult Detail(int id)
        {
            Product prod = db.Products.Find(id);
            ViewBag.related = db.Products.Include("BoxContains").Where(m => m.CategoryId == prod.CategoryId && m.Id != prod.Id && m.BoxOrNot == true).ToList();
            return View(prod);
        }
    }
}