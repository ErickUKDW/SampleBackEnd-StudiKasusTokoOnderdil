using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace SampleBackEnd.Controllers
{
    public class JenisMotorController : ApiController
    {
        // GET: api/JenisMotor
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET: api/JenisMotor/5
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/JenisMotor
        public void Post([FromBody]string value)
        {
        }

        // PUT: api/JenisMotor/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/JenisMotor/5
        public void Delete(int id)
        {
        }
    }
}
