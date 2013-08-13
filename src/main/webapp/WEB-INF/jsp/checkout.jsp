<%
String merchantCode = (String)request.getAttribute("MerchantCode");
merchantCode = merchantCode == null ? "" : merchantCode;

String paymentId = (String)request.getAttribute("PaymentId");
paymentId = paymentId == null ? "" : paymentId;

String refNo = (String)request.getAttribute("RefNo");
refNo = refNo == null ? "" : refNo;

String amount = (String)request.getAttribute("Amount");
amount = amount == null ? "" : amount;

String currency = (String)request.getAttribute("Currency");
currency = currency == null ? "" : currency;

String prodDesc = (String)request.getAttribute("ProdDesc");
prodDesc = prodDesc == null ? "" : prodDesc;

String userName = (String)request.getAttribute("UserName");
userName = userName == null ? "" : userName;

String userEmail = (String)request.getAttribute("UserEmail");
userEmail = userEmail == null ? "" : userEmail;

String userContact = (String)request.getAttribute("UserContact");
userContact = userContact == null ? "" : userContact;

String remark = (String)request.getAttribute("Remark");
remark = remark == null ? "" : remark;

String lang = (String)request.getAttribute("Lang");
lang = lang == null ? "" : lang;

String signature = (String)request.getAttribute("Signature");
signature = signature == null ? "" : signature;

String responseURL = (String)request.getAttribute("ResponseURL");
responseURL = responseURL == null ? "" : responseURL;

String backendURL = (String)request.getAttribute("BackendURL");
backendURL = backendURL == null ? "" : backendURL;
%>
<!DOCTYPE html>
<html class="webstore-html">
  <head>
    <style type="text/css">@media print {  .gm-style .gmnoprint, .gmnoprint {    display:none  }}@media screen {  .gm-style .gmnoscreen, .gmnoscreen {    display:none  }}</style>
    <meta http-equiv="content-type" content="text/html;charset=UTF-8">
    <meta name="description" content="We are doing rental van that known as &quot;Van Sewa di Kuala Lumpur&quot;">
    <title>Rental van in Kuala Lumpur - Payment</title>
    <link id="css" href="/css/main.css" rel="stylesheet">
    <link id="font" href="http://fonts.googleapis.com/css?family=Syncopate" rel="stylesheet" type="text/css">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="/js/jquery.validate.min.js"></script>
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
                            <font color="#FF6666">
                              <font style="font-weight: bold;" size="6">Payment</font><br/><br/>
                              Please review the payment details before proceed.
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
                          <div class="webstore-payment">
                            <form id="payment_form" action="http://www.mobile88.com/epayment/entry.asp" method="post">
                              <input type="hidden" name="MerchantCode" value="<%=merchantCode%>" />
                              <input type="hidden" name="PaymentId" value="<%=paymentId%>" />
                              <input type="hidden" name="RefNo" value="<%=refNo%>" />
                              <input type="hidden" name="Amount" value="<%=amount%>" />
                              <input type="hidden" name="Currency" value="<%=currency%>" />
                              <input type="hidden" name="ProdDesc" value="<%=prodDesc%>" />
                              <input type="hidden" name="UserName" value="<%=userName%>" />
                              <input type="hidden" name="UserEmail" value="<%=userEmail%>" />
                              <input type="hidden" name="UserContact" value="<%=userContact%>" />
                              <input type="hidden" name="Remark" value="<%=remark%>" />
                              <input type="hidden" name="Lang" value="<%=lang%>" />
                              <input type="hidden" name="Signature" value="<%=signature%>" />
                              <input type="hidden" name="ResponseURL" value="<%=responseURL%>" />
                              <input type="hidden" name="BackendURL" value="<%=backendURL%>" />
                              <table style="width: 900px;">
                                <tbody>
                                  <tr>
                                    <td class="webstore-payment-message-td">Name:</td>
                                    <td class="webstore-payment-input-td">
                                      <%= userName %>                                      
                                    </td>
                                  </tr>
                                  <tr>
                                    <td class="webstore-payment-message-td">Phone:</td>
                                    <td class="webstore-payment-input-td">
                                      <%= userContact %>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td class="webstore-payment-message-td">Email:</td>
                                    <td class="webstore-payment-input-td">
                                      <%= userEmail %>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td class="webstore-payment-message-td">Amount (MYR):</td>
                                    <td class="webstore-payment-input-td">
                                      <%= amount %>
                                    </td>
                                  </tr>
                                  <tr><td><div style="min-height:20px;"></div></td><td></td></tr>
                                  <tr>
                                    <td colspan="2">
                                      <input type="submit" class="webstore-payment-button" value="Confirm" style="margin-left: 50px;" />
                                      <input type="button" class="webstore-payment-button" value="Cancel" style="margin-left: 20px;" />
                                    </td>
                                  </tr>
                                </tbody>
                              </table>
                            </form>
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
</html>