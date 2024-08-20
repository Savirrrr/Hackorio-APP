package main

import (
	"encoding/json"
	"log"
	"net/http"
	"strings"

	"gopkg.in/gomail.v2"
)

type User struct {
	FirstName string `json:"firstname" bson:"firstname"`
	LastName  string `json:"lastname" bson:"lastname"`
	Email     string `json:"email" bson:"email"`
	Message   string `json:"message" bson:"message"`
}

func enableCors(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		w.Header().Set("Access-Control-Allow-Origin", "*")
		w.Header().Set("Access-Control-Allow-Methods", "POST, GET, OPTIONS, PUT, DELETE")
		w.Header().Set("Access-Control-Allow-Headers", "Content-Type, Authorization")
		if r.Method == "OPTIONS" {
			w.WriteHeader(http.StatusOK)
			return
		}
		next.ServeHTTP(w, r)
	})
}

func messageHandler(w http.ResponseWriter, r *http.Request) {
	if r.Method == http.MethodPost {
		var user User

		err := json.NewDecoder(r.Body).Decode(&user)
		if err != nil {
			log.Printf("Error decoding JSON: %v", err)
			http.Error(w, err.Error(), http.StatusBadRequest)
			return
		}
		user.Email = strings.ToLower(user.Email)

		log.Print("Received email %s", user.Email)

		err = sendEmail("Mymail", user.Email, "Hi"+user.FirstName+" "+user.LastName, user.Message)
		if err != nil {
			log.Printf("Error sending email: %v", err)
			http.Error(w, "Error sending email", http.StatusInternalServerError)
			return
		}

		log.Printf("Email sent successfully!")
		w.WriteHeader(http.StatusOK)
		w.Write([]byte("email sent"))

	} else {
		log.Printf("Invalid request method: %v", r.Method)
		http.Error(w, "Invalid request method", http.StatusMethodNotAllowed)
	}
}

func sendEmail(from string, to string, subject string, body string) error {
	password := "APP_PASSWORD"

	msg := gomail.NewMessage()
	msg.SetHeader("From", from)
	msg.SetHeader("To", to)
	msg.SetHeader("Subject", subject)
	msg.SetBody("text/plain", body)

	dailer := gomail.NewDialer("smtp.gmail.com", 587, from, password)

	err := dailer.DialAndSend(msg)
	if err != nil {
		log.Printf("Error sending email to %s: %v", to, err)
		return err
	}

	log.Printf("Email sent successfully to %s", to)
	return nil

}
