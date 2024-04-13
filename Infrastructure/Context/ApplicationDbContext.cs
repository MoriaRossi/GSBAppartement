using Microsoft.EntityFrameworkCore;
using GSBAppartement.Domain.Appartement;
using GSBAppartement.Domain.Personnes;
namespace GSBAppartement.Infrastructure.Context
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }


        public DbSet<Appartement> Appartement { get; set; }
        public DbSet<Personne> Personne { get; set; }
        public DbSet<Proprietaire> Proprietaire { get; set; }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            foreach (var entityType in modelBuilder.Model.GetEntityTypes())
            {
                entityType.SetTableName(entityType.ClrType.Name.ToLower());
            }
        }
    }
}
