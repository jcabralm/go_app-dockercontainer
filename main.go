package main

import	"net/http"

func main()  {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request){
		w.Write([]byte("<h1>hello, jcabram!</>"))
	})
	http.ListenAndServe(":3030", nil)
}
