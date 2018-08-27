using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Fruit.Comman;
using Fruit.Models;

namespace Fruit.Areas.Admin.Controllers
{
    [Authentication]
    public class SubscribesController : Controller
    {
        private FruitDbEntities db = new FruitDbEntities();

        // GET: Admin/Subscribes
        public ActionResult Index()
        {
            return View(db.Subscribes.ToList());
        }
 
        // POST: Admin/Subscribes/Delete/5
        [ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            Subscribe subscribe = db.Subscribes.Find(id);
            db.Subscribes.Remove(subscribe);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
