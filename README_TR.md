# Sinyaller ve Sistemler MATLAB Laboratuvarı

Sinyaller ve Sistemler dersinin temel konularını MATLAB üzerinde uygulama, görselleştirme ve dönüşüm domeninde analiz etme amacıyla hazırlanmış kompakt bir çalışma reposudur.

Repo; sürekli ve ayrık zamanlı temel sinyallerden başlayarak sinyal dönüşümleri, konvolüsyon, Fourier gösterimleri, Laplace analizi ve Z-dönüşümüne uzanan bir ders akışını takip eder. Scriptler özellikle küçük ve tek bir konuya odaklı tutulmuştur. Böylece matematiksel sonuçların daha büyük bir uygulamanın içinde kaybolması yerine MATLAB üzerinde doğrudan incelenebilmesi amaçlanmıştır.

Buradaki amaç teorinin yerine kod koymak değil; MATLAB'ı teoriyi sınamak, görselleştirmek ve pekiştirmek için bir mühendislik aracı olarak kullanmaktır.

## Repo Yapısı

```text
SaSLab/
├── basicSignals/
│   ├── continuous_time/
│   └── discrete_time/
├── signalManipulations/
│   ├── continuous-time/
│   └── discrete-time/
├── Convolution/
│   ├── continuous_time/
│   └── discrete_time/
├── Fourier/
│   ├── CTFS/
│   ├── CTFT/
│   ├── DTFS/
│   ├── DTFT/
│   └── DFT-FFT/
├── Laplace/
└── zTransform/
```

## Temel Sinyaller

İlk bölümde, sonraki deneylerde tekrar kullanılan standart sinyaller hem sürekli zamanlı hem de ayrık zamanlı olarak oluşturulmuştur.

Sürekli zaman tarafında sinüzoidal ve üstel sinyaller, birim basamak, birim rampa ve Dirac delta'nın sayısal bir yaklaşımı bulunur. İdeal impuls sıradan bir örneklenmiş sinyal olarak doğrudan temsil edilemediği için CT impuls örneğinde alanı bire eşit tutulan dar bir dikdörtgen darbe kullanılmıştır.

Ayrık zaman tarafında ise karşılık gelen sinüzoidal ve üstel diziler, birim basamak, birim rampa ve birim impuls yer alır. Sürekli zaman gösterimlerinde `plot`, ayrık zamanlı sinyallerde ise örnek yapısını korumak amacıyla `stem` kullanılmıştır.

## Sinyal Dönüşümleri

Bu bölüm dört temel sinyal işlemini inceler:

- zamanda kaydırma
- zaman ölçekleme
- zamanda ters çevirme
- genlik ölçekleme

İşlemler CT ve DT sinyaller için ayrı ayrı uygulanmıştır. Böylece \(x(t)\) ve \(x[n]\) üzerindeki dönüşümlerin farkı açık biçimde korunmuştur.

CT zamanda kaydırma deneyinde bir sinüzoidin faz değişimi ile eşdeğer zaman gecikmesi arasındaki

\[
t_0=\frac{\phi}{2\pi f}
\]

ilişkisi de kullanılmıştır.

Bu scriptlerin temel amacı \(x(t-t_0)\), \(x(at)\), \(x(-t)\) ve \(Ax(t)\) gibi dönüşümlerin sinyal üzerindeki etkisini doğrudan görünür hale getirmektir.

## Konvolüsyon

Sürekli ve ayrık zamanlı konvolüsyon örneklerinde MATLAB'ın `conv()` fonksiyonu kullanılmıştır.

Ayrık zamanda `conv()` doğrudan

\[
y[n]=\sum_k x[k]h[n-k]
\]

konvolüsyon toplamını hesaplar.

Sürekli zaman deneyinde

\[
x(t)=e^{-t}u(t), \qquad h(t)=e^{-2t}u(t)
\]

sinyalleri sonlu bir zaman ızgarasında örneklenmiştir. MATLAB sayısal diziler üzerinde konvolüsyon toplamı gerçekleştirdiği için sonuç örnekleme aralığı \(\Delta t\) ile ölçeklendirilmiştir:

