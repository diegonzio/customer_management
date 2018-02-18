document.addEventListener('turbolinks:load', function() {
	$('.datetimepicker').datetimepicker({
		locale: 'es',
		icons: {
			time: 'fal fa-clock',
			date: 'fal fa-calendar',
			up: 'fal fa-chevron-up',
			down: 'fal fa-chevron-down',
			previous: 'fal fa-chevron-left',
			next: 'fal fa-chevron-right',
		}
	});
	$('.datepicker').datetimepicker({
		format: 'DD/MM/YYYY',
		locale: 'es',
		icons: {
			time: 'fal fa-clock',
			date: 'fal fa-calendar',
			up: 'fal fa-chevron-up',
			down: 'fal fa-chevron-down',
			previous: 'fal fa-chevron-left',
			next: 'fal fa-chevron-right',
		}
	});
	$('.datetimepicker_group_desde').datetimepicker({
		useCurrent: false,
		defaultDate: moment().toDate(),
		locale: 'es',
		icons: {
			time: 'fal fa-clock',
			date: 'fal fa-calendar',
			up: 'fal fa-chevron-up',
			down: 'fal fa-chevron-down',
			previous: 'fal fa-chevron-left',
			next: 'fal fa-chevron-right',
		}
	});
	$('.datetimepicker_group_hasta').datetimepicker({
		useCurrent: false,
		defaultDate: moment().add(30, 'm').toDate(),
		locale: 'es',
		icons: {
			time: 'fal fa-clock',
			date: 'fal fa-calendar',
			up: 'fal fa-chevron-up',
			down: 'fal fa-chevron-down',
			previous: 'fal fa-chevron-left',
			next: 'fal fa-chevron-right',
		}
	});
	$(".datetimepicker_group_desde").on("dp.change", function (e) {
		$(this).closest('.input-daterange').find('.datetimepicker_group_hasta').data("DateTimePicker").minDate(e.date);
		$(this).closest('.input-daterange').find('.datetimepicker_group_hasta').data("DateTimePicker").date(e.date.add(30, 'm').toDate());
	});
});