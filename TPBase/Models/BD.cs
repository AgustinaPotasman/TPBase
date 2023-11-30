using Dapper;
using System.Data.SqlClient;

namespace TPBase.Models

{
    public class BD
    {
        private static string _connectionString = @"Server=localhost;DataBase=WorldConcerts;Trusted_Connection=True;";
      
        private static List<Concierto> listaConciertos = new List<Concierto>();
        private static List<Categoria> listaCategorias = new List<Categoria>();

        public static List<Concierto> TraerConciertos()
        {
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string sql = "SELECT * from Conciertos";
                listaConciertos = db.Query<Concierto>(sql).ToList();
            }
            return listaConciertos;
        }
        public static List<Categoria> TraerCategorias()
        {
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string sql = "SELECT * from Categorias";
                listaCategorias = db.Query<Categoria>(sql).ToList();
            }
            return listaCategorias;
        }
        public static Concierto verInfoConcierto(int idc)
        {
            Concierto ConciertoActual = null;
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string sql = "SELECT * FROM Conciertos WHERE IdConcierto = @pidConcierto";
                ConciertoActual = db.QueryFirstOrDefault<Concierto>(sql, new { pidConcierto = idc });
            }
            return ConciertoActual;
        }
      
        public static Tarjeta VerificarSiExisteTarjeta(int numero)
        {
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string sql = "SELECT * FROM Tarjeta WHERE Numero = @pNumero";
                return db.QueryFirstOrDefault<Tarjeta>(sql, new { pNumero = numero});
            }
        }   
        
        public static Usuario BuscarUsuario(Usuario U)
        {
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string sql = "SELECT * FROM Usuarios WHERE IdUsuario = @U.IdUsuario";
                return db.QueryFirstOrDefault<Usuario>(sql);
            }
        }
        public static Usuario BuscarUsuarioXNombre(string nombre)
        {
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string sql = "SELECT * FROM Usuarios WHERE Nombre = @Nombre";
                return db.QueryFirstOrDefault<Usuario>(sql, new{ Nombre = nombre });
            }
        }
        public static Usuario BuscarContraXUsuario(string nombre)
        {
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string sql = "SELECT Contraseña FROM Usuarios WHERE Nombre = @Nombre";
                return db.QueryFirstOrDefault<Usuario>(sql, new{ Nombre = nombre });
            }
        }
        public static int AgregarUsuario(Usuario usuario)
                {
                    using (SqlConnection db = new SqlConnection(_connectionString))
                    {
                        return db.Execute("sp_AgregarUsuario", new
                        {
                            Contraseña = usuario.Contraseña,
                            Nombre = usuario.Nombre
                        });
                    }
                }

             public static int ActualizarLikesconciertoSP(int idJuego, int cantLikes)
        {
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string idJuegoStr = idJuego.ToString();
                return db.Execute("sp_ActualizarLikesJuego", new
                {
                    IdJuego = idJuegoStr,
                    CantLikes = cantLikes
                });
            }
        }
        public static int VerCantLikes(int idJ)
        {
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string sql = "SELECT CantLikes FROM conciertos WHERE Idconcierto = @pIdconcierto";
                return db.QueryFirstOrDefault<int>(sql, new { pIdconcierto = idJ });
            }
        }
    }
}
