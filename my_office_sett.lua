function column_row_numbers(column_str)
  local column_num = 0
  column_str = string.upper(column_str)
  local order = 0
  for i = #column_str, 1, -1 do
    local elem = column_str:sub(i,i)
    local is_num = tonumber(elem)
    if is_num == nil then 
      column_num = column_num + order * (string.byte(elem) - 64) * 25 + string.byte(elem) - 64
      order = order + 1
    end
  end
  row_num = tonumber(column_str:sub(order + 1))
  return column_num, row_num
end

function column_row_str(column_num, row_num)
  local while_block = 0
  local address_str = ""
  while column_num > 26 and while_block < 9 do
    new_num = math.fmod(column_num, 26)
    address_str = address_str .. string.char(new_num + 64)
    column_num = math.modf(column_num / 26)
    while_block = while_block + 1
  end
  address_str = address_str .. string.char(column_num + 64)
  address_str = address_str .. row_num
  return address_str
end

print(column_row_numbers("bb35"))

print(column_row_str(54, 1))