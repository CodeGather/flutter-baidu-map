package com.baidu.flutter.trace.utils;

import android.text.TextUtils;
import android.util.Log;

/**
 * 打印日志，默认状态为关闭
 *
 * @hide
 */
public final class BLog {

    /**
     * 是否打开日志，默认关闭
     */
    public static final boolean ENABLE = true;

    public static final void d() {
        if (ENABLE) {
            if (Thread.currentThread().getStackTrace().length == 0) {
                return;
            } else {
                Log.d(getFileName(), getMethodName());
            }
        }
    }

    public static final void e(String s) {
        if (!ENABLE) {
            return;
        }
        if (Thread.currentThread().getStackTrace().length == 0) {
            return;
        } else {
            Log.e(getFileName(), s);
        }
    }

    public static final void e(String tag, String s) {
        if (!ENABLE) {
            return;
        }
        if (TextUtils.isEmpty(tag) || TextUtils.isEmpty(s)) {
            return;
        }
        Log.e(tag, s);
    }

    protected static String getShortTraceInfo() {
        StringBuffer sb = new StringBuffer();

        StackTraceElement[] stacks = new Throwable().getStackTrace();
        sb.append("[method: ").append(stacks[2].getMethodName())
                .append("; line: ").append(stacks[2].getLineNumber())
                .append("; class: ").append(stacks[2].getFileName())
                .append("]");

        return sb.toString();
    }

    protected static String getTraceInfo() {
        StringBuffer sb = new StringBuffer();

        StackTraceElement[] stacks = new Throwable().getStackTrace();
        sb.append("method: ").append(stacks[2].getMethodName())
                .append("; line: ").append(stacks[2].getLineNumber())
                .append("; class: ").append(stacks[2].getClassName());

        return sb.toString();
    }

    protected static String getLineInfo() {
        StackTraceElement ste = new Throwable().getStackTrace()[2];
        return ste.getFileName() + ": Line " + ste.getLineNumber();
    }

    protected static String getMethodName() {
        StackTraceElement ste = new Throwable().getStackTrace()[2];
        return ste.getMethodName();
    }

    protected static String getFileName() {
        StackTraceElement ste = new Throwable().getStackTrace()[2];
        return ste.getFileName() + "[" + ste.getLineNumber() + "]";
    }

}
