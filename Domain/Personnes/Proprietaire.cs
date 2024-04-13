using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace GSBAppartement.Domain.Personnes
{
    public class Proprietaire : Personne
    {
        new public Guid Id { get; set; }
        public Personne Personne { get; set; }
    }



}
