package com.example.source_elite_android

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.MenuItem
import androidx.core.view.GravityCompat
import com.google.android.material.navigation.NavigationView
import kotlinx.android.synthetic.main.activity_mainmenu.*

class mainmenu : AppCompatActivity(), NavigationView.OnNavigationItemSelectedListener {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_mainmenu)

               btn_menu.setOnClickListener {
            layout_drawer.openDrawer(GravityCompat.START) //START : left, END : right

        naviView.setNavigationItemSelectedListener(this)
     }

}

    override fun onNavigationItemSelected(item: MenuItem): Boolean {// 네비게시션 메뉴 아이템 클릭시 수행
       layout_drawer.closeDrawers()//네비게이션 닫기
        return false
    }

    override fun onBackPressed() {//뒤로가기 버튼 클릭시 수행 메소드
        if(layout_drawer.isDrawerOpen(GravityCompat.START)) {
            layout_drawer.closeDrawers()
        }else{

            super.onBackPressed()
        }

    }

}