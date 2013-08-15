<!DOCTYPE html>
<html class="webstore-html">
  <head>
    <style type="text/css">@media print {  .gm-style .gmnoprint, .gmnoprint {    display:none  }}@media screen {  .gm-style .gmnoscreen, .gmnoscreen {    display:none  }}</style>
    <meta http-equiv="content-type" content="text/html;charset=UTF-8">
    <meta name="description" content="We are doing rental van that known as &quot;Van Sewa di Kuala Lumpur&quot;">
    <title>Rental van in Kuala Lumpur - Payment</title>
    <link id="css" href="/css/main.css" rel="stylesheet">
    <link id="font" href="http://fonts.googleapis.com/css?family=Syncopate" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="https://apis.google.com/js/plusone.js">
      {"parsetags": "explicit"}
    </script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
  </head>
  <body class="webstore-body">
    <div id="webstore-doc" class="webstore-doc">
      <div id="webstore-header" class="webstore-header" style="min-height: 120px;">
        <div class="webstore-panel">
          <div class="webstore-panel-decorator-content">
            <div class="webstore-content-group">
              <table width="100%" class="webstore-content-group-table">
                <tbody>
                  <tr>
                    <td valign="top" class="webstore-content-group-table-td webstore-bulletin-type-td" width="100%">
                      <div class="webstore-content-decorator-top"></div>
                      <div class="webstore-content">
                        <div class="webstore-page-bulletin">
                          <h1 style="color: rgb(255, 102, 0);">Rental van in Kuala Lumpur</h1>
                          <p>
                            <font color="#ffffff"><b><font color="#66ffff">Cheapest Van / Car Rental in Kuala Lumpur Is Guarantied ..!!</font></b></font>
                          </p>
                          <p><br/></p>
                          <p>
                            <div style="float: right; padding-left: 8px;">
                              <div id="googleplusicon"></div>
                            </div>
                            <img class="img-right-inline" style="display: inline; float: right;" src="/images/car-rental.gif" height="50" width="284">                            
                          </p>
                          <p><br/></p>
                          <div class="clear"></div>
                        </div>
                      </div>
                      <div class="webstore-content-decorator-bottom"></div>
                    </td>
                  </tr>
                </tbody>
              </table>
              <div class="webstore-content-group-decorator-bottom"></div>
            </div>
            <div class="webstore-panel-decorator-bottom"></div>
          </div>
        </div>
      </div>
      <div class="webstore-main-corners"></div>
      <div id="webstore-main" class="webstore-main" style="min-height: 500px;">
        <div id="webstore-main-center" class="webstore-main-center no_sidebar">
          <div class="webstore-panel">
            <div class="webstore-panel-decorator-content">
              <div class="webstore-content-group">
                <table width="100%" class="webstore-content-group-table">
                  <tbody>
                    <tr>
                      <td valign="top" class="webstore-content-group-table-td webstore-bulletin-type-td" width="100%">
                        <div class="webstore-content-decorator-top"></div>
                        <div class="webstore-content">
                          <div class="webstore-page-bulletin" style="padding-top: 20px;">
                            <%
                            String status = request.getParameter("Status");
                            String statusResult = "Fail";
                            if( com.ssniwa.common.Constant.RESP_STATUS_SUCCESS.equals(status) ) {
                                statusResult = "Success";
                            }
                            %>
                            <font color="#FF6666" style="font-weight: bold;" size="6">Payment Status: <%=statusResult%></font><br/><br/>
                            <font color="#66ffff">
                            <%
                            if( com.ssniwa.common.Constant.RESP_STATUS_SUCCESS.equals(status) ) {
                            %>
                            Congratulation! Your payment has been successfully processed at payment gateway.
                            <%  
                            }
                            else {
                            %>
                            Oops. There is a problem to process your payment.<br/>
                              <%
                              String errDesc = request.getParameter("ErrDesc");
                              if( errDesc != null && !errDesc.equals("") ) {
                              %>
                              Payment gateway responded error: <br/>
                              <%=errDesc%>
                              <%
                              }
                              %>
                            <%  
                            }
                            %>
                            </font>
                            <div class="clear"></div>
                          </div>
                        </div>
                        <div class="webstore-content-decorator-bottom"></div>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
          <div class="webstore-panel">
            <div class="webstore-panel-decorator-content">
              <div class="webstore-content-group">
                <table class="webstore-content-group-table">
                  <tbody>
                    <tr>
                      <td valign="top" class="webstore-content-group-table-td webstore-bulletin-type-td" width="100%">
                        <div class="webstore-content-decorator-top"></div>
                        <div class="webstore-content">
                          <%
                          if( com.ssniwa.common.Constant.RESP_STATUS_SUCCESS.equals(status) ) {
                          %>
                          <div class="webstore-payment">
                            <table style="width: 900px;">
                              <tbody>
                                <tr>
                                  <td class="webstore-payment-message-td">Amount (MYR):</td>
                                  <td class="webstore-payment-input-td">
                                  <%= request.getParameter("Amount") == null ? "" : request.getParameter("Amount") %>
                                  </td>
                                </tr>
                                <tr>
                                  <td class="webstore-payment-message-td">Transaction ID:</td>
                                  <td class="webstore-payment-input-td">
                                  <%= request.getParameter("TransId") == null ? "" : request.getParameter("TransId") %>
                                  </td>
                                </tr>
                                <tr><td><div style="min-height:20px;"></div></td><td></td></tr>
                              </tbody>
                            </table>
                          </div>
                          <%
                          }
                          %>
                          <div style="margin: 30px 0 0 0;">
                            <a href="/payment" style="color: #66ffff;">Back to Payment page</a>
                          </div>
                        </div>
                        <div class="webstore-content-decorator-bottom"></div>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
          
        </div>
      </div>
      <div class="webstore-main-corners"></div>
      <div id="webstore-footer" class="webstore-footer">
        <div class="webstore-panel">
          <div class="webstore-panel-decorator-top"></div>
          <div class="webstore-panel-decorator-content">
            <div class="webstore-content-group">
              <div class="webstore-content-group-decorator-top"></div>
              <table width="100%" class="webstore-content-group-table">
                <tbody>
                  <tr>
                    <td valign="top" class="webstore-content-group-table-td webstore-bulletin-type-td" width="100%">
                      <div class="webstore-content-decorator-top"></div>
                      <div class="webstore-content">
                        <div class="webstore-page-bulletin">Copyright 2012 SSNiwa SDN.BHD<br>
                          <div class="clear"></div>
                        </div>
                      </div>
                      <div class="webstore-content-decorator-bottom"></div>
                    </td>
                  </tr>
                </tbody>
              </table>
              <div class="webstore-content-group-decorator-bottom"></div>
            </div>
          </div>
          <div class="webstore-panel-decorator-bottom"></div>
        </div>
      </div>
    </div>
    <ins style="position: absolute !important; background-color: transparent !important; left: 986px !important; top: 104px !important; width: 32px !important; height: 20px !important; z-index: -10000 !important; display: none !important;"></ins>
  </body>
  <script type="text/javascript">
    jQuery(document).ready(function(){
      gapi.plusone.render("googleplusicon", {
        "href": "http://www.rentalvan.com.my",
        "size": "medium"
      });
    });
  </script>
</html>