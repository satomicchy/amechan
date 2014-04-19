jQuery ($) ->
  $('.pick_date').datetimepicker
    format: 'yyyy-mm-dd',
    autoclose: true,
    minView: 2

  $('.comment_edit').click ->
    id = @id.split('_')[1]
    form = @form
    $.get("/needs/(＾０＾)/comments/#{id}.json").success (response) ->
      $("#comment_#{k}").val(v) for k, v of response
      original_action = $("#new_comment").attr("action")
      $("#new_comment").attr(action: "/needs/(＾０＾)/comments/#{id}")
      unless $("#new_comment input[name=_method]").get(0)
        method = $('<input>').attr(type: 'hidden', name: '_method').val('put')
        $("#new_comment").prepend(method)
