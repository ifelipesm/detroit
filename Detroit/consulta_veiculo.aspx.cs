using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Detroit
{
    public partial class consulta_carro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Recupera usuario da sessão
            string usuario = (string)Session["Usuario"];

            // Sessão for invalida
            if (usuario == null)
            {
                Response.Redirect("login.aspx");
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            idcarro.Value = GridView1.SelectedRow.Cells[2].Text;
            placa.Text = GridView1.SelectedRow.Cells[3].Text;
            modelo.Text = GridView1.SelectedRow.Cells[4].Text;
            cor.Text = GridView1.SelectedRow.Cells[5].Text;
            GridView1.SelectedRowStyle.CssClass = "bg-secondary";
        }

        protected void Cadastrar_Click(object sender, EventArgs e) => carro.Insert();

        protected void Alterar_Click(object sender, EventArgs e) => carro.Update();

        protected void Excluir_Click(object sender, EventArgs e) => carro.Delete();

        protected void idcarro_ValueChanged(object sender, EventArgs e)
        {
            idcarro.Value = GridView1.SelectedRow.Cells[2].Text;
        }
        protected void Limpar_Click(object sender, EventArgs e)
        {
            idcarro.Value = "";
            placa.Text = "";
            modelo.Text ="";
            cor.Text = "";
            GridView1.SelectedRowStyle.CssClass = "";
        }

    }
}