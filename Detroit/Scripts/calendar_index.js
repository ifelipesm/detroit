$(document).ready(function () {
    $('#calendar').eCalendar();
    $('#calendar').eCalendar({
	events: [
            //Date(Year,moth+1,day,hour,min)
	    {title: 'Dia Letivo', description: 'Aula de Renato', datetime: new Date(2019, 4, 31, 18,30)},
	    {title: 'Event Title 2', description: 'Description 2', datetime: new Date(2019,0, 23, 16)}
	]
});
});