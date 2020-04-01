using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Detroit
{
    public partial class consulta_vaga_historico : System.Web.UI.Page
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
            idvagahist.Value = GridView1.SelectedRow.Cells[2].Text;
            entrada.Text = GridView1.SelectedRow.Cells[5].Text;
            saida.Text = GridView1.SelectedRow.Cells[6].Text;
            GridView1.SelectedRowStyle.CssClass = "bg-secondary";
        }

        protected void Alterar_Click(object sender, EventArgs e) => vagahistorico.Update();

        protected void Excluir_Click(object sender, EventArgs e) => vagahistorico.Delete();

        protected void idvagahist_ValueChanged(object sender, EventArgs e)
        {
            idvagahist.Value = GridView1.SelectedRow.Cells[1].Text;
        }
        protected void Limpar_Click(object sender, EventArgs e)
        {
            idvagahist.Value = "";
            entrada.Text = "";
            saida.Text = "";
            GridView1.SelectedRowStyle.CssClass = "";
        }
    }
}