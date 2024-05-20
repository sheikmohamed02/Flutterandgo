package main

import (
	"encoding/json"
	"fmt"
	"net/http"
)

func helloHandler(w http.ResponseWriter, r *http.Request) {
	// var a="hello world";
	// fmt.Fprintf(w,a);

	var data map[string]interface{}
	data = make(map[string]interface{})

	data["name"] = "Alice"
	data["age"] = 30
	data["isStudent"] = true
	jsondata, err := json.Marshal(data)
	if err != nil {
		fmt.Printf("Json error:", err);
		return ;
	}
    fmt.Print(jsondata)
	w.Header().Set("Content-Type", "application/json")
	w.Write(jsondata)
	// fmt.Fprintf(w, jsondata)

}

func main() {
	// Define the HTTP routes
	http.HandleFunc("/hello", helloHandler)

	// Start the server on port 8080
	fmt.Println("Server is running on port 8080")
	err := http.ListenAndServe(":8080", nil)
	if err != nil {
		fmt.Println("Error starting server:", err)
	}
}
