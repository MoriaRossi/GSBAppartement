using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using GSBAppartement.Domain.Personnes;
using GSBAppartement.Repository.Interfaces;


namespace GSBAppartement.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class ProprietaireController : ControllerBase
    {
        private readonly IProprietaireRepository _proprietaireRepository;

        public ProprietaireController(IProprietaireRepository proprietaireRepository)
        {
            _proprietaireRepository = proprietaireRepository;
        }




    }
}
