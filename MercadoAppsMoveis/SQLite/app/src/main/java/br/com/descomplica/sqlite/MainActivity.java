package br.com.descomplica.sqlite;

import androidx.appcompat.app.AppCompatActivity;

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

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        editName = findViewById(R.id.editName);
        editAge = findViewById(R.id.editAge);
        checkSmoke = findViewById(R.id.checkSmoke);
        btOk = findViewById(R.id.btSave);
        loadPrefs = findViewById(R.id.loadPrefBt);

    }

    public void saveButton(View v) {
        try {
            boolean smoke = checkSmoke.isChecked();
            String name = editName.getText().toString();
            int age = Integer.parseInt(editAge.getText().toString());





        } catch (NumberFormatException ex) {
            Toast.makeText(getApplicationContext(), R.string.saveError_numberEx, Toast.LENGTH_LONG).show();
        } catch (Exception e) {
            Toast.makeText(getApplicationContext(), R.string.saveErrorGenericEx, Toast.LENGTH_LONG).show();
        }
    }

    public void loadPrefButton(View v) {

    }

    public void cleanButton(View v) {
        editAge.setText("");
        editName.setText("");
        checkSmoke.setChecked(false);
    }

}