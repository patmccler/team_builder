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
- [TODO] Every model contains at least at least two simple attributes (e.g. ingredient#quantity)
memberships need more...
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
- [ ] Includes Unit tests all of your models
- [ ] Includes at least one type of Integration test (e.g. controller, request, feature, system)
- [ ] Use FactoryBot to build instances of your models in your tests
- [ ] Conforms to Nitro Ruby linting rules (running `rubocop` returns 0 offenses)
- [ ] Includes a `README.md` with an application description and installation guide

Confirm:
- [ ] The application is pretty DRY
- [ ] Limited logic in controllers
- [ ] Views use helper methods if appropriate
- [ ] Views use partials if appropriate

If you've added any additional functionality to your application that you'd like to demonstrate, please describe it below: