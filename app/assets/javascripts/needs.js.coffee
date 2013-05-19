jQuery ($) ->
  $('.pick_date').datetimepicker
    format: 'yyyy-mm-dd',
    autoclose: true,
    minView: 2

  $('.answer_edit').click ->
    id = @id.split('_')[1]
    form = @form
    $.get("/needs/(・_・)/answers/#{id}.json").success (response) ->
      $("#answer_#{k}").val(v) for k, v of response
      original_action = $("#new_answer").attr("action")
      $("#new_answer").attr(action: "/needs/(・_・)/answers/#{id}")
      unless $("#new_answer input[name=_method]").get(0)
        method = $('<input>').attr(type: 'hidden', name: '_method').val('put')
        $("#new_answer").prepend(method)
