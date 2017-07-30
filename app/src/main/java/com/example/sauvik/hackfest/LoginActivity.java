package com.example.sauvik.hackfest;

import android.Manifest;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.graphics.Bitmap;
import android.os.Bundle;
import android.support.annotation.BinderThread;
import android.support.v4.app.ActivityCompat;
import android.support.v4.content.ContextCompat;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;

import android.content.Intent;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonObjectRequest;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONException;
import org.json.JSONObject;

import java.math.BigDecimal;
import java.security.MessageDigest;
import java.util.HashMap;
import java.util.Map;


public class LoginActivity extends AppCompatActivity {
    private static final String TAG = "LoginActivity";

    private static final String REGISTER_URL = "http://172.16.40.204/Hackfest/php_files/login.php";

    public static final String KEY_EMAIL = "email";
    public static final String KEY_PASSWORD = "password";

    int c=0;
    private static final int CAMERA_PERMISSION = 1;

    public static final String SHARED_PREF_NAME = "myloginapp";
    //This would be used to store the email of current logged in user
    public static final String EMAIL_SHARED_PREF = "email";

    //We will use this to store the boolean in sharedpreference to track user is loggedin or not
    public static final String LOGGEDIN_SHARED_PREF = "loggedin";
    public static final String PASSWORD_SHARED_PREF = "password";
    private boolean loggedIn = false;

