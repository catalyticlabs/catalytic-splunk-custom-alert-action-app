# Catalytic: Start Instance | Splunk Custom Alert Action App

_See [Splunk's documentation](https://docs.splunk.com/Documentation/Splunk/8.0.0/AdvancedDev/ModAlertsIntro) for more info on Custom Alert Actions_

### Instructions

First, install the Catalytic CLI on your Splunk server and create a Catalytic Developer Key to allow the CLI to interact with my Catalytic team. See Catalytic CLI installation instructions here: https://catalytic-developer.readme.io/reference/sdk-overview#installation-1 and authentication instructions here: [ADD LINK]

Once the Catalytic CLI is installed, add the "Catalytic: Start Instance" custom alert action app to your Splunk server by copying the `catalytic_start_instance` directory to `$SPLUNK_DIR/etc/apps`. Ensure you update the `catalytic_start_instance.sh` script with you Catalytic Developer Key Credentials.

### Components of Custom Alert Action App


Directory Structure:
```
$SPLUNK_DIR/etc/apps/catalytic_start_instance/
    appserver/
        static/
            catalytic_start_instance.png

    bin/
        catalytic_start_instance.sh

    default/
        alert_actions.conf
        app.conf
        restmap.conf
        ui/
            alerts/
                catalytic_start_instance.html
```



- `appserver/static/catalytic_start_instance.png` - Logo for App used in Splunk UI

- `bin/catalytic_start_instance.sh` - The script that runs when Custom Alert Action is triggered

- `default/ui/alerts/catalytic_start_instance.html` - Defines the UI when configuring the App as a trigged action in the Splunk Alert UI

- `default/alert_actions.conf` - Registers the App as a Custom Alert Action and allows the App to be selected in the Splunk Alert UI

- `default/app.conf` - Basic configuration settings for App

- `default/restmap.conf` - Validations for the params set when configuring the App as a triggered action

- `metadata/default.meta` - Defines the default permission & scope of Custom Alert Action


### Using the Custom Alert Action

_See official Splunk documentation here: https://docs.splunk.com/Documentation/SplunkCloud/latest/Alert/DefineRealTimeAlerts_

To configure a Custom Alert Action, first create a search in Splunk; then, select *Save As*>*Alert*. Adjust the *Trigger Conditions* settings as desired. Under *Trigger Actions*, select *+Add Actions* and select `Catalytic: Start Instance` from the list. If the App is not available, you may need to restart your Splunk server. Once selected, you should see two configuration parameters: `Pushbot ID` and `Instance Name`. The former referes to the ID of Pushbot you wish to start when the alert is triggered. The latter is the Name to apply to the Instance that is started when the alert is triggered. Enter values for the parameters and click *Save*. All done!