\[
y(t)\approx \Delta t\,\mathrm{conv}(x,h).
\]

Bu işlem sürekli zaman konvolüsyon integralinin sayısal yaklaşımını verir. Aynı deney, konvolüsyon sonucunun neden giriş sinyallerinden farklı uzunlukta olduğunu ve kendine ait bir zaman eksenine ihtiyaç duyduğunu da gösterir.

## Fourier Analizi

Fourier bölümü, bütün işlemleri tek bir sayısal yöntem altında toplamak yerine incelenen sinyal ve gösterim türüne göre ayrılmıştır.

### Sürekli Zaman Fourier Serisi (CTFS)

Periyodik bir kare dalga tek harmoniklerinin toplamı ile yeniden oluşturulmuştur:

\[
x(t)=\frac{4}{\pi}
\left[
\sin(\omega_0t)
+\frac{1}{3}\sin(3\omega_0t)
+\frac{1}{5}\sin(5\omega_0t)+\cdots
\right].
\]

Farklı sayıda harmonik kullanılarak yapılan rekonstrüksiyonlar, toplamın kare dalgaya nasıl yaklaştığını ve süreksizlik noktalarının çevresindeki Gibbs olgusunu görsel olarak ortaya koyar.

### Ayrık Zaman Fourier Serisi (DTFS)

Sonlu ve periyodik bir dizinin DTFS katsayıları

\[
C_k=\frac{1}{N}\sum_{n=0}^{N-1}
x[n]e^{-j2\pi kn/N}
\]

ifadesinden doğrudan hesaplanmıştır.

Katsayıların genlik ve fazları ayrı olarak gösterilmiştir. Bu deney, \(N\)-periyodik bir ayrık zaman dizisinin \(N\) adet farklı Fourier serisi katsayısına sahip olduğunu uygulamalı olarak gösterir.

### Sürekli Zaman Fourier Dönüşümü (CTFT)

CTFT deneylerinde analitik dönüşüm çiftlerini ve temel özellikleri incelemek için MATLAB'ın sembolik araçları kullanılmıştır.

Örnekler:

- dikdörtgen darbenin CTFT'si,
- azalan üstel sinyalin dönüşümü,
- genlik ve faz spektrumları,
- zamanda kaydırma özelliği.

Zamanda kaydırma deneyinde

\[
x(t-t_0)
\longleftrightarrow
e^{-j\omega t_0}X(\omega)
\]

özelliği incelenmiştir. Orijinal ve kaydırılmış sinyal frekans domeninde karşılaştırıldığında genlik spektrumunun değişmediği, gecikme bilgisinin ise faz spektrumuna taşındığı görülür.

Dikdörtgen darbe scriptinde ayrıca darbenin sayısal olarak oluşturulduğu alternatif yaklaşım yorum satırı halinde korunmuştur. Böylece örneklenmiş bir dalga biçimi oluşturmak ile analitik CTFT hesaplamak arasındaki ayrım görülebilir.

### Ayrık Zaman Fourier Dönüşümü (DTFT)

Sonlu ayrık zaman dizileri frekans domeninde `freqz()` kullanılarak değerlendirilmiştir. `freqz()` temel olarak dijital filtrelerin frekans cevabı için kullanılan bir MATLAB fonksiyonu olsa da, sonlu bir katsayı dizisinin bu şekilde değerlendirilmesi dizinin birim çember üzerindeki DTFT'sine karşılık gelir.

DTFT deneyleri:

- genlik ve faz,
- \(2\pi\)-periyodiklik,
- zamanda kaydırma

özelliklerini kapsar.

Periyodiklik deneyinde

\[
X(e^{j(\omega+2\pi)})=X(e^{j\omega})
\]

özelliğini görünür hale getirmek için hesaplanan spektrum birden fazla periyot boyunca tekrar çizilmiştir.

Zamanda kaydırma deneyinde ise CTFT'deki özelliğin ayrık zaman karşılığı görülür: bir dizinin geciktirilmesi genlik spektrumunu değiştirmezken fazını değiştirir.

### DFT ve FFT

