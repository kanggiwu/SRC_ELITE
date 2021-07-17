package com.example.source_elite_android

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Toast
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity() {
    private val id = "99" // 로그인 하는 임시 아이디
    private val passworld = "1234" // 로그인 하는 임시 비밀번호

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        /* 로그인 버튼 클릭시 메인으로 넘김
           btn_m.setOnClickListener(){
           val intent = Intent(this, main::class.java)//isntent로 화면전환
           Toast.makeText(this, "로그인 되었습니다" , Toast.LENGTH_LONG).show()
           startActivity(intent)//intent 객체로 시작
       }*/

        btn_m.setOnClickListener() {
            var textId = tv_id.text.toString()
            var textPw = tv_pw.text.toString()
            var inputlogin = tv_id.text.trim().toString() //로그인 아이디값
            var inputPassword = tv_pw.text.trim().toString() // 로그인 비밀번호 값



            if (inputlogin == id && inputPassword == passworld) { //아이디와 로그인 값이 같다면....
                var intent = Intent(this, mainmenu::class.java)//로그인 화면 보여질 View
                startActivity(intent)//시작
                Toast.makeText(this,"로그인 되었습니다.", Toast.LENGTH_SHORT).show()

            } else {
                if (inputlogin.isNullOrEmpty() && inputPassword.isNullOrEmpty()) {//아이디와 비밀번호가 입력되지 않았을때
                    Toast.makeText(this, "아이디와 비밀번호를 입력하세요", Toast.LENGTH_SHORT).show()

                } else if (inputlogin != id) { //그것도 아니라면 만약 input id가 다르다면
                    Toast.makeText(this, "존재하지 않는 아이디입니다.", Toast.LENGTH_SHORT).show()

                } else if (inputPassword != passworld) { //그것도 아니라면 만약 input pw가 다르다면
                    Toast.makeText(this, "비밀번호가 올바르지 않습니다.", Toast.LENGTH_SHORT).show()
                }
            }

        }
    }
}