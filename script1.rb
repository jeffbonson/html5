
$(document).ready(function(){

    localStorage.setItem('items_count_in_cart', 0);
    localStorage.setItem('amount_in_cart', 0);
    localStorage.setItem("totalcount", 0);
    localStorage.setItem("grandtotal", 0);
		
		jQuery('totalitem').html(0)
		
	

		
	  
    var item1 = {
        id: 1,
        name: 'Ipad',
        price: '20000',
        remaining: '10',
        src: 'Mobile-Phones.jpg'
    };
		
		var item2 = {
        id: 2,
        name: 'Apple',
        price: '50000',
        remaining: '10',
        src: 'Mobile-Phones.jpg'
    };
    var item3 = {
        id: 3,
        name: 'Blackburry',
        price: '15000',
        remaining: '10',
        src: 'Mobile-Phones.jpg'
    };
		
    var item4 = {
        id: 4,
        name: 'Sony',
        price: '60000',
        remaining: '10',
        src: 'Mobile-Phones.jpg'
    };
		
		
    var item5 = {
        id: 5,
        name: 'Samsung',
        price: '12000',
        remaining: '10',
        src: 'Mobile-Phones.jpg'
    };
		
    var list = new Array(item1, item2, item3, item4,item5);
		
		
		
		
		
		
		$.each(list, function(index, value){
			
        var list_item = ""
        list_item = "<div class='item' id='item_" + value.id + "'><itemname>" + value.name + "</itemname><price>" + value.price + "</price><remitem>" + value.remaining + "</remitem><buy><input type='button' value='Add to Cart' class='add_to_cart' data-id=" + value.id + "></div>"
        jQuery("list").append(list_item)
				
				$('#items_datalist').append("<option value='" + value.name + "'>");
    });
    
    jQuery("totalitem").html(localStorage.getItem("totalcount"))
    jQuery("grandtotal").html(localStorage.getItem("grandtotal"))
    
    
    
    $(".add_to_cart").live("click", function(){
        jQuery(".dialog").show();
        
        item_id = parseInt(jQuery(this).data('id')) - 1;
        jQuery("#temp_id").html(list[item_id].id);
        jQuery("#temp_name").html(list[item_id].name);
        jQuery("#temp_price").html(list[item_id].price);
        
        jQuery("#temp_remaining").html(list[item_id].remaining);
        qty = 1 //initialy one 1 item
        
        jQuery("#temp_qty").val(qty);
				
        total = qty * parseInt(list[item_id].price)
        jQuery("#temp_total").html(total);
        
        add_item_to_cart(item_id, total, qty)
				
				increment_cart_count()
				
				add_to_grand_total_in_cart(total);
				
				
				
		});


		
    
    function add_item_to_cart(item_id, total, qty){
        total = qty * parseInt(list[item_id].price)
        cart = "<div class='selected_item' id=selected_item_" + list[item_id].id + "><div class='item_name'>" + list[item_id].name + "</div><div class='item_price'>" + list[item_id].price + "</div>" + "<div class='item_quantity'>" + qty + "</div>" + "<div class='item_total'>" + total + "</div><div class='item_buy_from_cart'><input type='button' data-id=" + list[item_id].id + " data-qty=" + qty + " value='Buy' data-total=" + total + " class='buy_from_cart'></div><div class='item_cancel'><input type='button' data-id=" + list[item_id].id + " data-qty=" + qty + " value='X' data-total=" + total + " class='remove'></div></div>"
        jQuery('.cart_list').prepend(cart)
				item_details = [list[item_id].id,list[item_id].name,list[item_id].price,qty,total]
				
				
    }
		
		function increment_cart_count(){
        item_incr = parseInt(localStorage.getItem('items_count_in_cart')) + 1;
        jQuery('totalitem').html(item_incr)
        localStorage.setItem('items_count_in_cart', item_incr);
    }
		
		function decrement_cart_count()
		{
			items_in_cart_count = parseInt(localStorage.getItem('items_count_in_cart'))
			//alert(items_in_cart_count)
			item_decr = items_in_cart_count - 1;
      jQuery('totalitem').html(item_decr)
      localStorage.setItem('items_count_in_cart', item_decr);
		}
		
    function remove_item(item_id, item_total, qty){
        jQuery('#selected_item_' + item_id).remove()
    }
    
    
    $("#temp_qty").change(function(){
        price = parseInt(jQuery("#temp_price").html());
        
        qty = parseInt(jQuery("#temp_qty").val());
        rem = parseInt(jQuery("#temp_remaining").html());
        
        if (qty <= rem) {
        
            if (qty == 0) {
            
                jQuery("#temp_qty").val(1);
                alert('atlest 1 qty required')
            }
            else {
                item_total = price * qty
								
								jQuery("#temp_total").html(item_total);
                
                item_id = parseInt(jQuery("#temp_id").html());
								
								remove_item(item_id, item_total, qty)
								
								decrement_cart_count()
								
								substract_in_grand_total_in_cart(total)
								
								add_item_to_cart(item_id - 1, item_total, qty)
								
								increment_cart_count()
								
                add_to_grand_total_in_cart(item_total)
            }
        }
        else {
            alert('items not available')
        }
        
        
    });
    
    $("closedialog").live("click", function(){
        jQuery(".dialog").hide();
        jQuery("#temp_name").html('');
        jQuery("#temp_price").html('');
        jQuery("#temp_qty").html('');
        jQuery("#temp_total").html('');
    });
    
    
    jQuery(".buy_item").live("click", function(){
			if (confirm("Are you sure you want to buy this item?")) 
			{
	  	
			item_id = parseInt(jQuery("#temp_id").html());
			total = parseInt(jQuery("#temp_total").html());
			qty = parseInt(jQuery("#temp_qty").val())
			
			name = jQuery("#temp_name").html();
	  	price = parseInt(jQuery("#temp_price").html());
	  	remaining = parseInt(jQuery("#temp_remaining").html()) - qty;
	  	
	  	jQuery('#item_' + item_id + ' remitem').html(remaining)
	  	
	  	jQuery(".dialog").hide();
	  	
	  	jQuery('#selected_item_' + item_id).remove()
	  	
	  	remove_item(item_id, total, qty)
	  	
	  	decrement_cart_count()
	  	
	  	substract_in_grand_total_in_cart(total)
	  	
	  	move_to_purchased(item_id - 1, total, qty)
	  }
        
    });/*end of buy_item click*/
		
		jQuery(".buy_from_cart").live("click", function(){
        
				if (confirm("Are you sure you want to buy this item?")) {
					
					item_id = jQuery(this).data('id')
	        item_total = jQuery(this).data('total')
	        item_qty = jQuery(this).data('qty')
	        
	        remaining = parseInt(jQuery('#item_' + item_id + ' remitem').html())
	        remaining = remaining - parseInt(item_qty);
	        
	        
	        jQuery('#item_' + item_id + ' remitem').html(remaining)
	        
	        jQuery(".dialog").hide();
	        
	        jQuery('#selected_item_' + item_id).remove()
	        
	        remove_item(item_id, item_total,item_qty)
	        
	        decrement_cart_count()
	        
	        substract_in_grand_total_in_cart(item_total)
	        
	        move_to_purchased(item_id-1,total,item_qty)
		}
		else
		{
			//alert('cancel')
		}
				
        
    });/*end of buy_item click*/
		
		
		
		function move_to_purchased(item_id, total, qty){
        total = qty * parseInt(list[item_id].price)
        purchased = "<div class='selected_item' id=selected_item_" + list[item_id].id + "><div class='item_name'>" + list[item_id].name + "</div><div class='item_price'>" + list[item_id].price + "</div>" + "<div class='item_quantity'>" + qty + "</div>" + "<div class='item_total'>" + total + "</div></div>"
        jQuery('purchased').append(purchased)
    }
		
    jQuery(".remove").live("click", function(){
        item_id = jQuery(this).data('id')
        item_total = jQuery(this).data('total')
				item_qty = jQuery(this).data('qty')
				
				remove_item(item_id, item_total,qty)
				
				decrement_cart_count()
				
				substract_in_grand_total_in_cart(item_total)
    });
    
   
    
    function add_to_grand_total_in_cart(total){
    
        add_amt = parseInt(localStorage.getItem('amount_in_cart')) + total;
        //alert('gtot=' + add_amt)
        jQuery('grandtotal').html(add_amt)
        localStorage.setItem('amount_in_cart', add_amt);
    }
    
		function substract_in_grand_total_in_cart(total)
		{
			sub_amt = parseInt(localStorage.getItem('amount_in_cart')) - total;
        //alert('gtot=' + sub_amt)
        jQuery('grandtotal').html(sub_amt)
        localStorage.setItem('amount_in_cart', sub_amt);
		}
    
    jQuery(".continue_shopping").live("click", function(){
        jQuery(".dialog").hide();
    });
    
    
    jQuery(".clear_session_storage").click(function(){
			
			
    });/*end of remove*/
		
		
});
