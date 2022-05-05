require "csv"
  
  puts "メモ記録を開始します。保存先のファイル名を拡張子を除いて入力してください。"
  file_name = gets.chomp
  puts "--------------"
  puts "ファイル名：" + "#{file_name}.csv"
  puts "--------------"
  puts "実行する内容を０または１で選択してください" 
  puts "0,新規でメモを作成"
  puts "1,既存のメモを編集する"
  puts "--------------"
  input_number = gets.chomp.to_i

if input_number === 0
  puts "選択：#{input_number}"
  puts"新規でメモを作成します。メモの内容を記入して下さい。Ctrl+Dで保存します。"
  puts "--------------"
    CSV.open("#{file_name}.csv" , "w") do |csv|
      imput_memo = STDIN.read
      memo = imput_memo.chomp
      csv.puts ["#{memo}"]
    end
    puts "\n--------------"
    CSV.foreach("#{file_name}.csv") do |all|
      puts "\n#{all}"
    end
  puts "\n--------------"
  puts "メモを保存しました"
elsif input_number === 1
  puts "選択：#{input_number}"
  puts"既存のメモを編集します。メモの内容を記入して下さい。Ctrl+Dで保存します。"
  puts "--------------"
    CSV.open("#{file_name}.csv","a") do |csv|
      imput_memo = STDIN.read
      memo = imput_memo.chomp
      csv.puts ["#{memo}"]
    end
    puts "\n--------------"
    CSV.foreach("#{file_name}.csv") do |all|
      puts "\n#{all}"
    end
  puts "\n--------------"
  puts "メモを保存しました"
else
  puts "０または１を選択してください。はじめからやり直してください。"
end