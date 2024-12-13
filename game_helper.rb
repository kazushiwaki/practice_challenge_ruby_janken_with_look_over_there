require_relative 'display_helper'

module GameHelper
  include DisplayHelper

  CHOICES = ["グー", "チョキ", "パー"]

  def judge(player_choice, computer_choice)
    winning_combinations = {
      "グー" => "チョキ",
      "チョキ" => "パー",
      "パー" => "グー"
    }

    if player_choice == computer_choice
      "引き分け"
    elsif winning_combinations[player_choice] == computer_choice
      "勝ち"
    else
      "負け"
    end
  end

  def play_attimuite_hoi(winner)
    puts "あっち向いてホイ！"
    directions = ["上", "下", "左", "右"]

    if winner == "player" # プレイヤーがじゃんけんに勝った場合
      player_direction = get_player_direction(directions) # プレイヤーが指を指す
      computer_direction = directions.sample # コンピューターが顔を向ける
      display_attimuite_hoi(player_direction, computer_direction, winner)
      player_direction == computer_direction
    else # プレイヤーがじゃんけんに負けた場合
      computer_direction = directions.sample # コンピューターが指を指す
      player_direction = get_player_direction(directions) # プレイヤーが顔を向ける
      display_attimuite_hoi(computer_direction, player_direction, winner)
      player_direction == computer_direction
    end
  end
end
