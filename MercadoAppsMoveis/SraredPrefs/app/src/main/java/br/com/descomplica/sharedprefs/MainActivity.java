package br.com.descomplica.sharedprefs;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {

    Button btOk;
    Button loadPrefs;
    EditText editName, editAge;
    CheckBox checkSmoke;
    SharedPreferences sharedPreferences;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        editName = findViewById(R.id.editName);
        editAge = findViewById(R.id.editAge);
        checkSmoke = findViewById(R.id.checkSmoke);
        btOk = findViewById(R.id.btSave);
        loadPrefs = findViewById(R.id.loadPrefBt);

        sharedPreferences = getSharedPreferences(getString(R.string.pref_key), Context.MODE_PRIVATE);

        //if you want to load pref on statup:
        //loadSharedPref();
    }

    public void saveButton(View v) {
        try {
            boolean smoke = checkSmoke.isChecked();
            String name = editName.getText().toString();
            int age = Integer.parseInt(editAge.getText().toString());

            SharedPreferences.Editor prefEditor = sharedPreferences.edit();

            prefEditor.putString(getString(R.string.pref_val_name), name);
            prefEditor.putInt(getString(R.string.pref_val_age), age);
            prefEditor.putBoolean(getString(R.string.pref_val_smoke), smoke);

            if (prefEditor.commit())
                Toast.makeText(getApplicationContext(), R.string.saved, Toast.LENGTH_LONG).show();
            else
                Toast.makeText(getApplicationContext(), R.string.saveErrorGenericEx, Toast.LENGTH_LONG).show();

        } catch (NumberFormatException ex) {
            Toast.makeText(getApplicationContext(), R.string.saveError_numberEx, Toast.LENGTH_LONG).show();
        } catch (Exception e) {
            Toast.makeText(getApplicationContext(), R.string.saveErrorGenericEx, Toast.LENGTH_LONG).show();
        }
    }

    public void loadPrefButton(View v) {
        loadSharedPref();
    }

    public void cleanButton(View v) {
        editAge.getText().clear();
        editName.getText().getFilters();
        checkSmoke.setChecked(false);
    }


    private void loadSharedPref() {
        try {
            editName.setText(sharedPreferences.getString(getString(R.string.pref_val_name), ""));
            checkSmoke.setChecked(sharedPreferences.getBoolean(getString(R.string.pref_val_smoke), false));
            int age = sharedPreferences.getInt(getString(R.string.pref_val_age), 0);
            editAge.setText(String.valueOf(age));
        } catch (Exception ex) {
            Toast.makeText(getApplicationContext(), R.string.loadErrorEx, Toast.LENGTH_LONG).show();
        }
    }
}