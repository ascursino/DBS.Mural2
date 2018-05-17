using System;
using Microsoft.SharePoint;
using Microsoft.SharePoint.WebControls;
using Microsoft.SharePoint.Administration;
using System.Threading;
using System.Text;

namespace DBS.Mural2.Layouts.DBS.Mural2
{
    public partial class ExibeMensagem : LayoutsPageBase
    {
        private int idMensagem;
        private const String FLAG_RESPOSTA = "RE: ";
        private SPWeb oWebsiteRoot;
        private SPListItem msg;

        protected void Page_Load(object sender, EventArgs e)
        {
            oWebsiteRoot = SPContext.Current.Site.RootWeb;

            idMensagem = int.Parse(Request.QueryString["idMensagem"].ToString());

            String strRemetente;
            SPList lstMural = oWebsiteRoot.Lists["Mural de Mensagens"];
            msg = lstMural.Items.GetItemById(idMensagem);
            strRemetente = msg["Author"].ToString().Substring(msg["Author"].ToString().IndexOf("#") + 1);
            lblNomeRemetente.Text = strRemetente;
            carregaMensagemEmTela();
        }

        private void carregaMensagemEmTela()
        {
            lblTituloMensagem.Text = msg["Title"].ToString();
            lblMensagem.Text = msg["Mensagem"].ToString();
            
            //Para evitar o erro de excesso de caracteres no título (máx 256)
            String novoTitulo = "RE: " + lblTituloMensagem.Text;
            if (novoTitulo.Length>256)
            {
                richTxtMensagemResposta.Text = "Atenção, o tamanho do título excedeu o limite de caracteres. Não será possível responder. Crie nova mensagem com título menor";
                btnEnviar.Enabled = false;
            }

        }


        private void Responder(int idMensagemOriginal)
        {
            try
            {
                SPList lstMural = oWebsiteRoot.Lists["Mural de Mensagens"];
                SPListItem novoItem;

                novoItem = lstMural.Items.Add();
                novoItem["Title"] = "RE: " + lblTituloMensagem.Text;
                novoItem["Mensagem"] = richTxtMensagemResposta.Text;
                novoItem["Destinatario"] = msg["Author"];                       //o primeiro problema era aqui
                novoItem["TipoMensagem"] = "Aniversario";

                novoItem.Update();
            }
            catch (Exception ex)
            {
                lblMensagem.Text = ex.ToString();
            }

            //fecho a janela
            ClientScript.RegisterClientScriptBlock(this.GetType(), Guid.NewGuid().ToString(), "CloseForm();", true);

        }          

        protected void btnResponder_Click(object sender, EventArgs e)
        {            
            Responder(idMensagem);
        }

        protected void btnSair_Click(object sender, EventArgs e)
        {
            if (SPContext.Current.IsPopUI)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), Guid.NewGuid().ToString(), "CloseForm();", true);
            }
        }
    }
}