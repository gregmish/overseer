-keep class io.flutter.** { *; }
-dontwarn io.flutter.**

-keep class com.example.overseer.MainActivity { *; }

-keep class * extends android.app.Activity { *; }
-keep class * extends android.app.Service { *; }
-keep class * extends android.content.BroadcastReceiver { *; }
-keep class * extends android.content.ContentProvider { *; }

-dontwarn sun.misc.**

-keep class android.speech.** { *; }
-keep class android.speech.tts.** { *; }
-keep class com.tundralabs.** { *; }
-keep class io.flutter.plugins.flutterttsx.** { *; }
-keep class io.flutter.plugins.speechtotext.** { *; }

-keepclassmembers class * {
    @com.google.gson.annotations.SerializedName <fields>;
}
-keepattributes *Annotation*

-dontwarn android.arch.**
-dontwarn androidx.**
-dontwarn javax.annotation.**

-optimizationpasses 5
-dontusemixedcaseclassnames
-dontskipnonpubliclibraryclasses
-dontpreverify
-verbose

-assumenosideeffects class android.util.Log {
    public static int v(...);
    public static int d(...);
    public static int i(...);
    public static int w(...);
    public static int e(...);
}

-keep class io.flutter.embedding.** { *; }
-keep class androidx.lifecycle.** { *; }
-keep class kotlin.Metadata { *; }
-keep class kotlin.jvm.internal.** { *; }
-keepclassmembers class kotlinx.coroutines.** {
    *;
}
