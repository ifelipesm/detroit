<%@ Page Title="HOME" Language="C#" MasterPageFile="~/Site.Master"  AutoEventWireup="true" CodeBehind="principal.aspx.cs" Inherits="Detroit.principal" %>

<asp:Content ID="PrincipalContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <% string usuario = (string)Session["Usuario"];
               Response.Write("<br><h4>Bem vindo, " + usuario + "</h4>"); %> 
        <div class="container-login">
            <h3>Controle de Veiculos</h3><br /><br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="#" DataSourceID="vagahistorico"
            CssClass="table table-responsive-sm table-dark table-hover" AllowPaging="True" PageIndex="1" PageSize="5" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" GridLines="None">
            <Columns>
                <asp:CommandField ShowSelectButton="True" ButtonType="Button" AccessibleHeaderText="Opção" HeaderText="Opção" /> <asp:CommandField />
                <asp:BoundField DataField="#" HeaderText="#" ReadOnly="True" SortExpression="#" InsertVisible="False" />
                <asp:BoundField DataField="Placa" HeaderText="Placa" SortExpression="Placa" />
                <asp:BoundField DataField="Vaga" HeaderText="Vaga" SortExpression="Vaga" />
                <asp:BoundField DataField="Entrada" HeaderText="Entrada" SortExpression="Entrada" />
                <asp:BoundField DataField="Saida" HeaderText="Saida" SortExpression="Saida" />
            </Columns>
            <PagerStyle HorizontalAlign="Center" />
            <SelectedRowStyle CssClass="bg-secondary" />
        </asp:GridView>
        <asp:SqlDataSource ID="vagahistorico" runat="server" ConnectionString="<%$ ConnectionStrings:testeConnectionString %>" SelectCommand="SELECT vaga_historico.id AS [#], carro.placa AS Placa, vaga_historico.vaga_id AS Vaga, vaga_historico.entrada AS Entrada, vaga_historico.saida AS Saida FROM vaga_historico INNER JOIN vaga ON vaga_historico.vaga_id = vaga.id INNER JOIN carro ON vaga_historico.carro_id = carro.id WHERE vaga_historico.saida IS NULL" InsertCommand="INSERT INTO vaga_historico(vaga_id, carro_id, entrada, saida) VALUES (@vaga_id, @carro_id, @entrada, @saida)" DeleteCommand="DELETE FROM vaga_historico WHERE id = @idvagahist" UpdateCommand="UPDATE vaga_historico SET vaga_id =@vaga, carro_id =@carro, entrada =@entrada, saida =@saida WHERE id = @idvagahist">
            <DeleteParameters>
                <asp:ControlParameter ControlID="idvagahist" Name="idvagahist" PropertyName="Value" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="vagadrop" Name="vaga_id" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="carro" Name="carro_id" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="entrada" DefaultValue="" Name="entrada" PropertyName="Text" />
                <asp:ControlParameter ControlID="saida" DefaultValue="" Name="saida" PropertyName="Text" />
            </InsertParameters>
            <UpdateParameters>
                <asp:ControlParameter ControlID="vagadrop" Name="vaga" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="carro" Name="carro" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="entrada" Name="entrada" PropertyName="Text" />
                <asp:ControlParameter ControlID="saida" Name="saida" PropertyName="Text" />
                <asp:ControlParameter ControlID="idvagahist" Name="idvagahist" PropertyName="Value" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:HiddenField ID="idvagahist" runat="server" />
        <br /><br />

    <table class="table table-responsive-sm table-dark table-hover">
        <tr>
            <td ><h5>Carro:</h5></td>
            <td align="left">
                <asp:DropDownList ID="carro" runat="server" DataSourceID="carrosql" DataTextField="placa" DataValueField="id" OnSelectedIndexChanged="carro_SelectedIndexChanged"></asp:DropDownList> 
                <asp:SqlDataSource ID="carrosql" runat="server" ConnectionString="<%$ ConnectionStrings:testeConnectionString %>" SelectCommand="SELECT placa, id FROM carro WHERE status = 0 OR status IS NULL"></asp:SqlDataSource>
            </td>
            <td align="center" ><h5>Vaga</h5></td>
            <td align="left">
                <asp:DropDownList ID="vagadrop" runat="server" DataSourceID="vagasql" DataTextField="id" DataValueField="id" OnSelectedIndexChanged="vagadrop_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:SqlDataSource ID="vagasql" runat="server" ConnectionString="<%$ ConnectionStrings:testeConnectionString %>" SelectCommand="SELECT [id] FROM [vaga] WHERE ocupada = 0">
                </asp:SqlDataSource>
            </td>
        </tr>
         <tr>
            <td ><h5>Entrada:</h5></td>
            <td align="left" >
               <asp:TextBox ID="entrada" TextMode="DateTime"  runat="server">dd/mm/yyyy 00:00:00</asp:TextBox>&nbsp;&nbsp;
               <asp:Button ID="EntradaDatenow" class="btn btn-light" runat="server" Text="Usar Hora Atual" OnClick="EntradaDatenow_Click" Width="158px" />
               
             </td>
            <td align="center" ><h5>Saida:</h5></td>
            <td align="left" >
                   <asp:TextBox ID="saida" textmode="DateTime" runat="server" text="" ReadOnly="True"></asp:TextBox>&nbsp;&nbsp;
                <asp:Button ID="SaidaDatenow" class="btn btn-light" runat="server" Text="Usar Hora Atual" OnClick="SaidaDatenow_Click" Width="149px" />
            </td>
        </tr>
        <tr><td>
            <asp:TextBox ID="TextBox1" readonly="true" runat="server"></asp:TextBox></td><td>
                <asp:TextBox ID="TextBox2" ReadOnly="true" runat="server"></asp:TextBox></td></tr>     
    </table>
        <div class="d-flex justify-content-center">
            <asp:Button ID="Cadastrar" class="btn btn-primary " runat="server" Text="Cadastrar" OnClick="Cadastrar_Click" />&nbsp;&nbsp;
            <asp:Button ID="Alterar" class="btn btn-warning" runat="server" Text="Alterar" OnClick="Alterar_Click" />&nbsp;&nbsp;
            <asp:Button ID="Excluir" class="btn btn-danger " runat="server" Text="Excluir" OnClick="Excluir_Click" />&nbsp;&nbsp;
            <asp:Button ID="Limpar" class="btn btn-success" runat="server" Text="Limpar" OnClick="Limpar_Click" />
            <asp:SqlDataSource ID="carro1" runat="server" ConnectionString="<%$ ConnectionStrings:testeConnectionString %>" UpdateCommand="UPDATE carro SET status = 1 WHERE (id = @idcarro)">
                <UpdateParameters>
                    <asp:ControlParameter ControlID="idcarro" Name="idcarro" PropertyName="Value" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="carro0" runat="server" ConnectionString="<%$ ConnectionStrings:testeConnectionString %>" UpdateCommand="UPDATE carro SET status = 0 WHERE (id = @idcarro)" SelectCommand="SELECT id FROM carro WHERE (placa = @placa)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ds_idcarro" Name="placa" PropertyName="Value" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="idcarro"  Name="idcarro" PropertyName="Value" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:HiddenField ID="idcarro" runat="server" />
            <asp:HiddenField ID="ds_idcarro" runat="server" />
            <asp:SqlDataSource ID="vaga1" ConnectionString="<%$ ConnectionStrings:testeConnectionString %>" runat="server" UpdateCommand="UPDATE vaga SET ocupada = 1 WHERE (id = @idvaga)">
                <UpdateParameters>
                    <asp:ControlParameter ControlID="idvaga"  Name="idvaga" PropertyName="Value" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="vaga0" ConnectionString="<%$ ConnectionStrings:testeConnectionString %>" runat="server" UpdateCommand="UPDATE vaga SET ocupada = 0 WHERE (id = @idvaga)">
                <UpdateParameters>
                    <asp:ControlParameter ControlID="idvaga" Name="idvaga" PropertyName="Value" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:HiddenField ID="idvaga" runat="server" />
        </div>
    </div>
    
</asp:Content>