    private static final int REQUEST_SIGNUP = 0;
    private TextView _signupLink;
    private Button _loginButton;
    private EditText _emailText,_passwordText;
    
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);
        _loginButton = (Button) findViewById(R.id.btn_login);
        _signupLink = (TextView) findViewById(R.id.link_signup);
        _emailText = (EditText) findViewById(R.id.input_email);
        _passwordText=(EditText) findViewById(R.id.input_password);

        _loginButton.setOnClickListener(new View.OnClickListener() {

            @Override
            public void onClick(View v) {
                login();
            }
        });

        _signupLink.setOnClickListener(new View.OnClickListener() {

            @Override
            public void onClick(View v) {
                // Start the Signup activity
                Intent intent = new Intent(getApplicationContext(), SignupActivity.class);
                startActivityForResult(intent, REQUEST_SIGNUP);
            }
        });
    }

    @Override
    protected void onResume() {
        super.onResume();
        //In onresume fetching value from sharedpreference
        SharedPreferences sharedPreferences = getSharedPreferences(SHARED_PREF_NAME,Context.MODE_PRIVATE);

        //Fetching the boolean value form sharedpreferences
        loggedIn = sharedPreferences.getBoolean(LOGGEDIN_SHARED_PREF, false);

        //If we will get true
        if(loggedIn){
            _emailText.setText(sharedPreferences.getString(EMAIL_SHARED_PREF,null));
            _passwordText.setText(sharedPreferences.getString(PASSWORD_SHARED_PREF,null));
            login();
        }
    }
    public void login() {
        Log.d(TAG, "Login");

        if (!validate()) {
            onLoginFailed();
            return;
        }

        _loginButton.setEnabled(false);

        //to create pop-up progress dialog
        final ProgressDialog progressDialog = new ProgressDialog(LoginActivity.this,
                R.style.AppTheme_Dark_Dialog);
        progressDialog.setIndeterminate(true);
        progressDialog.setMessage("Authenticating...");
        progressDialog.show();

        String email = _emailText.getText().toString();
        String password = _passwordText.getText().toString();

        // TODO: Implement your own authentication logic here.
        loginUser();//done login

        new android.os.Handler().postDelayed(
                new Runnable() {
                    public void run() {

                        // On complete call either onLoginSuccess or onLoginFailed
                        if(c==0) {
                            onLoginSuccess();
                            progressDialog.dismiss();
                            Toast.makeText(LoginActivity.this,"Successfully logged in.",Toast.LENGTH_LONG).show();
                            Intent i=new Intent(LoginActivity.this,SelectMall.class);
                            startActivity(i);
                        }
                        else if(c==1){
                            onLoginFailed();
                            progressDialog.dismiss();
                            Toast.makeText(LoginActivity.this,"Invalid Username or Password.",Toast.LENGTH_LONG).show();
                        }
                        // onLoginFailed();

                    }
                }, 3000);// delay for the authenticating popup box
    }


    @Override
    public void onBackPressed() {
        // disable going back to the MainActivity
        moveTaskToBack(true);
    }

    public void onLoginSuccess() {
        _loginButton.setEnabled(true);
        //finish();
        c=0;
        final String email = _emailText.getText().toString().trim();
        final String password = _passwordText.getText().toString().trim();
        SharedPreferences sharedPreferences = LoginActivity.this.getSharedPreferences(SHARED_PREF_NAME, Context.MODE_PRIVATE);

        //Creating editor to store values to shared preferences
        SharedPreferences.Editor editor = sharedPreferences.edit();

        //Adding values to editor
        editor.putBoolean(LOGGEDIN_SHARED_PREF, true);
        editor.putString(EMAIL_SHARED_PREF, email);
        editor.putString(PASSWORD_SHARED_PREF,password);

        //Saving values to editor
        editor.apply();
        /*
        if (ContextCompat.checkSelfPermission(LoginActivity.this, Manifest.permission.CAMERA)
                != PackageManager.PERMISSION_GRANTED) {
            ActivityCompat.requestPermissions(LoginActivity.this,
                    new String[]{Manifest.permission.CAMERA}, CAMERA_PERMISSION);
        } else {
            Toast.makeText(LoginActivity.this," 2 Please Scan the QRCode of the mall..........",Toast.LENGTH_LONG).show();
            startActivityForResult(new Intent(LoginActivity.this,Qrscanner.class),1);
        }*/
    }

    public void onLoginFailed() {
        _loginButton.setEnabled(true);
    }
    //Validate function
    public boolean validate() {
        boolean valid = true;

        String email = _emailText.getText().toString().trim();
        String password = _passwordText.getText().toString().trim();

        if (email.isEmpty() || !android.util.Patterns.EMAIL_ADDRESS.matcher(email).matches()) {
            _emailText.setError("enter a valid email address");
            valid = false;
        } else {
            _emailText.setError(null);
        }

        if (password.isEmpty() || password.length() < 4 || password.length() > 10) {
            _passwordText.setError("between 4 and 10 alphanumeric characters");
            valid = false;
        } else {
            _passwordText.setError(null);
        }

        return valid;
    }

    private void loginUser(){
        final String email = _emailText.getText().toString().trim();
        final String password = md5(_passwordText.getText().toString().trim());

        StringRequest stringRequest = new StringRequest(Request.Method.POST, REGISTER_URL,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        if(!response.equals("Successfully logged in")) {
                            c = 1;
                           // Toast.makeText(LoginActivity.this,response+". Login Failed.",Toast.LENGTH_LONG).show();
                        }

                    }
                },
                new Response.ErrorListener() {
                    @Override
                    public void onErrorResponse(VolleyError error) {
                        Toast.makeText(LoginActivity.this,"Network Error. Login Failed",Toast.LENGTH_LONG).show();
                        c=2;
                    }
                }){
            @Override
            protected Map<String,String> getParams(){
                Map<String,String> params = new HashMap<String, String>();
                params.put(KEY_PASSWORD,password);
                params.put(KEY_EMAIL, email);
                return params;
            }

        };

        RequestQueue requestQueue = Volley.newRequestQueue(LoginActivity.this);
        requestQueue.add(stringRequest);
    }
    private String md5(String password) {
        try{
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(password.getBytes());

            byte byteData[] = md.digest();

            //convert the byte to hex format method 1
            StringBuffer sb = new StringBuffer();
            for (int i = 0; i < byteData.length; i++) {
                sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
            }

            return sb.toString();
        }catch (java.security.NoSuchAlgorithmException e) {
            Log.d("TAG","MD5 not done:  ");
        }
        return null;
    }
}
