var express = require('express');
var router = express.Router();

router.post('/', function(req, res, next) {
  var username = req.params.username;
  var password = req.params.password;
  var email = req.params.email;

  if (!username) {
    next(new Error("A username is required."));
    return;
  }
  if (!password) {
    next(new Error("A password is required."));
    return;
  }
  if (!email) {
    next(new Error("An email address is required."));
    return;
  }

  res.json({
    userId: 1,
    username: username,
    email: email
  });
});

module.exports = router;