Fourier bölümünün son deneyi, analitik dönüşüm gösterimlerinden örneklenmiş verinin pratik spektral analizine geçiş yapar.

50 Hz ve 120 Hz bileşenlerinden oluşan bir sinyal üretilmiş ve MATLAB'ın `fft()` fonksiyonu kullanılarak dönüştürülmüştür. FFT, DFT'yi verimli biçimde hesaplayan algoritmadır. Elde edilen çift taraflı spektrum normalize edilerek tek taraflı genlik spektrumuna dönüştürülmüştür.

Bu deney, zaman domeninde doğrudan ayırt edilmesi zor olabilen frekans bileşenlerinin frekans domeninde açık biçimde belirlenebilmesini gösterir.

## Laplace Dönüşümü

Laplace bölümü sembolik dönüşüm işlemlerine ve sürekli zamanlı sistem gösterimine odaklanır.

`laplace()` ve `ilaplace()` fonksiyonları

\[
e^{-2t}, \qquad t, \qquad \sin(3t)
\]

gibi standart sinyaller üzerinde kullanılarak ileri ve ters dönüşüm çiftleri doğrudan kontrol edilmiştir.

Daha sonra

\[
H(s)=\frac{1}{s^2+2s+5}
\]

sürekli zaman transfer fonksiyonu MATLAB'ın `tf` gösterimi ile oluşturulmuştur. Sistemin kutup ve sıfırları programatik olarak hesaplanmış ve `pzmap()` ile \(s\)-düzleminde gösterilmiştir.

Bu bölümde Laplace dönüşümü yalnızca cebirsel bir işlem olmaktan çıkarak LTI sistem analizine bağlanır. Kutuplar, sadece paydanın kökleri olarak değil, sistem dinamiği ve kararlılığı hakkında bilgi taşıyan büyüklükler olarak ele alınır.

## Z-Dönüşümü

Z-dönüşümü bölümü, ayrık zamanlı sinyaller ve sistemler için dönüşüm domenindeki karşılıkları ele alır.

\[
x[n]=(0.5)^n
\]

dizisinin dönüşümü `ztrans()` ile alınmış, ardından `iztrans()` kullanılarak zaman domenindeki dizi tekrar elde edilmiştir. Bu yapı Laplace bölümündeki ileri ve ters dönüşüm örnekleriyle doğrudan paralellik kurar.

Ardından ayrık zamanlı bir transfer fonksiyonu oluşturulmuş ve kutup-sıfır yapısı \(z\)-düzleminde incelenmiştir. Kullanılan örnekte \(z=0.5\) noktasındaki kutup üzerinden kutup konumu, birim çember ve ayrık zamanlı sistem kararlılığı arasındaki ilişkiye geçiş yapılmıştır.

## Kullanılan MATLAB Araçları

Scriptlerde temel MATLAB işlemleri ile sinyal ve sistem analizinde sık kullanılan fonksiyonlar birlikte kullanılmıştır:

- `plot`, `stem`, `subplot`
- `conv`
- `fft`
- `freqz`
- `fourier`
- `laplace`, `ilaplace`
- `ztrans`, `iztrans`
- `tf`, `pole`, `zero`, `pzmap`

Analitik bir dönüşümün incelendiği yerlerde sembolik araçlar, örneklenmiş sinyallerin analizinde ise sayısal yöntemler tercih edilmiştir.

## Gereksinimler

- MATLAB
- Symbolic Math Toolbox
- Signal Processing Toolbox
- Control System Toolbox

## Kapsam

Bu repo genel amaçlı bir sinyal işleme kütüphanesi değil, Sinyaller ve Sistemler konularını uygulamalı biçimde tekrar etmek için hazırlanmış odaklı bir laboratuvar çalışmasıdır. Kodlar, kullanılan standart MATLAB fonksiyonlarından yararlanırken alttaki matematiksel ifadeyle bağlantının takip edilebileceği kadar açık tutulmuştur.

İlerleyen aşamalarda örnekleme ve aliasing, filtreleme, frekans cevabı ve kontrol odaklı sistem modelleri bu yapının doğal devamı olarak eklenebilir.
