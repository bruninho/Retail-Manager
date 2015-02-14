json.array!(@employees) do |employee|
  json.extract! employee, :id, :fname, :lname, :store, :dob, :basic_rop, :sunday_bh_rop, :email, :date_joined
  json.url employee_url(employee, format: :json)
end
