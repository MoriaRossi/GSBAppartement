using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using GSBAppartement.Domain.Personnes;
using GSBAppartement.Repository.Interfaces;
using Microsoft.EntityFrameworkCore;
using GSBAppartement.Infrastructure.Context;

namespace GSBAppartement.Repository.Implementations
{
    public class ProprietaireRepository : IProprietaireRepository, IDisposable
    {
        private readonly ApplicationDbContext _context;
        private bool _disposed = false;

        public ProprietaireRepository(ApplicationDbContext context)
        {
            _context = context;
        }






        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        protected virtual void Dispose(bool disposing)
        {
            if (!_disposed)
            {
                if (disposing)
                {
                    // Dispose managed resources
                    _context?.Dispose();
                }

                // Dispose unmanaged resources
                // ... (if any)

                _disposed = true;
            }
        }

    }
}
