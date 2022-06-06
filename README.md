# Loyalty program practical example

At it's most basic, the platform offers clients the ability to issue loyalty points to their end users.
End users use their points to claim/purchase rewards offered by the client.

## Point Earning Rules

**Level 1**

1. For every $100 the end user spends they receive 10 points

**Level 2**

1. If the end user spends any amount of money in a foreign country they receive 2x the standard points

## Issuing Rewards Rules

**Level 1**

1. If the end user accumulates 100 points in one calendar month they are given a Free Coffee reward

**Level 2**

1. A Free Coffee reward is given to all users during their birthday month
2. A 5% Cash Rebate reward is given to all users who have 10 or more transactions that have an amount > $100
3. A Free Movie Tickets reward is given to new users when their spending is > $1000 within 60 days of their first transaction

## Loyalty Rules

**Level 1**

1. A standard tier customer is an end user who accumulates 0 points
2. A gold tier customer is an end user who accumulates 1000 points
3. A platinum tier customer is an end user who accumulates 5000 points

**Level 2**

1. Points expire every year
2. Loyalty tiers are calculated on the highest points in the last 2 cycles
2. Give 4x Airport Lounge Access Reward when a user becomes a gold tier customer
3. Every calendar quarterly give 100 bonus points for any user spending greater than $2000 in that quarter

## Evaluation

You are expected to create a git repository (in github or equivalent) and share the repository details with us.
The way you manage your commits is up to you, but we would like to have the opportunity to see how is
your workflow like.
Your code will be evaluated more on the quality than on completing the scope.
Our production environment is a high volume environment, we are required to maintain data integrity and performance throughout.
Please provide appropriate tests.

# Sample output

******** TRANSACTION ********
{:user=>"e9d65600-93c8-4c3d-82bb-57edac4a4260", :currency=>"usd", :amount=>100, :date=>"2022-01-01", :amount_in_usd=>100, :points_multiplier=>1}
********
==================
{:commulative_points=>10, :monthwise_points=>{"2022-01"=>10}}
{:monthwise_rewards=>{}}
Birthday coffee: false
******** TRANSACTION ********
{:user=>"e9d65600-93c8-4c3d-82bb-57edac4a4260", :currency=>"usd", :amount=>1000, :date=>"2022-02-01", :amount_in_usd=>1000, :points_multiplier=>1}
********
==================
{:commulative_points=>110, :monthwise_points=>{"2022-01"=>10, "2022-02"=>100}}
{:monthwise_rewards=>{"2022-02"=>{:free_coffee=>1}}}
Birthday coffee: false
******** TRANSACTION ********
{:user=>"e9d65600-93c8-4c3d-82bb-57edac4a4260", :currency=>"usd", :amount=>1000, :date=>"2022-02-01", :amount_in_usd=>1000, :points_multiplier=>1}
********
==================
{:commulative_points=>210, :monthwise_points=>{"2022-01"=>10, "2022-02"=>200}}
{:monthwise_rewards=>{"2022-02"=>{:free_coffee=>1}}}
standard_tier
Birthday coffee: false
******** TRANSACTION ********
{:user=>"e9d65600-93c8-4c3d-82bb-57edac4a4260", :currency=>"usd", :amount=>10000, :date=>"2022-02-01", :amount_in_usd=>10000, :points_multiplier=>1}
********
==================
{:commulative_points=>1210, :monthwise_points=>{"2022-01"=>10, "2022-02"=>1200}}
{:monthwise_rewards=>{"2022-02"=>{:free_coffee=>1}}}
gold_tier
Birthday coffee: false
******** TRANSACTION ********
{:user=>"e9d65600-93c8-4c3d-82bb-57edac4a4260", :currency=>"sgd", :amount=>10000, :date=>"2022-03-01", :amount_in_usd=>7000, :points_multiplier=>2}
********
==================
{:commulative_points=>2610, :monthwise_points=>{"2022-01"=>10, "2022-02"=>1200, "2022-03"=>1400}}
{:monthwise_rewards=>{"2022-02"=>{:free_coffee=>1}, "2022-03"=>{:free_coffee=>1}}}
gold_tier
Birthday coffee: false
******** BEGINNING OF MONTH JOB TO CHECK BIRTHDAY REWARD ********
MONTHLY TRIGGER
MONTHLY TRIGGER
MONTHLY TRIGGER
==================
{:commulative_points=>2610, :monthwise_points=>{"2022-01"=>10, "2022-02"=>1200, "2022-03"=>1400}}
{:monthwise_rewards=>{"2022-02"=>{:free_coffee=>1}, "2022-03"=>{:free_coffee=>1}}}
gold_tier
Birthday coffee: true


# Learning

* Should've avoided making multiple rule enginer and rather than should've focus on having custom triggers for rules
* SHould've use array for store rewards
* Should've created separate classes for each type of rewards