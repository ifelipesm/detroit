//t1 = window.setTimeout(function(){window.location = "principal.php";},2000);

$('.alert').on('closed.bs.alert',function(){
});


function validar_checkbox(form){
	if(!form.checkaluno.checked){
	alert("Selecione uma checkbox");
    form.checkaluno.focus();
    return false;
	}
	return true;
/*if($('div.checkbox-group.required :checkbox:checked').length > 0){return true;}
else{
	alert("Selecione uma checkbox!");
	return false;
}*/
}