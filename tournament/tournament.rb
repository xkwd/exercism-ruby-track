class Tournament
  def initialize(input)
    @input = input
    @teams = {}
  end

  def self.tally(input)
    new(input).tally
  end

  def tally
    identify_teams
    calculate_points
    print_output
  end

  private

  attr_reader :input, :teams

  def identify_teams
    input.scan(/\w* \w*/).uniq.each do |team|
      teams[team] = { 'MP': 0, 'W': 0, 'D': 0, 'L': 0, 'P': 0 }
    end
  end

  def calculate_points
    input.split("\n").each do |match|
      results = match.split(';')
      teams[results[0]][:MP] += 1
      teams[results[1]][:MP] += 1
      case results.last
      when 'win'
        teams[results[0]][:W] += 1
        teams[results[0]][:P] += 3
        teams[results[1]][:L] += 1
      when 'loss'
        teams[results[0]][:L] += 1
        teams[results[1]][:W] += 1
        teams[results[1]][:P] += 3
      when 'draw'
        teams[results[0]][:D] += 1
        teams[results[0]][:P] += 1
        teams[results[1]][:D] += 1
        teams[results[1]][:P] += 1
      end
    end
  end

  def print_output
    output = "Team                           | MP |  W |  D |  L |  P\n"

    teams.sort_by { |k, v| [-v[:P], k] }.each do |team|
      output += "#{team[0].ljust(30)} |  #{teams[team[0]][:MP]} |  "\
                "#{teams[team[0]][:W]} |  #{teams[team[0]][:D]} |  "\
                "#{teams[team[0]][:L]} |  #{teams[team[0]][:P]}\n"
    end

    output
  end
end
