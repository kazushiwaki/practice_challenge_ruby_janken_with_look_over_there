module DisplayHelper
  def prompt_choices
    puts "0: グー, 1: チョキ, 2: パー"
    print "あなたの選択を入力してください: "
  end

  def display_choices(player_choice, computer_choice)
    puts "あなたの選択: #{player_choice}"
    puts "コンピューターの選択: #{computer_choice}"
  end

  def display_result(result)
    if result == "勝ち"
      puts "おめでとうございます！あなたの勝ちです！"
    elsif result == "負け"
      puts "残念！コンピューターの勝ちです。"
    else
      puts "引き分けです！"
    end
  end

  def display_invalid_input
    puts "無効な入力です。0〜2の数字を入力してください。"
  end

  def display_attimuite_hoi(winner_direction, loser_direction, winner)
    if winner == "player"
      puts "あなた: #{winner_direction}"
      puts "コンピュータ: #{loser_direction}"
    else
      puts "コンピュータ: #{winner_direction}"
      puts "あなた: #{loser_direction}"
    end
  end

  def display_ascii_art
    puts <<~ART

        /\_/\    ／￣￣￣￣￣￣￣￣￣￣￣￣＼
      ( o.o ) ＜  遊んでくれてありがとう！ |
       > ^ <    ＼＿＿＿＿＿＿＿＿＿＿＿＿／

    ART
  end
end
