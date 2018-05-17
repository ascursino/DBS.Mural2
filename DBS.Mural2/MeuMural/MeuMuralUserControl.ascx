<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MeuMuralUserControl.ascx.cs" Inherits="DBS.Mural2.MeuMural.MeuMuralUserControl" %>

<script type="text/javascript">

    function openDialog(_url) {

        var options =
        {
            url: _url,
            width: 600,
            height: 340,
            title: "Mensagem"
        };

        SP.UI.ModalDialog.showModalDialog(options);
    }

</script>

<SharePoint:CssRegistration ID="CssRegistration1" runat="server" Name="/_layouts/DBS.Mural2/Mural.css"></SharePoint:CssRegistration>

<asp:Literal ID="Literal1" runat="server" 
    Text="Lista Mensagens do Mural"></asp:Literal>