get_surveys <- function() {
  url <- paste0(Sys.getenv("ALCHEMER_URL"), "survey.debug", "?api_token=",
                Sys.getenv("ALCHEMER_TOKEN"),
                "&api_token_secret=", Sys.getenv("ALCHEMER_SECRET_KEY"))

  resp <- GET(url)
  resp
  # if (http_type(resp) != "application/json") {
  #   stop("API did not return json", call. = FALSE)
  # }
  #
  # parsed <- jsonlite::fromJSON(content(resp, "text"), simplifyVector = FALSE)
  #
  # if (http_error(resp)) {
  #   stop(
  #     sprintf(
  #       "Alchemer API request failed [%s]\n%s\n<%s>",
  #       status_code(resp),
  #       parsed$message,
  #       parsed$documentation_url
  #     ),
  #     call. = FALSE
  #   )
  }

  structure(
    list(
      content = parsed,
      path = path,
      response = resp
    ),
    class = "alchemer_api"
  )
}

register_account <- function(base_url, key) {
  secret_key <-  gtools::ask("Paste your secret key here:")
  Sys.setenv(ALCHEMER_URL = base_url,
             ALCHEMER_TOKEN = key,
             ALCHEMER_SECRET = secret_key)
  cat("Account details recorded.")
}

get_surveys()
