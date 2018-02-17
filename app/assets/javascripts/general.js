document.addEventListener('turbolinks:load', function() {
    $.validator.addMethod("rut", function(value, element) {
        return this.optional(element) || $.Rut.validar(value);
    }, "Este campo debe ser un rut valido.");
    $.validator.methods.email = function( value, element ) {
        return this.optional( element ) || /[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-z]+/.test( value );
    }

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
    $('.rut_validacion').Rut();
	$.fn.select2.defaults.set( "theme", "bootstrap" );
	$(".select2, .select2-multiple").select2({
		width: null
	});
});