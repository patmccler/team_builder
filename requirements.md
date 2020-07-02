# Specifications for the Rails Assessment

Add notes below each checkbox with how your application has met the requirement

Requirements:
- [x] Uses Ruby on Rails
yes
- [x] Includes at least one has_many relationship (e.g. User has_many Recipes)
User has many teams, and others
- [x] Includes at least one belongs_to relationship (e.g. Post belongs_to User)
team belongs to user, roster belongs to game
- [x] Includes at least two has_many through relationships (e.g. a `Recipe` could `has_many` `Item`s through `Ingredient`s)
team has units through team_membership, roster has units through roster_membership
- [QUESTION???] Every model contains at least at least two simple attributes (e.g. ingredient#quantity)
Do I need this on my join tables? I dont have a view or any other way to see them...
Order numbered on roster? Seeding? Other stats around pick order
- [x] Includes reasonable validations
no duplicates, no empty values
- [x] Includes a class level ActiveRecord scope method
both units have a scope for units that are in a roster with a given unit (is this class level?)
- [x] Includes signup, login and logout functionality (e.g. Devise)
implemented manually
- [x] Includes nested resource show or index (e.g. users/2/recipes)
/roster/:id/warcraft_units
- [x] Includes nested resource form (recipes/1/ingredients/new)
Team/edit has field_for team_memberships, editing all the units on the team at once
/roster/:id/warcraft_units/new
- [x] Includes form display of validation errors
all forms should show errors in page
- [x] Includes Unit tests all of your models
- [x] Includes at least one type of Integration test (e.g. controller, request, feature, system)
- [x] Use FactoryBot to build instances of your models in your tests
- [x] Conforms to Nitro Ruby linting rules (running `rubocop` returns 0 offenses)
- [ ] Includes a `README.md` with an application description and installation guide

Confirm:
- [x] The application is pretty DRY
  Moved duplicated code into modules or parent classes when possible
- [x] Limited logic in controllers
UnitsController#create has more than I'd like
Also the shared UnitsController for Wow and TFT, was there a better way to handle that?
- [x] Views use helper methods if appropriate
Logic in views delegates to helpers if its more than a one liner
- [x] Views use partials if appropriate
Use partials for most index views and for new/edit forms

If you've added any additional functionality to your application that you'd like to demonstrate, please describe it below:
- Implemented Units as polymorphic at Garett's suggestion
  - Should be able to add new unit types by adding a model, controller, and views
  - Should immediately be able to put them into a game, and then into a team
  - controller needs to pass some class specific things( path, class name, symbol for params)
  - different unit types can then have different attributes, or even join to other tables(if I get to implementing it)
  - allows teams to display different collections of info based on whats relevant to that game
- Rosters and units are has_many: through roster_membership because I was going to implement moving a unit between rosters but didnt get to it yet
- Factory for roster_membership was neat to implement.
  - polymorphic relationship needs trait with allow choice of association
  - because that polymorphically related model needs to have the same 'game' as the 'roster', had to go through a call back
  - to still accept a unit if passed, had to use a transient attribute. Default to false, in which case generate a unit with the right game from the roster in the callback. Otherwise set given unit if given
- Polymorphic joins table between teams/roster and WarcraftUnits vs TFTUnits
  - 95% of model was repeated, moved to module and used self.included(base) to put all the shared validations/relations in one file. I bet theres a cleaner way to do it but I had to break it up weirdly to make rubocop happy
  - Similarly, controllers were almost the same for both. Instead of a module, I put the logic in a parent controller, and had both WarcraftUnit and TFTUnit inherit from it. Then, I could assing ivars or pass values with super for the controller action. Again, curious how to better handle this. It felt pretty clean but seems against the typical controller pattern