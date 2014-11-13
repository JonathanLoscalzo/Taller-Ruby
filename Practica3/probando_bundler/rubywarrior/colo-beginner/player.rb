class Player
  def play_turn(warrior)
    	if warrior.feel.empty? 
    		warrior.walk!
    	else
    		warrior.attack!
    		warrior.feel
    	end
  end
end
