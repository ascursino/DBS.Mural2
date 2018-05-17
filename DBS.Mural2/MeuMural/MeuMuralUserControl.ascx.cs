/* 
                          Desenvolvido por DBS IT Services
                         http://www.dbsitservices.com.br
                                     
           Copyright 2011 DBS IT Services © Todos os direitos reservados 

 Este aquivo contém código fonte de aplicativo desenvolvido pela DBS IT Services. 
 É expressamente proibida a alteração, distribuição ou venda desses arquivos sem 
 aprovação  formal da DBS IT Services e do cliente contratante desse serviço sob
 proteção da legislação vigente.
 
*/

using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.SharePoint;
using System.Text;

namespace DBS.Mural2.MeuMural
{
    public partial class MeuMuralUserControl : UserControl
    {
        private const String NOME_PAGINA_MSG = "/_layouts/DBS.Mural2/ExibeMensagem.aspx";

        private String montaListaMensagens(uint quantidadeMax)
        {
             using (SPWeb oWebsiteRoot = SPContext.Current.Site.RootWeb)
            {

                var web = SPContext.Current.Web;
                StringBuilder sb = new StringBuilder();
                var listMsgs = web.Lists["Mural de Mensagens"];

                 //carrega as últimas mensagens de acordo com a quantidade limite definida
                var query = new SPQuery
                {
                    Query = "<Query><Where><Gt><FieldRef Name=\"ID\" /><Value Type=\"Counter\">0</Value></Gt></Where><OrderBy><FieldRef Name=\"Created\" Ascending=\"False\" /></OrderBy></Query>",
                    RowLimit = quantidadeMax
                };
                var newMsgsCol = listMsgs.GetItems(query);
                sb.AppendLine("<ul>");

                //monta cada LI
                foreach (SPListItem msg in newMsgsCol)
                {
                    String link = "<a class=\"a_" + msg["TipoMensagem"].ToString() + "\" href=\"#\" onClick=\"openDialog('" + oWebsiteRoot.Url + NOME_PAGINA_MSG + "?idMensagem=" + msg["ID"].ToString() + "')\" >";

                    sb.Append("<li class=\"li_" + msg["TipoMensagem"].ToString() + "\">");
                    sb.Append(link);
                    sb.Append(msg["Title"].ToString());
                    sb.Append("</a>");
                    sb.AppendLine("</li>");
                }

                sb.AppendLine("</ul>");
                return sb.ToString();
            }
        }                                                                               

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Literal1.Text = montaListaMensagens(10);
            }
            catch (Exception)
            {                
                throw;
            }            
        }
    }
}
