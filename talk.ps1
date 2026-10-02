Add-Type -AssemblyName System.Speech
$voice = New-Object System.Speech.Synthesis.SpeechSynthesizer

$ssmlText = @"
<speak version='1.0' xmlns='http://www.w3.org/2001/10/synthesis' xml:lang='ja-JP'>
  <voice gender="female" age="adult">

    <!-- 強調: strong, moderate, reduced, none -->
    今日は、 <emphasis level='strong'>絶対に</emphasis> 遅刻しないでください。

    <break time='500ms'/>

    <!-- ピッチの変更: x-low, low, medium, high, x-high -->
    <prosody pitch='x-high'>聞いてますかー？</prosody>

    <break time='250ms'/>

    <!-- 速度の変更: x-slow, slow, medium, fast, x-fast -->
    <prosody rate='slow'>わかりましたね？</prosody>

  </voice>
</speak>
"@


try {
    $voice.SpeakSsml($ssmlText)
}
finally {
    $voice.Dispose()
}