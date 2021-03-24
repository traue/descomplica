package br.com.descomplica.listinhadb;

import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;

import android.content.ContentValues;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListView;

import java.util.ArrayList;

import br.com.descomplica.listinhadb.model.Nota;

public class MainActivity extends AppCompatActivity {

    EditText editTitulo;
    Button btAdiciona;
    ListView lvNotas;
    ArrayList<Nota> listaNota;
    ArrayAdapter<Nota> adaptador;
    SQLiteDatabase db;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        editTitulo = findViewById(R.id.editTitulo);
        btAdiciona = findViewById(R.id.btIncluirNota);
        lvNotas = findViewById(R.id.listaNotas);

        preparaLista();

        lvNotas.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                Nota notaSelecionada = (Nota)lvNotas.getItemAtPosition(position);

                Intent telaEdicao = new Intent(getApplicationContext(), EditNotaActivity.class);
                telaEdicao.putExtra("objNota", notaSelecionada);
                startActivity(telaEdicao);
            }
        });


        lvNotas.setOnItemLongClickListener(new AdapterView.OnItemLongClickListener() {
            @Override
            public boolean onItemLongClick(AdapterView<?> parent, View view, final int position, long id) {

                AlertDialog.Builder msg = new AlertDialog.Builder(MainActivity.this);
                msg.setIcon(android.R.drawable.ic_menu_delete);
                msg.setTitle(getString(R.string.remover_da_lista));
                final Nota n = (Nota)lvNotas.getItemAtPosition(position);
                msg.setMessage(n.getTitulo());

                msg.setPositiveButton(getString(R.string.sim), new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        db.delete("lista", "id = " + n.getId(), null);
                        listaNota.remove(lvNotas.getItemAtPosition(position));
                        preparaLista();
                    }
                });

                msg.setNegativeButton(getString(R.string.nao), new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        dialog.cancel();
                    }
                });

                msg.create().show();
                return true;
            }
        });
    }

    @Override
    protected void onRestart() {
        super.onRestart();
        preparaLista();
    }

    private void preparaLista(){
        listaNota = new ArrayList<>();

        db = openOrCreateDatabase("db_lista", Context.MODE_PRIVATE, null);

        //db.execSQL("drop table lista");
        db.execSQL("CREATE TABLE IF NOT EXISTS lista(" +
                    "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
                    "titulo VARCHAR(100) NOT NULL, " +
                    "texto BLOB);");

        Cursor c = db.rawQuery("SELECT * from lista ORDER BY id ASC", null);

        if(c != null && c.getCount() > 0){
            while(c.moveToNext()){
                Nota n = new Nota(c.getInt(0), c.getString(1), c.getString(2));
                listaNota.add(n);
            }
        }else{
            //a lista está vazia
        }

        adaptador = new ArrayAdapter<>(this, android.R.layout.simple_list_item_1, listaNota);
        lvNotas.setAdapter(adaptador);
    }

    public void btAdiciona(View v){
        if(editTitulo.getText().toString().isEmpty()){
            AlertDialog.Builder msg = new AlertDialog.Builder(MainActivity.this);
            msg.setIcon(android.R.drawable.ic_dialog_alert);
            msg.setTitle(getString(R.string.campo_vazio));
            msg.setMessage(getString(R.string.titulo_nao_vazio));

            msg.setPositiveButton("Ok", new DialogInterface.OnClickListener() {
                @Override
                public void onClick(DialogInterface dialog, int which) {
                    editTitulo.requestFocus();
                    dialog.cancel();
                }
            });
            msg.show();
        }else {
            Nota n = new Nota();
            n.setTitulo(editTitulo.getText().toString());

            ContentValues valores = new ContentValues();
            valores.put("titulo", n.getTitulo());
            db.insert("lista", null, valores);

            editTitulo.setText("");
            editTitulo.requestFocus();

            preparaLista();
        }
    }
}
