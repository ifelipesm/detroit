<%@ Page Title="Consulta de Vagas" MasterPageFile="~/Site.Master" Language="C#" AutoEventWireup="true" CodeBehind="consulta_vaga.aspx.cs" Inherits="Detroit.consulta_vaga" %>


<asp:Content ID="ClienteContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-login">
<asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="#" DataSourceID="vaga"
    CssClass="table table-responsive-sm table-dark table-striped table-hover" PageIndex="1" PageSize="5" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
    <Columns>
        <asp:CommandField ShowSelectButton="True" ButtonType="Button" AccessibleHeaderText="Opção" HeaderText="Opção" /> <asp:CommandField />
        <asp:BoundField DataField="#" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="#" />
        <asp:BoundField DataField="Andar" HeaderText="Andar" SortExpression="Andar" />
        <asp:BoundField DataField="Numero" HeaderText="Numero" SortExpression="Numero" />
        <asp:BoundField DataField="Largura" HeaderText="Largura" SortExpression="Largura" />
        <asp:BoundField DataField="Altura" HeaderText="Altura" SortExpression="Altura" />
        <asp:BoundField DataField="Descrição" HeaderText="Descrição" SortExpression="Descrição" />
        <asp:BoundField DataField="Situação" HeaderText="Situação" SortExpression="Situação" />
    </Columns>
     <PagerStyle HorizontalAlign="Center" />
    <SelectedRowStyle CssClass="bg-secondary" />
    </asp:GridView>
    <asp:SqlDataSource ID="vaga" runat="server" ConnectionString="<%$ ConnectionStrings:testeConnectionString %>" SelectCommand="SELECT vaga.id AS [#], vaga.andar AS Andar, vaga.numero AS Numero, vaga.largura AS Largura, vaga.altura AS Altura, vaga_tipo.descricao AS Descrição, vaga.ocupada AS Situação FROM vaga INNER JOIN vaga_tipo ON vaga.vaga_tipo_id = vaga_tipo.id" InsertCommand="INSERT INTO vaga(andar, numero, largura, altura, ocupada,vaga_tipo_id) VALUES (@andar, @numero, @largura, @altura,@ocupada,@vaga_tipo_id)" DeleteCommand="DELETE FROM vaga WHERE (id = @idvaga)" UpdateCommand="UPDATE vaga SET andar =@andar, numero =@numero, largura =@largura, altura =@altura, ocupada =@situacao, vaga_tipo_id =@vagatipo WHERE id = @idvaga">
        <DeleteParameters>
            <asp:ControlParameter ControlID="idvaga" Name="idvaga" PropertyName="Value" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="andar" Name="andar" PropertyName="Text" />
            <asp:ControlParameter ControlID="numero" Name="numero" PropertyName="Text" />
            <asp:ControlParameter ControlID="largura" Name="largura" PropertyName="Text" />
            <asp:ControlParameter ControlID="altura" Name="altura" PropertyName="Text" />
            <asp:ControlParameter ControlID="situacao" DefaultValue="0" Name="ocupada" PropertyName="Text" />
            <asp:ControlParameter ControlID="tipo_vaga" Name="vaga_tipo_id" PropertyName="SelectedValue" />
        </InsertParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="andar" Name="andar" PropertyName="Text" />
            <asp:ControlParameter ControlID="numero" Name="numero" PropertyName="Text" />
            <asp:ControlParameter ControlID="largura" Name="largura" PropertyName="Text" />
            <asp:ControlParameter ControlID="altura" Name="altura" PropertyName="Text" />
            <asp:ControlParameter ControlID="situacao" Name="situacao" PropertyName="Text" />
            <asp:ControlParameter ControlID="tipo_vaga" Name="vagatipo" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="idvaga" Name="idvaga" PropertyName="Value" />
        </UpdateParameters>
        </asp:SqlDataSource>
        <asp:HiddenField ID="idvaga" runat="server" OnValueChanged="idvaga_ValueChanged" />
    <br /><br />
    <table class="table table-responsive-sm table-dark table-striped table-hover">
        <tr>
            <td><h5>Andar:</h5></td>
            <td align="left">
                <asp:TextBox ID="andar" runat="server"></asp:TextBox>
            </td>
            <td align="center"><h5>Numero:</h5></td>
            <td align="left">
            <asp:TextBox ID="numero" runat="server"></asp:TextBox>
            </td>
        </tr>
         <tr>
            <td><h5>Largura:</h5></td>
            <td align="left">
                <asp:TextBox ID="largura" runat="server"></asp:TextBox>
            </td>
            <td align="center"><h5>Altura:</h5></td>
            <td align="left">
                <asp:TextBox ID="altura" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="center"><h5>Tipo:</h5></td>
            <td align="left">
                <asp:DropDownList ID="tipo_vaga" runat="server" DataSourceID="tipovagacon" DataTextField="descricao" DataValueField="id"></asp:DropDownList>
                <asp:SqlDataSource ID="tipovagacon" runat="server" ConnectionString="<%$ ConnectionStrings:testeConnectionString %>" SelectCommand="SELECT [id], [descricao] FROM [vaga_tipo]"></asp:SqlDataSource>
            </td>
            <td align="center"><h5>Situacao:</h5></td>
            <td align="left">
                <asp:TextBox ID="situacao" runat="server"></asp:TextBox></td>
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