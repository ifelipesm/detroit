using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Detroit
{
    public partial class inserir : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
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
            idcliente.Value = GridView1.SelectedRow.Cells[2].Text;
            nome.Text = GridView1.SelectedRow.Cells[3].Text;
            cpf.Text = GridView1.SelectedRow.Cells[4].Text;
            GridView1.SelectedRowStyle.CssClass = "bg-secondary";
        }

        protected void Cadastrar_Click(object sender, EventArgs e) => cliente.Insert();

        protected void Alterar_Click(object sender, EventArgs e) => cliente.Update();

        protected void Excluir_Click(object sender, EventArgs e) => cliente.Delete();

        protected void idcliente_ValueChanged(object sender, EventArgs e)
        {
            idcliente.Value = GridView1.SelectedRow.Cells[1].Text;
        }
        protected void Limpar_Click(object sender, EventArgs e)
        {
            idcliente.Value = "";
            nome.Text = "";
            cpf.Text = "";
            GridView1.SelectedRowStyle.CssClass = "";
        }
    }
}