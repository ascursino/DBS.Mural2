<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Import Namespace="Microsoft.SharePoint.ApplicationPages" %>
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ExibeMensagem.aspx.cs" Inherits="DBS.Mural2.Layouts.DBS.Mural2.ExibeMensagem" DynamicMasterPageFile="~masterurl/default.master" %>

<asp:Content ID="PageHead" ContentPlaceHolderID="PlaceHolderAdditionalPageHead" runat="server">

<script type="text/javascript">

    //Close popup on cancel button click

    function CloseForm() {

        window.frameElement.cancelPopUp();
        return false;

    }
    
</script>


</asp:Content>

<asp:Content ID="Main" ContentPlaceHolderID="PlaceHolderMain" runat="server">


<table>

    <tr>
        <td>
            <asp:Label ID="Label1" runat="server" Text="Remetente:" CssClass="coluna1"></asp:Label>
        </td>
        <td>
            <asp:Label ID="lblNomeRemetente" runat="server" Text="{Remetente}"></asp:Label>
        </td>
        <td rowspan="2">
            <%--<img alt="" id="ImagemMensagemAniversario" src="" />--%>
        </td>
    </tr>

    <tr>
        <td>
            <asp:Label ID="Label2" runat="server" Text="Título:" CssClass="coluna1"></asp:Label>
        </td>
        <td>
            <asp:Label ID="lblTituloMensagem" runat="server" Text="{Título}"></asp:Label>            
        </td>
    </tr>
    
    <tr>
        <td>
            <asp:Label ID="Label3" runat="server" Text="Mensagem:" CssClass="coluna1"></asp:Label>
        </td>
        <td>
            <asp:Label ID="lblMensagem" runat="server" Text="{msg}" CssClass="lblMsg"></asp:Label>          
        </td>
    </tr>

    
    <tr>
        <td>
            <asp:Label ID="Label6" runat="server" Text="Responder:" CssClass="coluna1"></asp:Label>
        </td>
        <td>
            <SharePoint:InputFormTextBox ID="richTxtMensagemResposta" runat="server" 
                TextMode="MultiLine" Rows="8"
                RichTextMode="FullHtml" RichText="true" Width="500px"></SharePoint:InputFormTextBox>
        </td>
        <td>
        </td>
    </tr>
    
    <tr>
        <td colspan="3">
            <asp:Button ID="btnSair" runat="server" Text="Sair" OnClick="btnSair_Click"/>
            <asp:Button ID="btnEnviar" runat="server" Text="Enviar" OnClick="btnResponder_Click"/>
        </td>
    </tr>

</table>


</asp:Content>

<asp:Content ID="PageTitle" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
Application Page
</asp:Content>

<asp:Content ID="PageTitleInTitleArea" ContentPlaceHolderID="PlaceHolderPageTitleInTitleArea" runat="server" >
My Application Page
</asp:Content>
