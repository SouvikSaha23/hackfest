package com.example.sauvik.hackfest;

import android.app.Activity;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;

import com.razorpay.Checkout;
import com.razorpay.PaymentResultListener;

import org.json.JSONObject;

public class Payment extends Activity implements PaymentResultListener {
    // ...
    private final static String TAG="Payment";
    private String amount;

    @Override
    protected void onCreate(Bundle si){
        super.onCreate(si);
        amount = getIntent().getStringExtra("amount");
        startPayment();

    }

    @Override
    public void onPaymentSuccess(String razorpayPaymentID) {
        /**
         * Add your logic here for a successfull payment response
         */

    }

    @Override
    public void onPaymentError(int code, String response) {
        /**
         * Add your logic here for a failed payment response
         */
    }

    public void startPayment() {
        /**
         * Instantiate Checkout
         */
        Checkout checkout = new Checkout();

        /**
         * Set your logo here
         */
        //checkout.setImage(R.drawable.logo);

        /**
         * Reference to current activity
         */
        final Activity activity = this;

        /**
         *  Pass your payment options to the Razorpay Checkout as a JSONObject
         */
        try {
            JSONObject options = new JSONObject();

            /**
             * Merchant Name
             * eg: Rentomojo || HasGeek etc.
             */
            options.put("name", "Merchant Name");

            /**
             * Description can be anything
             * eg: Order #123123
             *     Invoice Payment
             *     etc.
             */
            options.put("description", "Order #123456");

            options.put("currency", "INR");

            /**
             * Amount is always passed in PAISE
             * Eg: "500" = Rs 5.00
             */
            options.put("amount", amount);

            checkout.open(activity, options);
        } catch (Exception e) {
            Log.e(TAG, "Error in starting Razorpay Checkout", e);
        }
    }

}
