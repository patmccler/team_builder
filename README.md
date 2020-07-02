# README

## Installation guide
  - Clone this git repo
  - run `bundle exec rake db:migrate` and optionally `bundle exec rake db:seed`
  - navigate to localhost:3000
  - login as `pat` with password `password` or create a new user
    - alternately, `admin` with password `admin`

## App Description
This app is a tool to create and manage teams for various games. Currently supports World of Warcraft and Team fight tactics.

In World of Warcraft, group members offer various buffs that affect the performance of the whole team. One of the major aspects of putting a strong team together is covering many or all of the available buffs the classes can provide.
When you create a team, accessable from the "My Teams" link in the nav bar, you see which buffs your team currently has access to, and a list of buffs you are missing out on.
  - Buffs don't typically stack with themselves. Two different classes may provide the same buff, but it would only help the team the first time.
Another aspect of teambuilding is roles. Typically you want 2 tanks, some damage dealers, and enough healers to keep everyone alive.
  - this information is also displayed on the team listing

In Team Fight Tactics (TFT), you essentially collect units and they buff each other depending on certain groups they belong to. So instead of seeing buffs on your TFT team, you see how many of which groups you have.
These groupings belong to two categories, which I called affiliation and combat style.
  - eg: If you have 3 members who have a combat style of "Blademaster", in the game they do more damage
    - If you have 3 units that belong to the "Rebel" affiliation, they all gain some health at the start of the fight
    - So you could have 2 units that are both a blademaster and a rebel, one unit that is a rebel and some other combat style, and a fourth who is a blademaster and some other affiliation.
      - in this example, you'd have 3 blade masters and 3 rebels, gaining both buffs
      - need to add support for thresholds - not ever grouping benefits at the same count of buffs
      - You are allowed duplicate units, but they do not count twice toward your bonus threshold. This is implemented.

This is the basis of the user facing side. You pick a roster for your team, and set how many units you want on your team. Then you see the provided info based on the units you picked.

An admin can create new rosters, or copy from old ones.
This represents the games being updated, and the available units changing. (Need to implement removing units from a team)
When you copy a roster, the same units have memberships added to that roster, so its possible to track how long a unit has been unchanged (in terms of game updates).

You can create a new game, but that probably needs to be refactored out. Really, each game corresponds to a unit_type and creating a new game doesn't provide anything a new roster would.

You can create a fresh roster and only include limited units, or units from the game at different stages.
  - for example, WoW currently runs a "classic" server, with the game as it was when it first launched. Units typically aren't removed from the game, but their functionality changes drastically. They may not offer the same buffs from patch to patch, hence the need to create separate rosters.