$(document).ready(function() {
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
					$(this).addClass('.message');
			} else {
					$('#result').html("<a href='" + data.shortened_url + "'>" + data.shortened_url + "</a>");
				}
			}
		})
	})
})

$(document).ready(function() {
	$('button').click(function() {
		$('.table').toggle('slow');
	});
});
