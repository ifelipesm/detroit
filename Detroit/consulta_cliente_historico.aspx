<%@ Page Title="Consulta Cliente-Historico" MasterPageFile="~/Site.Master" Language="C#" AutoEventWireup="true" CodeBehind="consulta_cliente_historico.aspx.cs" Inherits="Detroit.ClienteHistorico" %>


<asp:Content ID="ClienteHistoricoContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-center">
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="#" DataSourceID="clientehistoricogrid"
            CssClass="table table-responsive-sm table-dark table-hover" PageIndex="1" PageSize="5" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:CommandField ShowSelectButton="True" ButtonType="Button" AccessibleHeaderText="Opção" HeaderText="Opção" /> <asp:CommandField />
                <asp:BoundField DataField="#" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="#" />
                <asp:BoundField DataField="CPF" HeaderText="CPF" SortExpression="CPF" />
                <asp:BoundField DataField="Valor" HeaderText="Valor" SortExpression="Valor" />
                <asp:BoundField DataField="Pagamento" HeaderText="Pagamento" SortExpression="Pagamento" />
            </Columns>
            <PagerStyle HorizontalAlign="Center" />
        </asp:GridView>
        <asp:SqlDataSource ID="clientehistoricogrid" runat="server" 
            ConnectionString="<%$ ConnectionStrings:testeConnectionString %>" SelectCommand="SELECT cliente_historico.id AS [#], cliente.cpf AS CPF, cliente_historico.valor AS Valor, forma_pagamento.descricao AS Pagamento FROM cliente_historico INNER JOIN vaga_historico ON cliente_historico.vaga_historico_id = vaga_historico.id INNER JOIN carro ON vaga_historico.carro_id = carro.id INNER JOIN cliente ON carro.cliente_id = cliente.id INNER JOIN forma_pagamento ON cliente_historico.forma_pagamento_id = forma_pagamento.id" InsertCommand="INSERT INTO cliente_historico(vaga_historico_id, valor, forma_pagamento_id) VALUES (@cliente, @valor, @formapag)" DeleteCommand="DELETE FROM cliente_historico WHERE id = @idclientehist" UpdateCommand="UPDATE cliente_historico SET vaga_historico_id = @cliente, valor = @valor, forma_pagamento_id =@pagamento WHERE id = @idclientehist">
            <DeleteParameters>
                <asp:ControlParameter ControlID="idclientehist" Name="idclientehist" PropertyName="Value" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="cliente" Name="cliente" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="valor" Name="valor" PropertyName="Text" />
                <asp:ControlParameter ControlID="tipopag" Name="formapag" PropertyName="SelectedValue" />
            </InsertParameters>
            <UpdateParameters>
                <asp:ControlParameter ControlID="cliente" Name="cliente" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="valor" Name="valor" PropertyName="Text" />
                <asp:ControlParameter ControlID="tipopag" Name="pagamento" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="idclientehist" Name="idclientehist" PropertyName="Value" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:HiddenField ID="idclientehist" runat="server" OnValueChanged="idclientehist_ValueChanged" />
        <br /><br />
    
    <table class="table table-responsive-sm table-dark table-hover" >
        <tr>
            <td><h5>CPF:</h5></td>
            <td align="center">
                 <asp:DropDownList ID="cliente" runat="server" DataSourceID="clientesql" DataTextField="cpf" DataValueField="id"></asp:DropDownList>
                <asp:SqlDataSource ID="clientesql" runat="server" ConnectionString="<%$ ConnectionStrings:testeConnectionString %>" SelectCommand="SELECT vaga_historico.id, cliente.cpf FROM vaga_historico INNER JOIN carro ON vaga_historico.carro_id = carro.id INNER JOIN cliente ON carro.cliente_id = cliente.id"></asp:SqlDataSource>
            </td>
            <td><h5>Valor:</h5></td>
            <td align="left">
                <asp:TextBox ID="valor" runat="server"></asp:TextBox>
            </td>
        </tr>
         <tr>
            <td><h5>Pagamento:</h5></td>
            <td align="center">
                 <asp:DropDownList ID="tipopag" runat="server" DataSourceID="tipopagsql" DataTextField="descricao" DataValueField="id"></asp:DropDownList>
                <asp:SqlDataSource ID="tipopagsql" runat="server" ConnectionString="<%$ ConnectionStrings:testeConnectionString %>" SelectCommand="SELECT id, descricao FROM forma_pagamento"></asp:SqlDataSource>
             </td>
           
        </tr>
    </table>
        <div class="d-flex justify-content-center">
            <asp:Button ID="Cadastrar" class="btn btn-primary " runat="server" Text="Cadastrar" OnClick="Cadastrar_Click" />&nbsp;&nbsp;
            <asp:Button ID="Alterar" class="btn btn-warning" runat="server" Text="Alterar" OnClick="Alterar_Click" />&nbsp;&nbsp;
            <asp:Button ID="Excluir" class="btn btn-danger " runat="server" Text="Excluir" OnClick="Excluir_Click" />&nbsp;&nbsp;
            <asp:Button ID="Limpar" class="btn btn-success" runat="server" Text="Limpar" OnClick="Limpar_Click" />
        </div>
          
           
        
           
        
           
       
    </div>
</asp:Content>