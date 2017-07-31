using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Handing.Controllers
{
    public class ProductController : Controller
    {
        public ActionResult StiffnessTest()
        {
            return View();
        }
        // 刚度
        // GET: /Product/Stiffness
        public ActionResult Stiffness()
        {
            string userName = Request["username"];
            string password = Request["password"]; 
            return View();
        }

        // 强度
        // GET: /Product/Strength
        public ActionResult Strength()
        {
            return View();
        }

        // 稳定性
        // GET: /Product/Stability
        public ActionResult Stability()
        {
            return View();
        }

        // 疲劳强度
        // GET: /Product/Fatigue
        public ActionResult Fatigue()
        {
            return View();
        }

        // 卷筒
        // GET: /Product/Drum
        public ActionResult Drum()
        {
            return View();
        }
        // 卷筒
        // GET: /Product/Drum
        public ActionResult Bearing()
        {
            return View();
        }
        // 端梁
        // GET: /Product/Endbeam
        public ActionResult Endbeam()
        {
            return View();
        }
        // 主梁
        // GET: /Product/Girder
        public ActionResult Girder()
        {
            return View();
        }
        // 起升
        // GET: /Product/Lifting
        public ActionResult Lifting()
        {
            return View();
        }
        // 葫芦
        // GET: /Product/Hoisting
        public ActionResult Hoisting()
        {
            return View();
        }
        // 汉鼎报价软件
        // GET: /Product/HDQuotation
        public ActionResult HDQuotation()
        {
            return View();
        }
        // 汉鼎生产辅助软件
        // GET: /Product/HDProduce
        public ActionResult HDProduce()
        {
            return View();
        }
         // 汉鼎自由开发
        // GET: /Product/FreeDevelopment
        public ActionResult FreeDevelopment()
        {
            return View();
        }        
        //产品设计
        //桥式起重机
        public ActionResult Bridge()
        {
            return View();
        }
        //产品设计
        //门式起重机自主设计
        public ActionResult Gantry()
        {
            return View();
        }
        //产品设计
        //桥式起重机自主设计
        public ActionResult BridgeAutoDesign()
        {
            return View();
        }      
        
        //
        // POST: /Product/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Product/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /Product/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Product/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /Product/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
