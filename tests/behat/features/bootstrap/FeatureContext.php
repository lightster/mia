<?php

use Behat\Behat\Context\ClosuredContextInterface;
use Behat\Behat\Context\TranslatedContextInterface;
use Behat\Behat\Context\BehatContext;
use Behat\Behat\Exception\PendingException;
use Behat\Gherkin\Node\PyStringNode;
use Behat\Gherkin\Node\TableNode;

//
// Require 3rd-party libraries here:
//
//   require_once 'PHPUnit/Autoload.php';
//   require_once 'PHPUnit/Framework/Assert/Functions.php';
//

/**
 * Features context.
 */
class FeatureContext extends BehatContext
{
    /**
     * A hash of uniqid() values defined in the scenario
     * @var array
     */
    private $unique_ids = [];

    /**
     * A hash of all properties to send in the request body.
     * @var array
     */
    private $request_properties = [];

    /**
     * @var string
     */
    private $base_url;

    /**
     * Initializes context.
     * Every scenario gets its own context object.
     *
     * @param array $parameters context parameters (set them up through behat.yml)
     */
    public function __construct(array $parameters)
    {
        if (!array_key_exists('base_url', $parameters)) {
            throw new Exception("Required config option 'base_url' was not provided.");
        }

        $this->base_url = $parameters['base_url'];
    }

    /**
     * @Given /^I am unauthenticated$/
     */
    public function iAmUnauthenticated()
    {
        // TODO: clear out any authentication that might have been set
    }

    /**
     * @Given /^I generate a unique ID called "([^"]*)"$/
     */
    public function iGenerateAUniqueIdCalled($id_name)
    {
        $fq_id_name = '{{' . $id_name . '}}';
        if (array_key_exists($fq_id_name, $this->unique_ids)) {
            throw new Exception(
                "A unique ID named '{$id_name}' was already defined for this scenario."
            );
        }

        $this->unique_ids[$fq_id_name] = uniqid();
    }

    /**
     * @When /^I use a[n]? (.*?) of "([^"]*)"$/
     */
    public function iUseAPropertyValueOf($property, $value)
    {
        $this->request_properties[$property] = str_replace(
            array_keys($this->unique_ids),
            array_values($this->unique_ids),
            $value
        );
    }

    /**
     * @Given /^I post to (.*?)$/
     */
    public function iPostToRoute($route)
    {
        throw new PendingException();
    }

    /**
     * @Then /^I should receive a[n]? "([^"]*)" response$/
     */
    public function iShouldReceiveAResponse($response)
    {
        throw new PendingException();
    }

    /**
     * @Given /^the (.*?) property should be "([^"]*)"$/
     */
    public function thePropertyValueShouldBe($property, $value)
    {
        throw new PendingException();
    }

    /**
     * @Given /^the (.*?) property should not be returned$/
     */
    public function thePropertyShouldNotBeReturned()
    {
        throw new PendingException();
    }
}
