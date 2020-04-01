using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Detroit
{
    public partial class consulta_vaga : System.Web.UI.Page
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
            idvaga.Value = GridView1.SelectedRow.Cells[2].Text;
            andar.Text = GridView1.SelectedRow.Cells[3].Text;
            numero.Text = GridView1.SelectedRow.Cells[4].Text;
            altura.Text = GridView1.SelectedRow.Cells[5].Text;
            largura.Text = GridView1.SelectedRow.Cells[6].Text;
            situacao.Text = GridView1.SelectedRow.Cells[8].Text;
            GridView1.SelectedRowStyle.CssClass = "bg-secondary";
        }

        protected void Cadastrar_Click(object sender, EventArgs e) => vaga.Insert();

        protected void Alterar_Click(object sender, EventArgs e) => vaga.Update();

        protected void Excluir_Click(object sender, EventArgs e) => vaga.Delete();

        protected void idvaga_ValueChanged(object sender, EventArgs e)
        {
            idvaga.Value = GridView1.SelectedRow.Cells[2].Text;
        }

        protected void Limpar_Click(object sender, EventArgs e)
        {
            idvaga.Value = "";
            andar.Text = "";
            numero.Text = "";
            altura.Text = "";
            largura.Text = "";
            situacao.Text = "";
            GridView1.SelectedRowStyle.CssClass = "";
        }
    }
}