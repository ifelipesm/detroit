using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Detroit
{
    public partial class ClienteHistorico : System.Web.UI.Page
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
            GridView1.SelectedRowStyle.CssClass = "bg-secondary";
            idclientehist.Value = GridView1.SelectedRow.Cells[2].Text;
            valor.Text = GridView1.SelectedRow.Cells[4].Text;
            
        }

        protected void Cadastrar_Click(object sender, EventArgs e) => clientehistoricogrid.Insert();

        protected void Alterar_Click(object sender, EventArgs e) => clientehistoricogrid.Update();

        protected void Excluir_Click(object sender, EventArgs e) => clientehistoricogrid.Delete();

        protected void idclientehist_ValueChanged(object sender, EventArgs e)
        {
            idclientehist.Value = GridView1.SelectedRow.Cells[2].Text;
        }

        protected void Limpar_Click(object sender, EventArgs e)
        {
            idclientehist.Value = "";
            valor.Text = "";
            GridView1.SelectedRowStyle.CssClass = "";
        }
    }
}