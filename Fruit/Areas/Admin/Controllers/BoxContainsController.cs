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
    public class BoxContainsController : Controller
    {
        private FruitDbEntities db = new FruitDbEntities();

        // GET: Admin/BoxContains
        public ActionResult Index()
        {
            var boxContains = db.BoxContains.Include(b => b.Product);
            return View(boxContains.ToList());
        }

        // GET: Admin/BoxContains/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            BoxContain boxContain = db.BoxContains.Find(id);
            if (boxContain == null)
            {
                return HttpNotFound();
            }
            return View(boxContain);
        }

        // GET: Admin/BoxContains/Create
        public ActionResult Create()
        {
            ViewBag.ProductID = new SelectList(db.Products, "Id", "Name");
            return View();
        }

        // POST: Admin/BoxContains/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,Name,Image,Size,ProductID")] BoxContain boxContain,HttpPostedFileBase file)
        {
            if (ModelState.IsValid)
            {
                boxContain.Image = Comman.WorkWithFile.Upload("~/Uploads", file);
                db.BoxContains.Add(boxContain);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ProductID = new SelectList(db.Products, "Id", "Name", boxContain.ProductID);
            return View(boxContain);
        }

        // GET: Admin/BoxContains/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            BoxContain boxContain = db.BoxContains.Find(id);
            if (boxContain == null)
            {
                return HttpNotFound();
            }
            ViewBag.ProductID = new SelectList(db.Products, "Id", "Name", boxContain.ProductID);
            return View(boxContain);
        }

        // POST: Admin/BoxContains/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,Name,Image,Size,ProductID")] BoxContain boxContain,HttpPostedFileBase file)
        {
            if (ModelState.IsValid)
            {
                boxContain.Image = Comman.WorkWithFile.Upload("~/Uploads", file);
                db.Entry(boxContain).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ProductID = new SelectList(db.Products, "Id", "Name", boxContain.ProductID);
            return View(boxContain);
        }

       // POST: Admin/BoxContains/Delete/5
         [ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            BoxContain boxContain = db.BoxContains.Find(id);
            if (System.IO.File.Exists("~/Uploads/" + boxContain.Image))
                System.IO.File.Delete("~/Uploads/" + boxContain.Image);
            db.BoxContains.Remove(boxContain);
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
