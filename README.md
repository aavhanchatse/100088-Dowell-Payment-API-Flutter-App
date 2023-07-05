<!-- DOCUMENTATION FOR FLUTTER FLOW PROJECT -->

Dowel Payments API

This project is created to integrate and test the two payment api's which are "Stripe" and "Paypal".
The project is made with “Flutter Flow”.
When you open the project you will see that there is one screen which has one button in the center. The button is named “Make Payment”.
There are two actions in the action flow editor of this button.
First one is the “Backend Call” where the api call is made to the backend.
The api call is named “makePayment”. The api is “POST” type.
The api url is “https://100088.pythonanywhere.com/api/stripe”.
The headers are:
Content-Type: application/json
Authorization: {{API_CALL}}

The body is:
{
"price": 8000,
"product": "Workflow AI",
"currency_code": "INR"
}
Currently the api uses static values in the body, but we can use dynamic values by making variables as well.
The response is captured in the JSON Path variable named “approvalUrl”.
The second action in the action flow is a Custom Action. The name of this custom action is “openUrl”.
This is a function which accepts one String parameter. It is used to launch the url which we receive in the api call response. The dependency “url_launcher: ^6.1.7” is used to launch this url.

After clicking this button, the first action which is api call will be triggered. If the api call is successful, then we’ll receive one approval url in the api response. This url will be passed to the second action which is custom action. This action will launch the url and redirect the user to the respective payment gateway.

For some reason its been informed that the payment in Paypal payment gateway cannot be completed in India, hence I could not complete the payment in Paypal.
But it should work smoothly in Stripe Payment Gateway.
After the payment is completed, the user should see the Payment Success Screen.

The payment flow ends on this success screen for now.

<!-- END -->

<!-- DOCUMENTATION FOR FLUTTER & DART PROJECT -->

This project is created to integrate and test the two payment api's which are
"Stripe" and "Paypal".

<!-- PROJECT STRUCTURE -->

The project follows MVC pattern with GetX for State management.

The "app_constants" folder contains all the files containing the constant values which are used in the project.

The "models" folder contains all the model classes used in the project.

The "repo" folder contains all the repository files in which all the api calls are made. The "payment_repo" file contains the api call which is made for the payment api's.

The "utils" folder contains all the utility files used in the project. These are the helper functions which are used in the projects.

The "view" folder contains all the screens and widgets of the projects.

As you will notice that the "splash_screen.dart" is the initial screen loaded in the project. After this screen, the user is navigated to the "wifi_list_screen.dart" screen. Here you will see a button to make the api call.

After clicking this button, the user will be navigated to the respective payment gateway.

<!-- HOW THE API WORK -->

The api endpoints are declared in the file named "api_path.dart".
If you want to test the "Stripe" api, comment out the "Paypal" api endpoint and uncomment the Stripe one. Do vice-verca if you want to test the Paypal api.

After making api call to any of the api endpoint, the api will return an "approval_url" in the response. We need to redirect the user to this url for him to complete the payment.

All the screen which are visible after redirecting the user to this api, are provided by the respective payment gateway.

For some reason its been informed that the payment in Paypal payment gateway cannot be completed in India, hence I could not complete the payment in Paypal.

But it should work smoothly in Stripe Payment Gateway.

After the payment is completed, the user should see the Payment Success Screen. But as informed, this "Payment Success Screen" is still in development, hence the user will see a error screen instead.

<!-- END -->
