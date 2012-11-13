function remainingCharacters(textarea,counterElement,itemsCountElement,availChars,txt1,txt2)  {
		var message = textarea.value;
		var usedChars = message.length;
		var nrOfMessages = 1;

		var _m = "\n"; // pattern to match.
		var _c = 0; // count
		

		
		for (var i=0;i<message.length;i++) {
		if (_m == message.substr(i,_m.length))
		 _c++;
		}
		usedChars = usedChars + _c;
		
		if(usedChars > 150){		

			
			if (usedChars < 300){
				nrOfMessages = 2;
			}
			
			if (usedChars >299 ){
				nrOfMessages = 3;
			}		
			
			availChars = availChars * nrOfMessages;
		}
		
		if(itemsCountElement != null && itemsCountElement.length > 0 ){
		document.getElementById(itemsCountElement).innerHTML = txt2+": " + nrOfMessages;
		}
		
		if (usedChars > availChars)  {
			//document.getElementById(counterElement).innerHTML = 0;
			textarea.value = message.substring(0,availChars);
		} else {
			
			//alert(availChars +' ' + message.length)
			document.getElementById(counterElement).innerHTML = txt1+ " " + (availChars - message.length);
			
		}
	}
	
	
function append(tableId,itemId,changedValue) {	

	//alert(changedValue+', '+itemId+', '+tableId);
	
	var fieldName = "cbs_"+tableId;
	
	if (changedValue == 'checked') {	//add element if it's not there allready	
	var csv = document.getElementById(fieldName).value;
		if (csv.indexOf(itemId + ";") == -1) {			
			csv = csv + itemId + ";";
			document.getElementById(fieldName).value = csv;			
			}
	}
	else if (changedValue == 'unchecked')  { // remove element
	var csv = document.getElementById(fieldName).value;
	var value = itemId + ";";	
		if (csv.indexOf(value) > -1) {
		
		var elBegin = csv.indexOf(value);
		var elEnd = csv.indexOf(";", elBegin + 1);
		//alert(elBegin + ", " + elEnd);
		var csv = csv.substring(0,elBegin) + csv.substring(elEnd +1,csv.length);
		document.getElementById(fieldName).value = csv;
		}	
	}
	
	try {
		if(document.getElementById(fieldName).value.length > 0){
		
		document.getElementById("text_panel_top").style.display = "block";
		document.getElementById("text_panel_mid").style.display = "block";
		document.getElementById("text_panel_bottom").style.display = "block";
		
		
		} else {
			document.getElementById("text_panel_top").style.display = "none";
			document.getElementById("text_panel_mid").style.display = "none";
			document.getElementById("text_panel_bottom").style.display = "none";
		
		}
	
	} catch (e) {
	//alert(e);	
	}
}


var needToConfirm = false;
var confirmationMsg = "You have unsaved changes.";


function setConfirmationMsg(message) {
	confirmationMsg = message;
}

function askConfirm(){
	if (needToConfirm){
		return confirmationMsg;
		}    
	}

function setConfirmTrue(){
needToConfirm = true;
//alert(needToConfirm);
}

function setConfirmFalse(){
needToConfirm = false;
//alert(needToConfirm);
}

/*
function showEmailFree(selection){
	
var emailFree = document.getElementById("emailFree").value;


	if ( emailFree.length > 0 && selection == null) {		
		// select last option in select
	document.getElementById("emailaddress").selectedIndex = 2;

	} 
		

var itemName =  document.getElementById("emailaddress").value;
	
	if ((itemName != null && itemName == "freeFromAddress") || emailFree.length > 0) {

		document.getElementById("freeFromAddress").style.display = "block";
		}  
		
		
	if (itemName != null && itemName != "freeFromAddress") {
			
	
			document.getElementById("emailFree").value = "";
			document.getElementById("fromNameFree").value = "";
			
			document.getElementById("freeFromAddress").style.display = "none";
		}
		

}


function showPhonenumberFree(selection){
	
var fromNameFree = document.getElementById("fromNameFree").value;


	if ( fromNameFree.length > 0 && selection == null) {		
		// select last option in select
	document.getElementById("phonenumberFree").selectedIndex = 1;

	} 
		

var itemName =  document.getElementById("phonenumber").value;
	
	if ((itemName != null && itemName == "freeFromAddress") || fromNameFree.length > 0) {

		document.getElementById("freeFromAddress").style.display = "block";
		}  
		
		
	if (itemName != null && itemName != "freeFromAddress") {
			
	
			document.getElementById("fromNameFree").value = "";
			
			document.getElementById("freeFromAddress").style.display = "none";
		}
		

}
*/

