json.array!(@answers) do |answer|
  json.extract! answer, :need_id, :memo, :plan_on
  json.url answer_url(answer, format: :json)
end