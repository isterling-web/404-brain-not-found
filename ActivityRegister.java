package com.learnadroid.myfirstapp;

import android.app.ProgressDialog;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class ActivityRegister extends AppCompatActivity {

    EditText userID, fname, lname, email, age, bday, phone;
    Button register;
    ProgressDialog progressDialog;
    ConnectionClass connectionClass;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        getSupportActionBar().hide();
        getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN,
                WindowManager.LayoutParams.FLAG_FULLSCREEN);


        userID = (EditText) findViewById(R.id.userID);
        fname = (EditText) findViewById(R.id.firstname);
        lname = (EditText) findViewById(R.id.lastname);
        email = (EditText) findViewById(R.id.email);
        age = (EditText) findViewById(R.id.age);
        bday = (EditText) findViewById(R.id.birthdate);
        phone = (EditText) findViewById(R.id.phone);
        register = (Button) findViewById(R.id.register);

        connectionClass = new ConnectionClass();

        progressDialog = new ProgressDialog(this);

        register.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {


                // MainActivity.Doregister doregister = new MainActivity.Doregister();
                // doregister.execute("");
            }
        });


    }
}
