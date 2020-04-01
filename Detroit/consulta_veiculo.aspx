<%@ Page Title="Consulta de Veiculo" MasterPageFile="~/Site.Master" Language="C#" AutoEventWireup="true" CodeBehind="consulta_veiculo.aspx.cs" Inherits="Detroit.consulta_carro" %>


<asp:Content ID="VeiculoContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container-center">
    
<asp:GridView ID="GridView1" runat="server"   AutoGenerateColumns="False" DataKeyNames="#" DataSourceID="carro" 
     GridLines="Horizontal" CssClass="table table-responsive-sm table-dark  table-hover" AllowPaging="True" PageIndex="1" PageSize="5" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
    <Columns>
        <asp:CommandField ShowSelectButton="True" ButtonType="Button" AccessibleHeaderText="Opção" HeaderText="Opção" /> <asp:CommandField />
        <asp:BoundField DataField="#" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="#" />
        <asp:BoundField DataField="Placa" HeaderText="Placa" SortExpression="Placa" />
        <asp:BoundField DataField="Modelo" HeaderText="Modelo" SortExpression="Modelo" />
        <asp:BoundField DataField="Cor" HeaderText="Cor" SortExpression="Cor" />
        <asp:BoundField DataField="Cliente" HeaderText="Cliente" SortExpression="Cliente" />
        <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" />
    </Columns>
     <PagerStyle HorizontalAlign="Center" />
    <SelectedRowStyle CssClass="bg-secondary" />
</asp:GridView>
    <asp:SqlDataSource ID="carro" runat="server" 
        ConnectionString="<%$ ConnectionStrings:testeConnectionString %>" 
        SelectCommand="SELECT carro.id AS [#], carro.placa AS Placa, carro.modelo AS Modelo, carro.cor AS Cor, cliente.nome AS Cliente, carro.status FROM carro INNER JOIN cliente ON carro.cliente_id = cliente.id" InsertCommand="INSERT INTO carro(modelo, cor, placa,status, cliente_id) VALUES (@modelo,@cor,@placa,@status,@cliente_id)" DeleteCommand="DELETE FROM carro WHERE (id = @idcarro)" UpdateCommand="UPDATE carro SET modelo = @modelo, cor = @cor, placa = @placa, cliente_id = @idcliente, status = @status WHERE  id = @idcarro">
        <DeleteParameters>
            <asp:ControlParameter ControlID="idcarro" Name="idcarro" PropertyName="Value" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="modelo" Name="modelo" PropertyName="Text" />
            <asp:ControlParameter ControlID="cor" Name="cor" PropertyName="Text" />
            <asp:ControlParameter ControlID="placa" Name="placa" PropertyName="Text" />
            <asp:Parameter Name="status" />
            <asp:ControlParameter ControlID="DropDownList1" Name="cliente_id" PropertyName="SelectedValue" />
        </InsertParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="modelo" Name="modelo" PropertyName="Text" />
            <asp:ControlParameter ControlID="cor" Name="cor" PropertyName="Text" />
            <asp:ControlParameter ControlID="placa" Name="placa" PropertyName="Text" />
            <asp:ControlParameter ControlID="DropDownList1" Name="idcliente" PropertyName="SelectedValue" />
            <asp:Parameter Name="status" />
            <asp:ControlParameter ControlID="idcarro" Name="idcarro" PropertyName="Value" />
        </UpdateParameters>
    </asp:SqlDataSource>
        <asp:HiddenField ID="idcarro" runat="server" OnValueChanged="idcarro_ValueChanged" />
    <br /><br />
    <table class="table table-responsive-sm table-dark  table-hover">
        <tr>
            <td><h5>Placa:</h5></td>
            <td align="left">
                <asp:TextBox ID="placa" runat="server"></asp:TextBox>
            </td>
            <td align="left"><h5>Cliente:</h5></td>
            <td align="left">
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="cliente" DataTextField="nome" DataValueField="id">
                </asp:DropDownList>  
                <asp:SqlDataSource ID="cliente" runat="server" ConnectionString="<%$ ConnectionStrings:testeConnectionString %>" SelectCommand="SELECT [id], [nome] FROM [cliente]" ></asp:SqlDataSource>
            </td>
        </tr>
         <tr>
            <td><h5>Modelo:</h5></td>
            <td align="left">
                <asp:TextBox ID="modelo" runat="server"></asp:TextBox>
            </td>
            <td align="left"><h5>Cor:</h5></td>
            <td align="left">
                <asp:TextBox ID="cor" runat="server"></asp:TextBox>
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
