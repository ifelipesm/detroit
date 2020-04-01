using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Globalization;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Detroit
{
    public partial class principal : System.Web.UI.Page
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
            idcarro.Value = carro.SelectedValue;
            //DataView dv = (DataView)carro0.Select(DataSourceSelectArguments.Empty);
            //dv.r["id"];
            idvaga.Value = GridView1.SelectedRow.Cells[4].Text;
            entrada.Text = GridView1.SelectedRow.Cells[5].Text;
            if (GridView1.SelectedRow.Cells[6].Text == "&nbsp;")
                saida.Text = "";
            GridView1.SelectedRowStyle.CssClass = "bg-secondary";
        }

        protected void Cadastrar_Click(object sender, EventArgs e) {
            idcarro.Value = carro.SelectedValue;
            idvaga.Value = vagadrop.SelectedValue;
            vaga1.Update();
            carro1.Update();
            vagahistorico.Insert(); }

        protected void Alterar_Click(object sender, EventArgs e) {
            vaga0.Update();
            carro0.Update();
            vagahistorico.Update(); }

        protected void Excluir_Click(object sender, EventArgs e) {
            vaga0.Update();
            carro0.Update();
            vagahistorico.Delete(); }

        protected void idvagahist_ValueChanged(object sender, EventArgs e)
        {
            idvagahist.Value = GridView1.SelectedRow.Cells[1].Text;
        }

        protected void carro_SelectedIndexChanged(object sender, EventArgs e)
        {
             
            TextBox1.Text = carro.SelectedItem.Value;
        }

        protected void vagadrop_SelectedIndexChanged(object sender, EventArgs e)
        {
           
            TextBox2.Text = vagadrop.SelectedItem.Value;
        }

        protected void Limpar_Click(object sender, EventArgs e)
        {
            idvagahist.Value = "";
            entrada.Text = "";
            saida.Text = "";
            GridView1.SelectedRowStyle.CssClass = "";
        }

        protected void SaidaDatenow_Click(object sender, EventArgs e)
        {
            string sysdata = DateTime.Now.ToString("MM/dd/yyyy HH:mm:ss");
            saida.Text = sysdata;
        }

        protected void EntradaDatenow_Click(object sender, EventArgs e)
        {
            string sysdata = DateTime.Now.ToString("MM/dd/yyyy HH:mm:ss");
            entrada.Text = sysdata;
        }

    }
}