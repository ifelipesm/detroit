$(function(){

	var words = ['Sistema de Informação - 3º Período | UNIPAC-TO'];
	var indexWord = 0;
	var indexChar = 0;
	var interval;

	var elInput = $('#bg-home input[type=text]'); 
	elInput.focus();
	$(window).scrollTop(0);

	run();

	function run(){
		interval = setInterval(function(){
				if(indexChar < words[indexWord].length){
					indexChar++;
					elInput.val(words[indexWord].substr(0,indexChar));
				}else if(indexWord < words.length-1){
					indexWord++;
					indexChar = 0;
				}else{
					indexWord = 0;
					indexChar = 0;
				}
		},150);
	}


})