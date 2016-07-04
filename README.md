# Instabug RaMin0

A mini bug reporting service.

## App Dependencies
The versions supplied were used during the development of this app. The app should be backward/forward compatible with older versions, so feel free to use older/newer versions but at your own risk.

* **Ruby** 2.3.0p0
* **Rails** 4.2.6
* **MySQL** 5.7.13
* **Redis** 3.2.1

## Installing
After cloning the app, you need to run the following commands within the app's directory to get things up and running.

* Make a copy of `config/_database.yml` and edit it to your heart's content.
    
    `cp config/_database.yml config/database.yml`

* Do the same for `config/_secrets.yml`.

    `cp config/_secrets.yml config/secrets.yml`

* Install the app's gem dependencies using `bundler`.

    `bundle install`
    
* Create a fresh copy of the database.

    `bundle e rake db:create db:migrate`

* Either seed the database with a sample application or use the [`POST /apps`](#doc-api) public API to create one.

    `bundle e rake db:seed`

## Running

* To start the server, run the following command.

    `bundle e rails s`
    
* The app uses background jobs to process many things in the application, so make sure to fire up a background worker to consume them off the background queue.

    `bundle e sidekiq`

## Testing

The app's test suite is not fully furnished yet, but the current specs can be run using the following command.

    bundle e rspec


## Documentation

The app uses simple comments throughout the code to explain complex logic, but most of the time the code itself will be self explanatory and straight forward.

### API Documentation<a name="doc-api"></a>

The API calls allowed against the app can be tried out using [PostMan](https://www.getpostman.com/). Make sure to import [this](https://www.getpostman.com/collections/5a329488e7d1aee98e49) to see what you can do. PostMan uses environments to manage variables. Feel free to use mine as a starting template for yours.

<pre>
{
  "id":"a2a0227a-51ce-4a8b-51fd-2d76260ac28d",
  "name":"Instabug (Development)",
  "values":[
    {"key":"base_url","value":"http://localhost:3000","type":"text","enabled":true,"hovered":false},
    {"key":"api_version","value":"1","type":"text","enabled":true},
    {"key":"app_uuid","value":"<span style="color:red;font-weight:bold">APP_UUID</span>","type":"text","enabled":true},
    {"key":"app_token","value":"<span style="color:red;font-weight:bold">APP_TOKEN</span>","type":"text","enabled":true},
    {"key":"bug_number","value":"1","type":"text","enabled":true}],
  "team":null,"timestamp":1467579368497,"synced":false,"syncedFilename":"","isDeleted":false
}
</pre>

## Future Improvements

* Move all of the monkey patches made to the [wanelo/counter-cache](https://github.com/wanelo/counter-cache) gem into a PR.

* Improve tests to cover background scenarios.

## Getting in Touch

Feel free to drop me a line if you have any comments/suggestions. I'm also welcoming any PRs and code reviewing comments.