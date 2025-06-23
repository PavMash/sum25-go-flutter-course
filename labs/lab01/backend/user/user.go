package user

import (
	"errors"
	"strconv"
	"strings"
)

// Predefined errors
var (
	ErrInvalidName  = errors.New("invalid name: must be between 1 and 30 characters")
	ErrInvalidAge   = errors.New("invalid age: must be between 0 and 150")
	ErrInvalidEmail = errors.New("invalid email format")
)

// User represents a user in the system
type User struct {
	Name  string
	Age   int
	Email string
}

// NewUser creates a new user with validation
func NewUser(name string, age int, email string) (*User, error) {
	if name == "" {
		return nil, ErrEmptyName
	}
	if 0 > age || 150 < age {
		return nil, ErrInvalidAge
	}
	if !IsValidEmail(email) {
		return nil, ErrInvalidEmail
	}

	newUser := User{
		Name:  name,
		Age:   age,
		Email: email,
	}

	return &newUser, nil
}

// Validate checks if the user data is valid.
func (u *User) Validate() error {
	if u.Name == "" {
		return ErrEmptyName
	}
	if 0 > u.Age || 150 < u.Age {
		return ErrInvalidAge
	}
	if !IsValidEmail(u.Email) {
		return ErrInvalidEmail
	}
	return nil
}

// String returns a string representation of the user, formatted as "Name: <name>, Age: <age>, Email: <email>"
func (u *User) String() string {
	var strRepr = "Name = " + u.Name +
		", Age = " + strconv.Itoa(u.Age) + ", Email = " + u.Email
	return strRepr
}

// NewUser creates a new user with validation, returns an error if the user is not valid
func NewUser(name string, age int, email string) (*User, error) {
	// TODO: Implement this function
	return nil, nil
}

// IsValidEmail checks if the email format is valid
// You can use regexp.MustCompile to compile the email regex
func IsValidEmail(email string) bool {
	return strings.Contains(email, "@") && strings.Contains(email, ".")
}

// IsValidAge checks if the age is valid, returns false if the age is not between 0 and 150
func IsValidAge(age int) bool {
	// TODO: Implement this function
	return false
}
