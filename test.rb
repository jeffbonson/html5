<!DOCTYPE>
<html>

<head>

<link href="style1.css" media="screen" rel="stylesheet" type="text/css">


<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>

<script type="text/javascript" src="script1.js"></script>




</head>

<body>

<header>
	<div class="search">
  <input list="items_datalist" class="items_datalist">
  <datalist id="items_datalist"></datalist>
  </div>
	
<div class="cartsummary">
	
Cart
<div><totalitem></totalitem> Items in Cart</div>
</div>
</header>
<list>
  <itemname>ItemName</itemname>
  <price>Price</price>
  <remitem>Remaining</remitem>
  <buy>Action</buy>
  
  
  
  
</list>

<cart class="cart_list">

<div class="selected_item selected_item_total">
<div class="item_name">GrandTotal</div>
<div class="item_price">&nbsp;</div>
<div class="item_quantity">&nbsp;</div>
<div class="item_total"><grandtotal></grandtotal></div>
<div class="item_cancel">&nbsp;</div>
</div>
</cart>

<purchased>
	<div>Purchased Item</div>
	
</purchased>

<div class="temp_selected" style="display:none;">
<div class="selected_item">
<div class="item_name"></div>
<div class="item_price"></div>
<div class="item_quantity">1</div>
<div class="item_total"></div>
<div class="item_cancel"><input type="button" value="X" class="remove"></div>
</div>
</div>



<div class="dialog">
<b>Confirm your purchase</b> <closedialog>X</closedialog>
<table>
<tr><td>Name</td><td>:</td><td><span id="temp_name"></span></td></tr>
<tr><td>Price</td><td>:</td><td><span id="temp_price"></span></td></tr>
<tr><td>Qty</td><td>:</td><td><input type="text" id="temp_qty" value="0"></span>/<span id="temp_remaining"></span></td></tr>
<tr><td>Total</td><td>:</td><td><span id="temp_total"></span></td></tr>
<tr><td></td><td><input type="submit"><input type='button' value='Buy' class="buy_item"><input type='button' value='Continue shopping' class="continue_shopping"></td></tr>
</table>
<span id="temp_id"></span>
</div>


<div style="float:left;width:100%;margin-top:20px;">
<input type="text" value='' id="in_cart_items_id">
<input type="button" value="clear_session_storage" class="clear_session_storage">
</div>

</body>

</html>
