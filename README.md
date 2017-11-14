# Resourceguru

**Simple cli for changing the text to obfuscated morse code**

## Installation

The app uses docker. You need to have docker and docker-compose installed to test the app. To build run:
```
$ docker-compose build
```

## Usage

```
$ docker-compose run --rm app ./resourceguru --in in-file --out out-file
```

## Testing

```
$ docker-compose run --rm app mix test
```
