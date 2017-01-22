package com.example.sauvik.hackfest;
import android.Manifest;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.support.v4.app.ActivityCompat;
import android.support.v4.content.ContextCompat;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ListView;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.Toast;

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
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;


public class CartActivity extends AppCompatActivity {
    private static final String TAG = "CartActivity";
    private ListView listView;
    private newAdapter adapter;
    ArrayList<details> array = new ArrayList<details>();
    private static final int CAMERA_PERMISSION = 1;

    private float sum;

    String server;
    //TODO: handle the case when the customer has scanned wrong barcode

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        server = getIntent().getStringExtra("key");
        setContentView(R.layout.activity_cart);
        Button b = (Button) findViewById(R.id.button2);
        b.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (ContextCompat.checkSelfPermission(CartActivity.this, Manifest.permission.CAMERA)
                        != PackageManager.PERMISSION_GRANTED) {
                    ActivityCompat.requestPermissions(CartActivity.this,
                            new String[]{Manifest.permission.CAMERA}, CAMERA_PERMISSION);
                } else {
                    startActivityForResult(new Intent(CartActivity.this,Qrscanner.class),1);
                }

            }
        });
    }

    public void Checkout(View v){
        Intent intent = new Intent(this,Payment.class);
        intent.putExtra("amount",String.valueOf(Math.round(sum*100)));
        startActivity(intent);
        finish();
    }

    @Override
    protected void onActivityResult(int reqCode,int resCode,Intent data){
        if(reqCode == 1){
            if(resCode == 1){
                final ProgressDialog loading = ProgressDialog.show(this,"Please Wait","Adding items to cart...",false,false);
                final String code = data.getData().toString().trim();
                String url = "http://172.16.40.204/"+server;
                Toast.makeText(CartActivity.this,url,Toast.LENGTH_LONG).show();
                StringRequest stringRequest = new StringRequest(Request.Method.POST,url,
                        new Response.Listener<String>() {
                            @Override
                            public void onResponse(String response) {
                                //Toast.makeText(CartActivity.this,response,Toast.LENGTH_LONG).show();
                                loading.dismiss();
                                String price,n;
                                int k=response.length(),j;
                                for(j=0;j<k;j++){
                                    if(response.charAt(j)=='@')
                                        break;
                                }
                                price=response.substring(0,j);
                                n=response.substring(j+1,k);
                                float f=Float.parseFloat(price);
                                Toast.makeText(CartActivity.this,n+"  "+f,Toast.LENGTH_LONG).show();
                                array.add(new details(n,f,1));
                                sum=0.0f;
                                for(j=0;j<array.size();j++){
                                    sum+=array.get(j).getPrice();
                                }
                                TextView t=(TextView) findViewById(R.id.sum);
                                t.setText("Total: Rs "+String.valueOf(sum));
                                listView  = (ListView) findViewById(R.id.listvw);
                                listView.setAdapter(adapter = new newAdapter(CartActivity.this,R.layout.adapter_layout,array));
                            }
                        },
                        new Response.ErrorListener() {
                            @Override
                            public void onErrorResponse(VolleyError error) {
                                Toast.makeText(CartActivity.this,error.toString(),Toast.LENGTH_LONG).show();
                                loading.dismiss();

                            }
                        }){
                    @Override
                    protected Map<String,String> getParams(){
                        Map<String,String> params = new HashMap<String, String>();
                        params.put("id",code);
                        return params;
                    }

                };

                RequestQueue requestQueue = Volley.newRequestQueue(CartActivity.this);
                requestQueue.add(stringRequest);
            }
        }
    }

    @Override
    public void onRequestPermissionsResult(int requestCode,  String permissions[], int[] grantResults) {
        switch (requestCode) {
            case CAMERA_PERMISSION:
                if (grantResults.length > 0 && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                    startActivityForResult(new Intent(CartActivity.this,Qrscanner.class),1);
                } else {
                    Toast.makeText(this, "Please grant camera permission to use the QR Scanner", Toast.LENGTH_SHORT).show();
                }
                return;
        }
    }

    public class newAdapter extends ArrayAdapter {
        public int res,cartCounter;
        private LayoutInflater inflater;
        private Context ctx;
        ArrayList<details> array;
        private details ll;

        public newAdapter(Context context, int resid, ArrayList<details> array) {
            super(context,resid,array);
            res = resid;
            this.cartCounter = array.size();
            this.array = array;
            inflater = LayoutInflater.from(context);
            ctx = context;
        }

        @Override
        public int getCount() {

            return cartCounter;
        }

        @Override
        public Object getItem(int arg0) {

            return array.get(arg0);
        }

        @Override
        public long getItemId(int arg0) {

            return arg0;
        }

        @Override
        public View getView(final int position, View convertView, ViewGroup parent) {
            if(convertView == null) {
                ViewHolder viewHolder = new ViewHolder();
                convertView = (RelativeLayout) inflater.inflate(res, null);
                final details li = (details) getItem(position);
                Button b = (Button) convertView.findViewById(R.id.remove);
                viewHolder.remove = b;
                viewHolder.remove.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                       // Toast.makeText(getContext(), "Button was clicked for list item " + position, Toast.LENGTH_SHORT).show();
                        array.remove(position);
                        sum=0.0f;
                        for(int j=0;j<array.size();j++){
                            sum+=array.get(j).getPrice();
                        }
                        TextView t=(TextView) findViewById(R.id.sum);
                        t.setText("Total: Rs "+String.valueOf(sum));
                        listView  = (ListView) findViewById(R.id.listvw);
                        listView.setAdapter(adapter = new newAdapter(CartActivity.this,R.layout.adapter_layout,array));

                    }
                });
                TextView textView = (TextView) convertView.findViewById(R.id.pName);
                textView.setText(li.getName());
                TextView t = (TextView) convertView.findViewById(R.id.price);
                t.setText("Rs "+String.valueOf(li.getPrice()));
                viewHolder.name = textView;
                convertView.setTag(viewHolder);
            }

            return convertView;
        }

        public class ViewHolder {
            TextView name;
            Button remove;
        }
    }


}