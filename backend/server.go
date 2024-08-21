package main

import (
	"crypto/tls"
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
			log.Println("Received OPTIONS request")
			w.WriteHeader(http.StatusOK)
			return
		}
		next.ServeHTTP(w, r)
	})
}

func messageHandler(w http.ResponseWriter, r *http.Request) {
	log.Println("Received request on /sendmail endpoint")

	if r.Method == http.MethodPost {
		log.Println("Processing POST request")
		var user User

		err := json.NewDecoder(r.Body).Decode(&user)
		if err != nil {
			log.Printf("Error decoding JSON: %v", err)
			http.Error(w, err.Error(), http.StatusBadRequest)
			return
		}
		user.Email = strings.ToLower(user.Email)

		log.Printf("Decoded JSON: FirstName: %s, LastName: %s, Email: %s, Message: %s", user.FirstName, user.LastName, user.Email, user.Message)

		err = sendEmail("savirp1905@gmail.com", user.Email, "Hi "+user.FirstName+" "+user.LastName, "We received the following message. We will be looking into it and get back to you shortly: "+user.Message)
		if err != nil {
			log.Printf("Error sending email: %v", err)
			http.Error(w, "Error sending email", http.StatusInternalServerError)
			return
		}

		log.Printf("Email sent successfully to %s", user.Email)
		w.WriteHeader(http.StatusOK)
		w.Write([]byte("Email sent successfully"))

	} else {
		log.Printf("Invalid request method: %s", r.Method)
		http.Error(w, "Invalid request method", http.StatusMethodNotAllowed)
	}
}

func sendEmail(from string, to string, subject string, body string) error {
	password := "wdqk tdot bdxk laep"

	log.Printf("Preparing to send email from %s to %s with subject %s", from, to, subject)

	msg := gomail.NewMessage()
	msg.SetHeader("From", from)
	msg.SetHeader("To", to)
	msg.SetHeader("Subject", subject)
	msg.SetBody("text/plain", body)

	log.Println("Setting up SMTP dialer")
	dialer := gomail.NewDialer("smtp.gmail.com", 587, from, password)
	dialer.TLSConfig = &tls.Config{InsecureSkipVerify: true}

	log.Println("Attempting to send email")
	err := dialer.DialAndSend(msg)
	if err != nil {
		log.Printf("Error sending email to %s: %v", to, err)
		return err
	}

	log.Printf("Email sent successfully to %s", to)
	return nil
}

func main() {
	log.Println("Starting server on port 3000")

	http.HandleFunc("/sendmail", messageHandler)

	srv := &http.Server{
		Addr:    ":3000",
		Handler: enableCors(http.DefaultServeMux),
	}
	log.Println("Server is running on port 3000")

	log.Fatal(srv.ListenAndServe())
}
