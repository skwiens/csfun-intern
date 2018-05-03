def rotate_90(matrix)
  transpose = transpose(matrix)
  rotated = reverse_columns(transpose)
  return rotated
end

def transpose(matrix)
  i = 0
  while i <= matrix.length - 1 do
    j = i
    while j <= matrix.length - 1 do
      temp = matrix[i][j]
      matrix[i][j] = matrix[j][i]
      matrix[j][i] = temp
      j += 1
    end
    i += 1
  end
  return matrix
end

def reverse_columns(matrix)
  # p matrix
  i = 0
  while i < matrix.length do
    k = matrix.length - 1
    j = 0
    while j <= k do
      temp = matrix[k][i]
      matrix[k][i] = matrix[j][i]
      matrix[j][i] = temp
      k -= 1
      j += 1
    end
    i += 1
  end
  return matrix
end

range = (1..16)
array = range.to_a
matrix = array.each_slice(4).to_a

rotate_90(matrix)
