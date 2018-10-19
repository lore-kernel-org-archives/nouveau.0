From: =?UTF-8?B?5a2r5YGJ56iL?= <dmvictor-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: 8K HEVC decoding with NVIDIA GeForce GTX 1060
Date: Fri, 19 Oct 2018 20:53:05 +0800
Message-ID: <CAPHE55jvauzGm-QHUSze-Wg+W7S+qnqUobcu5BL+jPKWjBYAAw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1818937158=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============1818937158==
Content-Type: multipart/alternative; boundary="000000000000227e390578946521"

--000000000000227e390578946521
Content-Type: text/plain; charset="UTF-8"

Hi all,

I have developed an Android VR player, which supports 4K video playback so
far. I want to include the support for 8K video. The current Snapdragon 845
mobile platform supports up to 4K video playback, which lacks the support
for my requirement. So I choose Android-x86 as my platform for development,
which is Android OS runs on Intel x86 architecture. I've tried to play
8K(7680*3840) HEVC encoded video on Android-x86 7.1-r2 with VLC for
Android, the screen freeze. My CPU is Intel Core i5-7400 and my graphics
card is NVIDIA GeForce GTX 1060. I am pretty sure my NVIDIA card is able to
decode 8K video. Because with the same hardware, I play the same 8K video
on Ubuntu 16.04 with ffplay smoothly. NVIDIA's decoder usage is about 40%
and CPU usage is about 50%.

From NVIDIA website (
https://developer.nvidia.com/nvidia-video-codec-sdk#NVDECFeatures), we know
Pascal cards support up to 8192*8192 resolution video decoding acceleration
with HEVC codec. From Nouveau feature matrix (
https://nouveau.freedesktop.org/wiki/FeatureMatrix/), we know the progress
of video decoding acceleration on NV130 family (
https://nouveau.freedesktop.org/wiki/CodeNames/#NV130) is TODO. In Nouveau
VideoAcceleration page (
https://nouveau.freedesktop.org/wiki/VideoAcceleration/), we can see that
each element in VP6+ row is TODO as well.

I can imagine there is a long way to go to fulfill my requirements. But I
know a driver for my NVIDIA card is a must for the hardware decoder to
work. Can somebody shed some lights that if I want to play an 8K HEVC
encoded video on Android-x86 with NVIDIA's decoder enabled, what should I
do in this project? And how to start?

Best regards,

Victor

--000000000000227e390578946521
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi all,<br></div><div dir=3D"ltr"><b=
r>I have developed an Android VR player, which supports 4K video playback s=
o far. I want to include the support for 8K video. The current Snapdragon 8=
45 mobile platform supports up to 4K video playback, which lacks the suppor=
t for my requirement. So I choose Android-x86 as my platform for developmen=
t, which is Android OS runs on Intel x86 architecture. I&#39;ve tried to pl=
ay 8K(7680*3840) HEVC encoded video on Android-x86 7.1-r2 with VLC for Andr=
oid, the screen freeze. My CPU is Intel Core i5-7400 and my graphics card i=
s NVIDIA GeForce GTX 1060. I am pretty sure my NVIDIA card is able to decod=
e 8K video. Because with the same hardware, I play the same 8K video on Ubu=
ntu 16.04 with ffplay smoothly. NVIDIA&#39;s decoder usage is about 40% and=
 CPU usage is about 50%.<br><br>From NVIDIA website (<a href=3D"https://dev=
eloper.nvidia.com/nvidia-video-codec-sdk#NVDECFeatures">https://developer.n=
vidia.com/nvidia-video-codec-sdk#NVDECFeatures</a>), we know Pascal cards s=
upport up to 8192*8192 resolution video decoding acceleration with HEVC cod=
ec. From Nouveau feature matrix (<a href=3D"https://nouveau.freedesktop.org=
/wiki/FeatureMatrix/">https://nouveau.freedesktop.org/wiki/FeatureMatrix/</=
a>), we know the progress of video decoding acceleration on NV130 family (<=
a href=3D"https://nouveau.freedesktop.org/wiki/CodeNames/#NV130">https://no=
uveau.freedesktop.org/wiki/CodeNames/#NV130</a>) is TODO. In Nouveau VideoA=
cceleration page (<a href=3D"https://nouveau.freedesktop.org/wiki/VideoAcce=
leration/">https://nouveau.freedesktop.org/wiki/VideoAcceleration/</a>), we=
 can see that each element in VP6+ row is TODO as well. <br><br>I can imagi=
ne there is a long way to go to fulfill my requirements. But I know a drive=
r for my NVIDIA card is a must for the hardware decoder to work. Can somebo=
dy shed some lights that if I want to play an 8K HEVC encoded video on Andr=
oid-x86 with NVIDIA&#39;s decoder enabled, what should I do in this project=
? And how to start? <br><br>Best regards,<br><br>Victor<br></div></div></di=
v>

--000000000000227e390578946521--

--===============1818937158==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1818937158==--
