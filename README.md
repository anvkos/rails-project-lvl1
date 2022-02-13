### Hexlet tests and linter status:
[![Actions Status](https://github.com/anvkos/rails-project-lvl1/workflows/hexlet-check/badge.svg)](https://github.com/anvkos/rails-project-lvl1/actions)
[![CI](https://github.com/anvkos/rails-project-lvl1/actions/workflows/main.yml/badge.svg?event=push)](https://github.com/anvkos/rails-project-lvl1/actions/workflows/main.yml)

### Examples

```ruby
user = User.new name: 'rob', job: 'hexlet'

HexletCode.form_for user do |f|
  f.input :name
  f.input :job, as: :text
  f.submit
end

# <form action="#" method="post">
#   <label for="name">Name</label>
#   <input name="name" type="text" value="rob">
#   <label for="job">Job</label>
#   <textarea cols="20" rows="40" name="job">hexlet</textarea>
#   <input name="commit" type="submit" value="Save">
# </form>
```