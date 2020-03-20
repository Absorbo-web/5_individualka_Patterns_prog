# frozen_string_literal: true

$checkBool = TRUE
$trueList = []
$minSumm = 99999999999

def check(numberList, ostatokList)
  temp_number = numberList
  temp_ostatok = ostatokList
  # puts ostatokList
  ostatokList.each do |j|
    numberList += [j]
    ostatokList -= [j]
    summ = numberList.inject(0) { |result, elem| result + elem }
    summ1 = ostatokList.inject(0) { |result, elem| result + elem }
    if summ == summ1
      $checkBool = FALSE
    end
    if summ < summ1 and numberList.size > ostatokList.size
      $checkBool = FALSE
    end
    if summ > summ1 and numberList.size < ostatokList.size
      $checkBool = FALSE
    end
    if $checkBool
      check(numberList, ostatokList)
    end
    numberList = temp_number
    ostatokList = temp_ostatok
  end
end

# эта процедура будет удалять всевозможные элементы
def delete_item(ostatokList)
  temp_ostatok = ostatokList
  b = []
  check(b, ostatokList)
  ostatokList.each do |j|
    ostatokList -= [j]
    delete_item(ostatokList)
    ostatokList = temp_ostatok
  end
end

def unucum(ostatokList)
  ostatokList.sort
  (1...ostatokList.size).each do |i|
    return FALSE if ostatokList[i - 1] == ostatokList[i]
  end
  TRUE
end
# составляет всевозможные комбинации чисел

def creater(ostatokList)
  temp_ostatok = Array.new(ostatokList)
  $checkBool = TRUE
  if unucum(temp_ostatok)
    print temp_ostatok
    puts
    delete_item(temp_ostatok)
    print temp_ostatok if $checkBool
  end
  i = temp_ostatok.length - 1
  while i >= 0 do
    if temp_ostatok[i] < 30
      temp_ostatok[i] += 1
      creater(temp_ostatok)
    end
    i -= 1
  end
end

def lol(i,ostatokList)
  i = i + 1
  temp = Array.new(ostatokList)
  if i < ostatokList.count-1
    lol(i,temp)
    temp2 = Array.new(ostatokList)
    (temp2[i]...30).each do
      temp2[i] += 1
      temp3 = Array.new(temp2)
      lol(i,temp3)
      print temp2
      puts
    end
  else
    (ostatokList[i]...30).each do
      ostatokList[i] += 1
      print ostatokList
      puts
    end
  end
end

ostatokList = [1, 2, 3, 4, 5, 6, 7]
print ostatokList
lol(-1,ostatokList)
# creater(ostatokList)
