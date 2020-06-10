package com.mobile.night

import android.content.Context
import android.content.res.Configuration
import android.support.v7.app.AppCompatDelegate


/**
 * @author jv.lee
 * @date 2020/6/9
 * @description 深色主题适配方法
 */
class DarkThemeTools {

    companion object {

        /**
         * 获取系统主题模式
         */
        fun getDefaultNightMode(): Int {
            return AppCompatDelegate.getDefaultNightMode()
        }

        /**
         * 当前是否为系统主题
         */
        fun isSystemTheme(): Boolean {
            return AppCompatDelegate.getDefaultNightMode() != AppCompatDelegate.MODE_NIGHT_YES && AppCompatDelegate.getDefaultNightMode() == AppCompatDelegate.MODE_NIGHT_NO
        }

        /**
         * 当前是否为深色主题
         */
        fun isDarkTheme(context: Context): Boolean {
            val flag = context.resources.configuration.uiMode and Configuration.UI_MODE_NIGHT_MASK
            return flag == Configuration.UI_MODE_NIGHT_YES
        }

        /**
         * 设置为跟随系统主题变更
         */
        fun updateSystemTheme(enable: Boolean, context: Context) {
            if (enable) {
                AppCompatDelegate.setDefaultNightMode(AppCompatDelegate.MODE_NIGHT_FOLLOW_SYSTEM)
                return
            }
            if (isDarkTheme(context)) {
                updateNightTheme(true)
            } else {
                updateNightTheme(false)
            }
        }

        /**
         * 设置深色主题
         */
        fun updateNightTheme(enable: Boolean) {
            if (enable) {
                AppCompatDelegate.setDefaultNightMode(AppCompatDelegate.MODE_NIGHT_YES)
            } else {
                AppCompatDelegate.setDefaultNightMode(AppCompatDelegate.MODE_NIGHT_NO)

            }
        }

    }

}