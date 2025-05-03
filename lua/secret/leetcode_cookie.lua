local env = require("secret.env")

return {
  LEETCODE_SESSION = env.LEETCODE_SESSION,
  csrftoken = env.LEETCODE_CSRF,
}
