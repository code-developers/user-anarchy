#!/usr/bin/env ruby

def generate_username1(name)
  name[0].strip.downcase
end

def generate_username2(first, last)
  return nil if last.empty?
  generate_username1(first) + last.gsub(/[^A-Za-z]/, '').downcase
end

def generate_username3(first, last, year)
  year_string = year.to_s
  return nil if year_string.lenght != 4
  generate_username2(first, last) + year_string[2,2]
end

$user_types = ["user", "seller", "manager", "admin"]

def check_privilege(type=0)
  $user_types[type]
end

def generate_username4(first, last, year, type=0)
  return generate_username3(first, last, year) if type == 0
  check_privilege(type) + "-" + generate_username3(first, last, year)
end

$users = []

def generate_username5(first, last, year)
  #generate a username
  user = generate_username4(first, last, year)
  unless $users.include?(user)
    $users << user
    return user
  end
  user_is_not_unique = true

  i = 1

  while user_is_not_unique do
    new_username = user + "-" + i.to_s
    i += 1

  end
end
