using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GSBAppartement.Domain.Personnes
{
    public abstract class Personne
    {
        public Guid Id { get; set; }
        public string Prenom { get; set; }
        public string Nom { get; set; }
        public string Adresse { get; set; }
        public string Ville { get; set; }
        public int CodePostal { get; set; }
        public int Tel { get; set; }
    }
}
