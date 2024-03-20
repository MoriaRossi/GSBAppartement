using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

namespace GSBAppartement.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class PersonneController
    {

        [HttpGet("")]
        public async void GetPersonne()
        {

        }
    }
}
