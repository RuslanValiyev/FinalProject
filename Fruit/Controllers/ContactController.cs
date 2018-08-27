using Fruit.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Fruit.Controllers
{
    public class ContactController : Controller
    {
        private FruitDbEntities db = new FruitDbEntities();
        // GET: Contact
        public ActionResult Index()
        {
            return View(db.Contacts.FirstOrDefault());
        }
    }
}