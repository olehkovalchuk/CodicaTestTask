# README

### Requirements
- Installed `ruby 3.2.1` or above ([how to install](https://www.ruby-lang.org/en/documentation/installation/ "how to install"))
- Installed `bundler gem`. For installation you should run `gem install bundler` command after `ruby` is installed

### Setup 
- Go to progect directory in console `cd /path/to/project`
- Run the next command `bin/rails s`

### Delivered features
- implemented admin panel with `ActiveAdmin gem`
- implemented authentication with `Devise gem`
- implemented authorization with `CanCanCan gem`
- implemented file storage on `Amazon S3` 
- Test coverage by `Rspec`

### Realized
##### admin abilities
- create categories
- create/update doctors
- view doctors and patients list
 ##### doctor abilities
- view the list of patients with appointments
- leave recommendations to appointments
##### patient abilities
- view the list of doctors by category
- create an appointment
- view doctors recommendations
##### validations
- phone validation
- category name for uniqueness validation
##### others
- limit of open doctor's appointments
- automatic closing appointments when recommendation is set

### Credentials
- ##### admin
    login: `+38(067)111-11-11`
     password: `password`
- ##### doctor
    login: `+38(067)222-22-22`
    password: `password`
- ##### patient
    login: `+38(067)333-33-33`
    password: `password`

### Prodiction:
- https://codica-test-task.herokuapp.com/