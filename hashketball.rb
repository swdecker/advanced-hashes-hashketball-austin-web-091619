# Write your code here!
require 'pry'

def game_hash
  gh = { home: {team_name: "Brooklyn Nets", colors: ["Black","White"], players: [
    { :name => "",
      :number => 1,
      :shoe => 2,
      :points => 3,
      :rebounds => 3,
      :assists => 4,
      :steals => 5,
      :blocks => 6,
      :slam_dunks => 7,

    }]
  },
  away: {team_name: "Charlotte Hornets", colors: ["Turquoise","Purple"], players: [
    { :name => "",
      :number => 1,
      :shoe => 2,
      :points => 3,
      :rebounds => 3,
      :assists => 4,
      :steals => 5,
      :blocks => 6,
      :slam_dunks => 7,

    }]
  }
  }
  
  #format data from tables as arrays that we can map to the players array
  home_hash = {
            :name => ["Alan Anderson",	"Reggie Evans",	"Brook Lopez",	"Mason Plumlee",	"Jason Terry"],
            :number =>[	0,	30,	11,	1,	31],
            :shoe	=> [16,	14,	17,	19,	15],
            :points => [22,	12,	17,	26,	19],
            :rebounds =>	[12, 12,	19,	11,	2],
            :assists =>	[12,	12,	10,	6,	2],
            :steals =>	[3,	12,	3,	3,	4],
            :blocks =>	[1,	12,	1,	8,	11],
            :slam_dunks =>	[1,	7,	15,	5,	1]
            }
  away_hash = {
    :name => ["Jeff Adrien",	"Bismack Biyombo",	"DeSagna Diop",	"Ben Gordon",	"Kemba Walker"],
    :number => [	4,	0,	2,	8,	33],
    :shoe =>	[18,	16,	14,	15,	15],
    :points =>	[10,	12,	24,	33,	6],
    :rebounds =>	[1,	4,	12,	3,	12],
    :assists =>	[1,	7,	12,	2,	12],
    :steals =>	[2,	22,	4,	1,	7],
    :blocks =>	[7,	15,	5,	1,	5],
    :slam_dunks =>	[2,	10,	5,	0,	12]
  }
   
   #binding.pry
   home_players_array  = [{}]
   away_players_array = [{}]
   
   home_hash.each do |key, value|
     #put each team hash data set into the game hash data set
     #probably iterate through each value because it will be an array
     
     value.each_index do |index|
     #away_players_array[index] = {}
     #away_players_array[index][key] = away_hash[key][index]
     #if index==0
     #  gh[:away][:players][index] = {} 
     #end
     
     if !gh[:home][:players][index]
       gh[:home][:players][index]={}
     end
     #binding.pry
     gh[:home][:players][index][key] = home_hash[key][index]
     end
     
   end
   
   away_hash.each do |key, value|
     #put each team hash data set into the game hash data set
     #probably iterate through each value because it will be an array
     
     value.each_index do |index|
     #away_players_array[index] = {}
     #away_players_array[index][key] = away_hash[key][index]
     #if index==0
     #  gh[:away][:players][index] = {} 
     #end
     
     if !gh[:away][:players][index]
       gh[:away][:players][index]={}
     end
     #binding.pry
     gh[:away][:players][index][key] = away_hash[key][index]
     end
     
   end
  #binding.pry
  gh
end

def num_points_scored(name)
  points = 0
  game_hash.each do |location, team_data|
    
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |data_item|
          if data_item[:name] == name
            points = data_item[:points]
          end
        end
      end
    end
  end
  
  points 
end

def shoe_size(name)
  size = nil
  
  game_hash.each do |location, team_data|
    
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |data_item|
          if data_item[:name] == name
            size = data_item[:shoe]
          end
        end
      end
    end
  end
  size
end

def team_colors(team_name)
  colors = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team_name
      colors = team_data[:colors]
    end
  end
  colors
end

def team_names
  names = []
  game_hash.each do |location, team_data|
    names.push(team_data[:team_name])
  end
  names
end

def player_numbers(team_name)
  player_numbers = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team_name
      team_data.each do |attribute, data|
        if attribute == :players
          data.each do |data_item|
            player_numbers.push(data_item[:number])
          end
        end
      end
    end
  end
  player_numbers
end

def player_stats(name)
  stats = {}
  
  game_hash.each do |location, team_data|
    
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |data_item|
          if data_item[:name] == name
            #my hash has a name so trim it out by remaking stats
            data_item.each do |stat, value|
              if stat != :name
                stats[stat] = data_item[stat]
              end
            end
          end
        end
      end
    end
  end
  stats
end

def big_shoe_rebounds
  big_shoe = 0
  big_shoe_rebound = 0
  big_shoe_name = ""
  game_hash.each do |location, team_data|
    
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |data_item|
          if data_item[:shoe] > big_shoe
            big_shoe = data_item[:shoe]
            big_shoe_rebound = data_item[:rebounds]
            big_shoe_name = data_item[:name]
          end
        end
      end
    end
  end
  #binding.pry
  big_shoe_rebound
end
  
def most_points_scored
  scorer = ""
  most_points = 0
  game_hash.each do |location, team_data|
    
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |data_item|
          if data_item[:points] > most_points
            most_points = data_item[:points]
            scorer = data_item[:name]
          end
        end
      end
    end
  end
  #binding.pry
  scorer
end

def winning_team
  home_score = 0
  away_score = 0
  game_hash.each do |location, team_data|
    
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |data_item|
          if location == :home
            home_score += data_item[:points]
          else
            away_score += data_item[:points]
          end
        end
      end
    end
  end
  #binding.pry
  if home_score>away_score
    return game_hash[:home][:team_name]
  end
  game_hash[:away][:team_name]
end

def player_with_longest_name
  name_length = 0
  long_name = ""
  game_hash.each do |location, team_data|
    
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |data_item|
          if data_item[:name].length > name_length
            name_length = data_item[:name].length
            long_name = data_item[:name]
          end
        end
      end
    end
  end
  #binding.pry
  scorer
end
  
      

def good_practices
  game_hash.each do |location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
    #binding.pry
    
    #location can equal :home or :away
    #team data is a hash with 3 keys: :team_name, :colors, :players
    
    team_data.each do |attribute, data|
      #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
      #binding.pry
      #attribute is one of 3 keys: :team_name, :colors, :players
      #:players points to an array
 
      #what is 'data' at each loop throughout .each block? when will the following line of code work and when will it break?
      
      
      #this level should not be iterated, only for attribute =:players will data = an array
      
      if attribute == :players
        
        data.each do |data_item|
          
          #data_item is a hash of a players stats
          #binding.pry
        end
      end
      
    end
  end
end


good_practices






