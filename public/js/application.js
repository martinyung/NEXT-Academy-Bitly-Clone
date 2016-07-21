function getCount() {
	$.ajax({
		url:'/count',
		dataType: 'json',
		type: 'GET',
		success: function(data) {
			$('#count').html(data)
		}
	});
}

$(document).ready(function() {
	setInterval(function(){getCount()}, 3000);
	$("form").on('submit', function(event) {
		event.preventDefault();
		$.ajax({
			cache: false,
			url: '/urls',
			dataType: 'JSON',
			type: 'POST',
			data: $(this).serialize(),
			success: function(data) {
				if (data.shortened_url == null) {
					$('#result').html(data);
					$('#result').addClass('red');
			} else {
					$('#result').html("<a href='" + data.shortened_url + "'>" + data.shortened_url + "</a>");
				}
			}
		})
	})

	$('button').click(function() {
		$('.table').toggle('slow');
	});
})

