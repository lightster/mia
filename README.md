# Mia Time Tracking

## Development

For testing, we use PHP and Behat to hit the Mia API.

You will need to run `composer install` to install Behat and the other
related testing dependencies.

After installing the testing dependencies, create a `behat.local.yml`
in the root of your repository clone and save the following contents:

```yml
default:
    context:
        parameters:
            base_url:   http://127.0.0.1:3000
```

Be sure to update the `base_url` to match the API endpoint you are testing
against. Note that on some systems (e.g. OS X Yosemite) you will need to
use `127.0.0.1` instead of `localhost` due to
[IPv6 lookup issues](http://superuser.com/questions/830920/curl-local-host-names-on-mac-os-x-yosemite).

Once the dependencies are downloaded and your local Behat config is setup,
you can run the tests by running `vendor/bin/behat`.
