# Pet Tracking Application

## Requirements

- Ruby
- Rails

## Setup

```bash
bundle install
rails server
```

## API Endpoints

### Add Pet Data

POST /pets

```bash
curl -X POST http://localhost:3000/pets -d '{"pet": {"pet_type": "Dog", "tracker_type": "small", "owner_id": 1, "in_zone": false}}' -H 'Content-Type: application/json'
```

### Retrieve All Pets

GET /pets

```bash
curl http://localhost:3000/pets
```

### Retrieve Pets Outside Power Saving Zone

GET /pets/outside_zone

```bash
curl http://localhost:3000/pets/outside_zone
```

## Test

```bash
rspec
```