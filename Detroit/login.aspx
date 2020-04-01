<%@ Page Title="LOGIN" MasterPageFile="~/SiteLogin.master" Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Detroit.login" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="LoginPlaceholder" runat="server">

    <div class="container-login">
    <div class="mb-3" align="center">
 
     <asp:Login ID="Login1" runat="server" OnAuthenticate="Login1_Authenticate">
        <LayoutTemplate>
            <table class="table table-responsive-sm  table-dark table-borderless" cellpadding="1" cellspacing="0" style="border-collapse:collapse;">
                <tr>
                    <td>
                        <table cellpadding="0">
                            <tr>
                                <td align="center" colspan="2"><H3>DETROIT - LOGIN</H3></td>
                            </tr>
                        <tr><td colspan="2"><br /></td></tr>
                            <tr>
                                <td align="left">
                                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName"><h5>Usuario:</h5></asp:Label>
                                </td>
                                <td>
                                    &nbsp&nbsp<asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="O Nome do Usuário é obrigatório." ToolTip="O Nome do Usuário é obrigatório." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password"><h5>Senha:</h5></asp:Label>
                                    </td>
                                    <td>
                                        &nbsp&nbsp<asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="A senha é obrigatória." ToolTip="A senha é obrigatória." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                    </td>
                            </tr>
                           
                            <tr>
                                <td align="center" colspan="2">
                                    <asp:CheckBox ID="RememberMe" text="&nbsp" runat="server"/> &nbsp Lembrar na proxima vez
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2" style="color:Red;">
                                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False" Text="Usuário e/ou Senha Incorretos!" Visible="False"></asp:Literal>
                                </td>
                            </tr>
                    
                            <tr>
                                <td align="center" colspan="2">
                                    <asp:Button ID="LoginButton" runat="server" CommandName="Login" CssClass="btn btn-outline-primary" Text="Entrar" ValidationGroup="Login1" OnClick="LoginButton_Click" />
                                </td>
                            </tr>
                  
                        </table>
        </LayoutTemplate>
    </asp:Login>
<div class="clear">
    <asp:HiddenField ID="hashgen" runat="server"/>
    <asp:SqlDataSource ID="loginsql" runat="server" ConnectionString="<%$ ConnectionStrings:testeConnectionString %>" SelectCommand="SELECT login, senha FROM login WHERE login = @login AND senha = @senha">
        <SelectParameters>
            <asp:ControlParameter ControlID="Login1" Name="login" PropertyName="UserName" Size="30" Type="String" />
            <asp:ControlParameter ControlID="hashgen" Name="senha" PropertyName="Value" />
        </SelectParameters>
    </asp:SqlDataSource>
        <asp:SqlDataSource ID="TipoLoginSql" runat="server" ConnectionString="<%$ ConnectionStrings:testeConnectionString %>" SelectCommand="SELECT tipo_login.nome FROM login INNER JOIN tipo_login ON login.tipo_login = tipo_login.Id WHERE login.login = @login">
            <SelectParameters>
                <asp:ControlParameter ControlID="Login1" Name="login" PropertyName="UserName" />
            </SelectParameters>
    </asp:SqlDataSource>
        </div>
</div>
    
    </div>
</asp:Content>

