<%@ Page Title="Consulta Vaga-Historico" MasterPageFile="~/Site.Master" Language="C#" AutoEventWireup="true" CodeBehind="consulta_vaga_historico.aspx.cs" Inherits="Detroit.consulta_vaga_historico" %>

<asp:Content ID="VagaHistoricoContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-login">
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
        <asp:SqlDataSource ID="vagahistorico" runat="server" ConnectionString="<%$ ConnectionStrings:testeConnectionString %>" SelectCommand="SELECT vaga_historico.id AS [#], carro.placa AS Placa, vaga_historico.vaga_id AS Vaga, vaga_historico.entrada AS Entrada, vaga_historico.saida AS Saida FROM vaga_historico INNER JOIN vaga ON vaga_historico.vaga_id = vaga.id INNER JOIN carro ON vaga_historico.carro_id = carro.id WHERE (vaga_historico.saida IS NOT NULL)" InsertCommand="INSERT INTO vaga_historico(vaga_id, carro_id, entrada, saida) VALUES (@vaga_id, @carro_id, @entrada, @saida)" DeleteCommand="DELETE FROM vaga_historico WHERE id = @idvagahist" UpdateCommand="UPDATE vaga_historico SET vaga_id =@vaga, carro_id =@carro, entrada =@entrada, saida =@saida WHERE id = @idvagahist">
            <DeleteParameters>
                <asp:ControlParameter ControlID="idvagahist" Name="idvagahist" PropertyName="Value" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="vagadrop" Name="vaga_id" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="carro" Name="carro_id" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="entrada" DefaultValue="" Name="entrada" PropertyName="Text" />
                <asp:ControlParameter ControlID="saida" DefaultValue="NULL" Name="saida" PropertyName="Text" />
            </InsertParameters>
            <UpdateParameters>
                <asp:ControlParameter ControlID="vagadrop" Name="vaga" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="carro" Name="carro" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="entrada" Name="entrada" PropertyName="Text" />
                <asp:ControlParameter ControlID="saida" Name="saida" PropertyName="Text" />
                <asp:ControlParameter ControlID="idvagahist" Name="idvagahist" PropertyName="Value" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:HiddenField ID="idvagahist" runat="server" OnValueChanged="idvagahist_ValueChanged" />
        <br /><br />

    <table class="table table-responsive-sm table-dark table-hover">
        <tr>
            <td ><h5>Carro:</h5></td>
            <td align="left">
                <asp:DropDownList ID="carro" runat="server" DataSourceID="carrosql" DataTextField="placa" DataValueField="id"></asp:DropDownList> 
                <asp:SqlDataSource ID="carrosql" runat="server" ConnectionString="<%$ ConnectionStrings:testeConnectionString %>" SelectCommand="SELECT placa, id FROM carro"></asp:SqlDataSource>
            </td>
            <td align="center" ><h5>Andar</h5></td>
            <td align="left">
                <asp:DropDownList ID="vagadrop" runat="server" DataSourceID="vagasql" DataTextField="id" DataValueField="id">
                </asp:DropDownList>
                <asp:SqlDataSource ID="vagasql" runat="server" ConnectionString="<%$ ConnectionStrings:testeConnectionString %>" SelectCommand="SELECT [id] FROM [vaga]">
                </asp:SqlDataSource>
            </td>
        </tr>
         <tr>
            <td ><h5>Entrada:</h5></td>
            <td align="left" >
               <asp:TextBox ID="entrada"  runat="server">dd/mm/yyyy 00:00:00</asp:TextBox>
             </td>
            <td align="center" ><h5>Saida:</h5></td>
            <td align="left" >
                   <asp:TextBox ID="saida" runat="server">dd/mm/yyyy 00:00:00</asp:TextBox>
            </td>
        </tr>
       
    </table>
        <div class="d-flex justify-content-center">           
            <asp:Button ID="Alterar" class="btn btn-warning" runat="server" Text="Alterar" OnClick="Alterar_Click" />&nbsp;&nbsp;
            <asp:Button ID="Limpar" class="btn btn-success" runat="server" Text="Limpar" OnClick="Limpar_Click" />
        </div>
    </div>
    
</asp:Content>