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
    public partial class LOGEO : Form
    {

        SqlConnection con;
        int c = 0;
        DataTable N1 = new DataTable();
        public LOGEO()
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
            INICIOSESION(this.TXTUSUARIO.Text, this.TXTPASSWORD.Text);

            //try
            //{
            //    con.Open();
            //    int total;
            //    string usu, pas;
            //    usu = TXTUSUARIO.Text;
            //    pas = TXTPASSWORD.Text;
            //    String sql = "select * from Usuarios where Usuario ='" + usu + "' and Password ='" + pas + "'";
            //    SqlDataAdapter daproducto = new SqlDataAdapter(sql, con);
            //    DataTable dtproducto = new DataTable();
            //    daproducto.Fill(dtproducto);

            //    total = dtproducto.Rows.Count;
            //    if (total == 1)
            //    //Case total
            //    {
            //        MessageBox.Show("PASSWORD CORRECTA", "Bienvenido");
            //        ////RECUPERACIONPASS obj = new RECUPERACIONPASS();
            //        //obj.Show();
            //        con.Close();
            //    }
            //    else

            //    {
            //        c = c + 1;

            //        if (c < 3)
            //        {
            //            MessageBox.Show("PASSWORD INCORRECTA", "Error");
            //            con.Close();
            //        }
            //        else if (c == 3)
            //        {
            //            MessageBox.Show("EXEDIO EL NUMERO DE INTENTOS", "Error");
            //            con.Close();
            //            Application.Exit();

            //        }

            //    }
            //}

            //catch (Exception)
            //{

            //    MessageBox.Show("PASSWORD incorrecta");
            //}



        }


        public void INICIOSESION (string usuario, string password)
        {

            try
            {

                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT Nombre, TipoUsuario FROM Usuario WHERE Usuario =@Usuario AND Password = @Password ",con);
                cmd.Parameters.AddWithValue("Usuario", usuario);
                cmd.Parameters.AddWithValue("Password", password);

                SqlDataAdapter sdd = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();

                sdd.Fill(dt);

                if (dt.Rows.Count == 1) {

                    this.Hide();

                    if (dt.Rows[0][1].ToString() == "ADMINISTRADOR")  {
                        new ADMINISTRADOR(dt.Rows[0][0].ToString()).Show();

                    }  else  if (dt.Rows[0][1].ToString() == "USUARIO")
                    {

                        new USUARIO(dt.Rows[0][0].ToString()).Show();


                    }



                }
                else  {

                    c = c + 1;

                    if (c < 4)
                    {
                        //MessageBox.Show("PASSWORD INCORRECTA", "Error");
                        //con.Close();
                    }
                    else if (c == 4)
                    {
                        MessageBox.Show("EXEDIO EL NUMERO DE INTENTOS", "Error");
                        con.Close();
                        Application.Exit();

                    }
                    MessageBox.Show("USUARIO Y/O CONTRASEÑA INCORRECTA");
                }


            }
            catch (Exception)
            {

                throw;
            }
            finally
            {

                con.Close();

            }
             
             


        }

        private void Form1_Load(object sender, EventArgs e)
        {
            try
            {
                con = new SqlConnection("database=BDTFCM;data source=.;integrated security=sspi");
                //MOSTRARTIPOS();
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

        //private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    //int x = COMBOTIPO.SelectedIndex;
        //    //COMBOTIPO.Text = N1.Rows[x]["Tipo"].ToString();
        //}

        private void TXTPASSWORD_TextChanged(object sender, EventArgs e)
        {

        }

        private void panel1_Paint(object sender, PaintEventArgs e)
        {

        }

        //private void MOSTRARTIPOS()
        //{
        //    con.Open();
        //    string sql = "select * from Usuarios";
        //    SqlDataAdapter da = new SqlDataAdapter(sql, con);

        //    da.Fill(N1);
        //    COMBOTIPO.DataSource = N1;
        //    COMBOTIPO.DisplayMember = "Tipo";
        //    con.Close();

        //}










    }







}
