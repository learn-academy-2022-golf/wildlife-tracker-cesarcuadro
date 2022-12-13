# README
# Wildlife Tracker Challenge
The Forest Service is considering a proposal to place in conservancy a forest of virgin Douglas fir just outside of Portland, Oregon. Before they give the go ahead, they need to do an environmental impact study. They've asked you to build an API the rangers can use to report wildlife sightings.

# Story 1: In order to track wildlife sightings, as a user of the API, I need to manage animals.

Branch: animal-crud-actions

Acceptance Criteria:

- Create a resource for animal with the following information: common name and scientific binomial ✅
rails generate resource Animals common_name:string scientific_binomial:string

- Can see the data response of all the animals
- Can create a new animal in the database ✅
3.0.0 :003 > Animal.all
  Animal Load (0.7ms)  SELECT "animals".* FROM "animals"
 =>                                                           
[#<Animal:0x000000011369f870                                  
  id: 1,                                                      
  common_name: "gray wolf",                                   
  scientific_binomial: "canis lupus",                         
  created_at: Tue, 13 Dec 2022 19:32:27.049925000 UTC +00:00, 
  updated_at: Tue, 13 Dec 2022 19:32:27.049925000 UTC +00:00>,
 #<Animal:0x000000011369f6b8                                  
  id: 2,                                                      
  common_name: "fox",                                         
  scientific_binomial: "vulpes vulpes",                       
  created_at: Tue, 13 Dec 2022 19:33:43.344618000 UTC +00:00, 
  updated_at: Tue, 13 Dec 2022 19:33:43.344618000 UTC +00:00>] 
- Can update an existing animal in the database ✅
  {"id":5,"common_name":"weasel","scientific_binomial":"mustela","created_at":"2022-12-13T19:57:51.505Z","updated_at":"2022-12-13T19:57:51.505Z"}
- Can remove an animal entry in the database
POSTMAN: Delete -> localhost:3000/animals/5
Deleted item:
{
    "id": 5,
    "common_name": "weasel",
    "scientific_binomial": "mustela",
    "created_at": "2022-12-13T19:57:51.505Z",
    "updated_at": "2022-12-13T19:57:51.505Z"
}

# Story 2: In order to track wildlife sightings, as a user of the API, I need to manage animal sightings.

Branch: sighting-crud-actions

Acceptance Criteria

Create a resource for animal sightings with the following information: latitude, longitude, date
Hint: An animal has_many sightings (rails g resource Sighting animal_id:integer ...)
Hint: Date is written in Active Record as yyyy-mm-dd (“2022-07-28")
Can create a new animal sighting in the database
Can update an existing animal sighting in the database
Can remove an animal sighting in the database

# Story 3: In order to see the wildlife sightings, as a user of the API, I need to run reports on animal sightings.

Branch: animal-sightings-reports

Acceptance Criteria

Can see one animal with all its associated sightings
Hint: Checkout this example on how to include associated records
Can see all the all sightings during a given time period
Hint: Your controller can use a range to look like this:
```ruby
class SightingsController < ApplicationController
  def index
    sightings = Sighting.where(date: params[:start_date]..params[:end_date])
    render json: sightings
  end
end
```
Hint: Be sure to add the start_date and end_date to what is permitted in your strong parameters method
Hint: Utilize the params section in Postman to ease the developer experience
Hint: Routes with params