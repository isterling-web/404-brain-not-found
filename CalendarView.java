package com.learnadroid.myfirstapp;

import android.app.DatePickerDialog;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.DatePicker;
import android.widget.TextView;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Calendar;

public class CalendarView extends AppCompatActivity {

    private static final String TAG = "CalendarView";

    private TextView mDisplayDate, activityText;
    private DatePickerDialog.OnDateSetListener mDateSetListener;
    ConnectionClass connectionClass;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.calendar_view);
        getSupportActionBar().hide();
        mDisplayDate = (TextView) findViewById(R.id.tvDate);

        activityText = (TextView) findViewById(R.id.activity);

        connectionClass = new ConnectionClass();

        mDisplayDate.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Calendar cal = Calendar.getInstance();
                int year = cal.get(Calendar.YEAR);
                int month = cal.get(Calendar.MONTH);
                int day = cal.get(Calendar.DAY_OF_MONTH);

                DatePickerDialog dialog = new DatePickerDialog(
                        CalendarView.this,
                        android.R.style.Theme_Holo_Light_Dialog_MinWidth,
                        mDateSetListener,
                        year, month, day);
                dialog.getWindow().setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
                dialog.show();
            }
        });


        mDateSetListener = new DatePickerDialog.OnDateSetListener() {
            @Override
            public void onDateSet(DatePicker datePicker, int year, int month, int day) {
                month = month + 1;
                Log.d(TAG, "onDateSet: mm/dd/yyyy: " + month + "/" + day + "/" + year);

                String date = month + "/" + day + "/" + year;
                mDisplayDate.setText(date);

                setActivity(date);

            }
        };
    }

    public void setActivity(String date)
    {
        String date2 = "";
        try
        {
            Connection con = connectionClass.CONN();
            if (con == null)
            {
                String z = "Please check your internet connection";
            }
            else
            {
                String query = "select * from number_of_exercises where WorkoutDate = '" +date+ "' and UserID = "+1003;

                Statement stmt = con.createStatement();
                //stmt.executeUpdate(query);

                ResultSet rs = stmt.executeQuery(query);


                while (rs.next())
                {
                    date2 = date2 +"\n"+ rs.getString(5);

                    int activities = rs.getInt(4);

                    activityText.setText("Your workout is:\n"+activities+" "+date2);

                }
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
}