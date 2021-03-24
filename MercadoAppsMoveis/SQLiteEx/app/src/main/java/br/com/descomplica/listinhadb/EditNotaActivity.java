package br.com.descomplica.listinhadb;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Context;
import android.content.Intent;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

import br.com.descomplica.listinhadb.model.Nota;

public class EditNotaActivity extends AppCompatActivity {

    EditText editTituloEdicao, editTexto;
    Button btSalvar;
    Nota nota;
    SQLiteDatabase db;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_edit_nota);

        editTituloEdicao = findViewById(R.id.editTituloEdicao);
        editTexto = findViewById(R.id.editTextoNota);
        btSalvar = findViewById(R.id.btSalvarNota);

        Intent telaEdicao = getIntent();
        nota = (Nota)telaEdicao.getExtras().getSerializable("objNota");

        editTituloEdicao.setText(nota.getTitulo());
        editTexto.setText(nota.getTexto());
    }

    public void btSalvarNota(View v){
        db = openOrCreateDatabase("db_lista", Context.MODE_PRIVATE, null);
        db.execSQL("UPDATE lista SET " +
                "titulo = '" + editTituloEdicao.getText().toString() + "', "+
                "texto = '" + editTexto.getText().toString() + "' " +
                "WHERE id = " + nota.getId());

        finish();
    }
}
