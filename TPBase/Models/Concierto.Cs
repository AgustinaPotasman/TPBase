

namespace TP11_ProyectoFinal.Models
{
    public class Concierto
    {
        public int IdConcierto { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public DateTime FechaConcierto { get; set; }
        public string Imagen { get; set; }
        public int Precio { get; set; }
        public int FkCategoria { get; set; }

        public Concierto(int idConcierto, string nombre, string descripcion, DateTime fechaConcierto, string imagen, int precio, int fkCategoria)
        {
            IdConcierto = idConcierto;
            Nombre = nombre;
            Descripcion = descripcion;
            FechaConcierto = fechaConcierto;
            Imagen = imagen;
            Precio = precio;
            FkCategoria = fkCategoria;
        }

        public Concierto() { }
    }
}