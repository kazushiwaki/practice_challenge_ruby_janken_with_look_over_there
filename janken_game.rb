require_relative 'game_helper'
require_relative 'display_helper'

class JankenGame
  include GameHelper
  include DisplayHelper

  def play
    puts "じゃんけんを始めます！"

    loop do
      player_choice = get_player_choice
      computer_choice = GameHelper::CHOICES.sample

      display_choices(player_choice, computer_choice)

      result = judge(player_choice, computer_choice)
      display_result(result)

      if result == "引き分け"
        puts "引き分けです！もう一度挑戦しましょう。"
        next
      end

      winner = result == "勝ち" ? "player" : "computer"
      loser = winner == "player" ? "computer" : "player"

      if play_attimuite_hoi(winner)
        puts "#{winner == 'player' ? 'あなた' : 'コンピュータ'}の完全勝利！ゲームを終了します。"
        display_ascii_art
        break
      else
        puts "方向が一致しませんでした。じゃんけんからやり直します！"
      end
    end
  end

  private

  def get_player_choice
    loop do
      prompt_choices
      input = gets.chomp.to_i

      if valid_input?(input)
        return GameHelper::CHOICES[input]
      else
        display_invalid_input
      end
    end
  end

  def valid_input?(input)
    input.between?(0, 2)
  end

  def get_player_direction(directions)
    loop do
      puts "0: 上, 1: 下, 2: 左, 3: 右"
      print "あなたの方向を選んでください: "
      input = gets.chomp.to_i

      if input.between?(0, 3)
        return directions[input]
      else
        puts "無効な入力です。0〜3の数字を入力してください。"
      end
    end
  end
end
