# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
  @candidates.find{|candidate| candidate[:id] == id}
end

def experienced?(candidate)
  candidate [:years_of_experience] >= 2
end

def github_points(candidate)
  candidate [:github_points] >= 100
end

def languages_know(candidate)
  candidate [:languages].find {|language| [:languages] == "Ruby" || "Python"}
end

def age(candidate)
  candidate [:age] > 17
end

def time_ago (candidate)
  candidate [:date_applied] > (15.days.ago.to_date)
end

def qualified_candidates(candidates)
  candidates.select {|candidate| experienced?(candidate) && github_points(candidate) && languages_know(candidate) && age(candidate) && time_ago(candidate)}
end


def ordered_by_qualifications(candidates)
  candidates.sort { |a, b| [a[:years_of_experience], a[:github_points]] <=>
                           [b[:years_of_experience], b[:github_points]] }.reverse
end