function setGroupId(id){
	
	try {
	document.getElementById(id).checked = true;

	// have to do this because popup needs to be in another form
	document.getElementById("groupId"). document.getElementById(id).value;
		} catch (e){
	}	
}


// script for import mapping


function dropdownChange(element)
{
    clearColorSelect()  ;
      
	$("select.mappingSelect").each(
	function() 
	{
  
		if(this != element)
	    {
			
      		if(this.selectedIndex == element.selectedIndex)
      		{
      			this.selectedIndex = 0;
      		}
      	}
      	
      	if(this.selectedIndex != 0)
      	{
      		setColorSelect(this.selectedIndex); 	
      	}
    }
    );
}

function clearColorSelect()
{
	$("select.mappingSelect").each(function() 
	{
		for(var i = 0; i < this.options.length; i++)
	    {
	    	$(this.options.item(i)).removeClass("green");
	    }
	 }
	 );
}

function setColorSelect(i)
{
	$("select.mappingSelect").each(
	function() 
	{
		$(this.options.item(i)).addClass("green");	
	}
	);
}


function insertAtCursor(myField, myValue) {
			//IE support
			if (document.selection) {
			myField.focus();
			sel = document.selection.createRange();
			sel.text = myValue;
			}
			//MOZILLA/NETSCAPE support
			else if (myField.selectionStart || myField.selectionStart == 0) {
			var startPos = myField.selectionStart;
			var endPos = myField.selectionEnd;
			myField.value = myField.value.substring(0, startPos)
			+ myValue
			+ myField.value.substring(endPos, myField.value.length);
			} else {
			myField.value += myValue;
			}
	}
	
function setCbValue(id, element){
	
	//document.getElementById(id).checked = true;
	
	if(element.checked){
		document.getElementById(id).value = 'true';
	} else {
		document.getElementById(id).value = 'false';	
	}
	
	//alert("value is: "+document.getElementById(id).value);
	
}


function enableField(id){	

		document.getElementById(id).disabled = false;
		//document.form1.address2.disabled=false;

}

	function removeQuotes(element) {
		if(jQuery(element).val().indexOf('\'' > -1)){	
		jQuery(element).val(jQuery(element).val().replace('\'',''));
		} 
		
		if(jQuery(element).val().indexOf('\"' > -1)){	
		jQuery(element).val(jQuery(element).val().replace('\"',''));
		}
	
	}
	
function selectOrDeselectAll(checkboxElement,partOfID){	


if(checkboxElement.checked){
	dojo.query('input[id ^='+partOfID+']').attr('checked',true);
	

		//jQuery('#allOrSelectionSelection').attr('checked',true);
	
	}
	else{
		dojo.query('input[id ^='+partOfID+']').attr('checked',false);
		
		//jQuery('#allOrSelectionAll').attr('checked',true);
		
		}

}


 function insertAtCursor(fieldId, myValue) {
 
 			
 			var myField = document.getElementById(fieldId);
			
		
			//IE support
			if (document.selection) {
				//alert('ie');
				
			myField.focus();
			sel = document.selection.createRange();
			sel.text = myValue;
			
			
	
			}
			//MOZILLA/NETSCAPE support
			else if (myField.selectionStart || myField.selectionStart == 0) {
				
				//alert('moz');

			var startPos = myField.selectionStart;
			var endPos = myField.selectionEnd;
			myField.value = myField.value.substring(0, startPos)
			+ myValue
			+ myField.value.substring(endPos, myField.value.length);
			} else {
				//alert('moz');
			myField.value += myValue;
			}
	}
	
	
	function floatImage(imageWidth) {	
	
	 $('[id^="editImage"]').fadeIn('medium', function() {
		// Animation complete.
	  });
	  
	  //$('#contentMarginFull').css('width',imageWidth + 400);

	}
	
	
	function fadeImages(){	
	
	  $(".imageListThumbs").fadeIn('fast', function() {

	  });

	}
	
	