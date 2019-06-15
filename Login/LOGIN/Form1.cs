using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace LOGIN
{
    public partial class Form1 : Form
    {

        SqlConnection con;
        int c = 0;
        public Form1()
        {
            InitializeComponent();
        }

        private void linkLabel1_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            RECUPERACIONPASS frc = new RECUPERACIONPASS();
            frc.Show();
        }

        private void txtIdUsuario_TextChanged(object sender, EventArgs e)
        {

        }

        private void BTN_INGRESAR_Click(object sender, EventArgs e)
        {
            try
            {
                con.Open();
                int total;
                string usu, pas;
                usu = TXTUSUARIO.Text;
                pas = TXTPASSWORD.Text;
                String sql = "select * from Usuarios where Usuario ='" + usu + "' and Password ='" + pas + "'";
                SqlDataAdapter daproducto = new SqlDataAdapter(sql, con);
                DataTable dtproducto = new DataTable();
                daproducto.Fill(dtproducto);

                total = dtproducto.Rows.Count;
                if (total == 1)
                //Case total
                {
                    MessageBox.Show("PASSWORD CORRECTA", "Bienvenido");
                    ////RECUPERACIONPASS obj = new RECUPERACIONPASS();
                    //obj.Show();
                    con.Close();
                }
                else

                {
                    c = c + 1;

                    if (c < 3)
                    {
                        MessageBox.Show("PASSWORD INCORRECTA", "Error");
                        con.Close();
                    }
                    else if (c == 3)
                    {
                        MessageBox.Show("EXEDIO EL NUMERO DE INTENTOS", "Error");
                        con.Close();
                        Application.Exit();

                    }

                }
            }

            catch (Exception)
            {

                MessageBox.Show("PASSWORD incorrecta");
            }



        }

        private void Form1_Load(object sender, EventArgs e)
        {
            try
            {
                con = new SqlConnection("database=LOGIN;data source=.;integrated security=sspi");

            }
            catch (Exception)
            {
                MessageBox.Show("Error de Conexion");

            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            {
                MessageBox.Show("DESEAS SALIR", "SALIR");

            }
            this.Dispose();
        }
    }
}
