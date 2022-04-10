package main

import (
	"io/ioutil"
	"log"
	"net/http"

	"github.com/labstack/echo/v4"
)

var URL = "https://api.weather.gov"

func main() {
	e := echo.New()
	e.GET("/*", func(ctx echo.Context) error {
		var requestedUrl = ctx.ParamValues()[0]

		var url = URL + "/" + requestedUrl
		resp, err := http.Get(url)
		if err != nil {
			log.Fatal(err)
			return err
		}

		defer resp.Body.Close()

		response, err := ioutil.ReadAll(resp.Body)

		if err != nil {
			log.Fatal(err)
			return err
		}

		return ctx.String(resp.StatusCode, string(response))
	})

	e.Logger.Fatal(e.Start(":8080"))
}
