<%@ Page Title="Consulta de Clientes" MasterPageFile="~/Site.Master" Language="C#" AutoEventWireup="true" CodeBehind="consulta_cliente.aspx.cs" Inherits="Detroit.inserir" %>

<asp:Content ID="ClienteContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container-center">
    <!-- Gridview -->
<asp:GridView ID="GridView1" runat="server"   AutoGenerateColumns="False" DataKeyNames="#" DataSourceID="cliente" 
     GridLines="Horizontal" CssClass="table table-responsive-sm table-dark  table-hover" AllowPaging="True" PageIndex="1" PageSize="5" PagerSettings-PageButtonCount="5" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
    <Columns>
        <asp:CommandField ShowSelectButton="True" ButtonType="Button" AccessibleHeaderText="Opção" HeaderText="Opção" /> <asp:CommandField />
        <asp:BoundField DataField="#" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="#" />
        <asp:BoundField DataField="Nome" HeaderText="Nome" SortExpression="Nome" />
        <asp:BoundField DataField="CPF" HeaderText="CPF" SortExpression="CPF" />
    </Columns>
     <PagerStyle HorizontalAlign="Center" />
    <SelectedRowStyle CssClass="bg-secondary" />
<PagerSettings PageButtonCount="5"></PagerSettings>
</asp:GridView>
<asp:SqlDataSource ID="cliente" runat="server" ConnectionString="<%$ ConnectionStrings:testeConnectionString %>"
SelectCommand="SELECT id AS [#], nome AS Nome, cpf AS CPF FROM cliente" InsertCommand="INSERT INTO cliente(nome, cpf) VALUES (@nome, @cpf)" DeleteCommand="DELETE FROM cliente WHERE id = @idcliente" UpdateCommand="UPDATE cliente SET nome = @nome, cpf = @cpf WHERE id = @idcliente">
    <DeleteParameters>
        <asp:ControlParameter ControlID="idcliente" Name="idcliente" PropertyName="Value" />
    </DeleteParameters>
    <InsertParameters>
        <asp:ControlParameter ControlID="nome" Name="nome" PropertyName="Text" />
        <asp:ControlParameter ControlID="cpf" Name="cpf" PropertyName="Text" />
    </InsertParameters>
    <UpdateParameters>
        <asp:ControlParameter ControlID="nome" Name="nome" PropertyName="Text" />
        <asp:ControlParameter ControlID="cpf" Name="cpf" PropertyName="Text" />
        <asp:ControlParameter ControlID="idcliente" Name="idcliente" PropertyName="Value" />
    </UpdateParameters>
    </asp:SqlDataSource>

    <!--Cadastro embutido -->
    <br /><br />

    <table class="table table-responsive-sm table-dark  table-hover">
        <tr>
            <asp:HiddenField ID="idcliente" runat="server" OnValueChanged="idcliente_ValueChanged" />
            <td><h5>Nome:</h5></td>
            <td align="left">
                <asp:TextBox ID="nome" runat="server"></asp:TextBox>
            </td>
            <td align="center"><h5>CPF:</h5></td>
            <td align="left">
                <asp:TextBox ID="cpf" runat="server"></asp:TextBox>
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
