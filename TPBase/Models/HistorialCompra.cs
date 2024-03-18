using System;

namespace TPBase.Models
{
    public class HistorialCompra
    {
        public int Id { get; set; }
        public int IdUsuario { get; set; }
        public string IdConcierto { get; set; }
        public DateTime FechaCompra { get; set; }
        public int Cantidad { get; set; }
        public decimal PrecioTotal { get; set; }
    }
}
