package com.example.sauvik.hackfest;

import android.Manifest;
import android.app.ProgressDialog;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.support.v4.app.ActivityCompat;
import android.support.v4.content.ContextCompat;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import java.util.HashMap;
import java.util.Map;

public class SelectMall extends AppCompatActivity {

    private static final int CAMERA_PERMISSION = 1;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_select_mall);
    }

    public void ScanQr(View v){
        
        if (ContextCompat.checkSelfPermission(SelectMall.this, Manifest.permission.CAMERA)
                != PackageManager.PERMISSION_GRANTED) {
            ActivityCompat.requestPermissions(SelectMall.this,
                    new String[]{Manifest.permission.CAMERA}, CAMERA_PERMISSION);
        } else {
            startActivityForResult(new Intent(SelectMall.this,Qrscanner.class),1);
        }
    }

    @Override
    public void onRequestPermissionsResult(int requestCode,  String permissions[], int[] grantResults) {
        switch (requestCode) {
            case CAMERA_PERMISSION:
                if (grantResults.length > 0 && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                    startActivityForResult(new Intent(SelectMall.this,Qrscanner.class),1);
                } else {
                    Toast.makeText(this, "Please grant camera permission to use the QR Scanner", Toast.LENGTH_SHORT).show();
                }
                return;
        }
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        if (requestCode == 1) {
            if (resultCode == 1) {
                //final ProgressDialog loading = ProgressDialog.show(this,"Please Wait","Selecting Mall",false,false);
                final ProgressDialog progressDialog = new ProgressDialog(SelectMall.this,
                        R.style.AppTheme_Dark_Dialog);
                progressDialog.setIndeterminate(true);
                progressDialog.setMessage("Selecting Mall...");
                progressDialog.show();
                final String code = data.getData().toString().trim();
                String url = "http://172.16.40.204/Hackfest/php_files/return_mall.php";
                StringRequest stringRequest = new StringRequest(Request.Method.POST,url,
                        new Response.Listener<String>() {
                            @Override
                            public void onResponse(String response) {
                                Toast.makeText(SelectMall.this,response,Toast.LENGTH_LONG).show();
                                progressDialog.dismiss();
                                Intent intent=new Intent(SelectMall.this,CartActivity.class);
                                intent.putExtra("key",response);
                                startActivity(intent);
                            }
                        },
                        new Response.ErrorListener() {
                            @Override
                            public void onErrorResponse(VolleyError error) {
                                progressDialog.dismiss();
                                Toast.makeText(SelectMall.this,"Network Error.",Toast.LENGTH_LONG).show();

                            }
                        }){
                    @Override
                    protected Map<String,String> getParams(){
                        Map<String,String> params = new HashMap<String, String>();
                        params.put("id",code);
                        return params;
                    }

                };

                RequestQueue requestQueue = Volley.newRequestQueue(SelectMall.this);
                requestQueue.add(stringRequest);
            }
        }
    }

}
