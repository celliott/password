package main

import (
  "io"
  "crypto/rand"
  "github.com/gin-gonic/gin"
)

func new_password(length int) string {
  chars := []byte("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789")
  new_pass := make([]byte, length)
  random_data := make([]byte, length+(length/4))
  count := byte(len(chars))
  dash := byte('-')
  i := 0
  for {
    if _, err := io.ReadFull(rand.Reader, random_data); err != nil {
      panic(err)
    }
    for _, c := range random_data {
      new_pass[i] = chars[c%count]
      if i > 0 && i%5 == 0 {
        new_pass[i] = dash
      }
      i++
      if i == length {
        return string(new_pass)
      }
    }
  }
  panic("Error generating password")
}

func main() {
  r := gin.Default()

  r.GET("/", func(c *gin.Context) {
    c.Data(200, "application/json; charset=utf-8", []byte(new_password(20)))
  })

  r.GET("/json", func(c *gin.Context) {
    c.JSON(200, gin.H{
      "password": new_password(20),
    })
  })

  r.Run(":3000")
}
