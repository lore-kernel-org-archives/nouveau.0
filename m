From: Mar Mel <marmel6942-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>
Subject: Re: NOUVEAU_LEGACY_CTX_SUPPORT Fan Speed
Date: Sun, 23 Jun 2019 04:34:48 +0000 (UTC)
Message-ID: <2050407925.625695.1561264488082@mail.yahoo.com>
References: <1119631907.971876.1560439165339.ref@mail.yahoo.com>
 <1119631907.971876.1560439165339@mail.yahoo.com>
 <495587496.1966749.1560615436420@mail.yahoo.com>
 <CAKb7UvhZYDRteWUmy0QUT1p5Tk+i_Ky0bFJU23pJSG7LHKLQYg@mail.gmail.com>
 <ce271f475953d1580c2fa8ffb561eca1b0426993.camel@redhat.com>
 <CAKb7UvhhSvF-RmvhVzrBeuf6S4m+pxzf_FPkRyocuXrNhLTuiw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1688521315=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7UvhhSvF-RmvhVzrBeuf6S4m+pxzf_FPkRyocuXrNhLTuiw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============1688521315==
Content-Type: multipart/alternative;
	boundary="----=_Part_625694_2100451377.1561264488080"

------=_Part_625694_2100451377.1561264488080
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

 Sure:
$ lspci -nn -d 10de:
01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GT200 [GeForce=
 GTX 260] [10de:05e2] (rev a1)

    On Saturday, June 22, 2019, 2:19:31 PM EDT, Ilia Mirkin <imirkin@alum.m=
it.edu> wrote: =20
=20
 Mar - can you provide the output of
lspci -nn -d 10de:
On Sat, Jun 22, 2019 at 2:17 PM Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:

Hi, is this actually an nv50 GPU, or some other model? I can try to take a =
closer look at this
On Sun, 2019-06-16 at 10:28 -0400, Ilia Mirkin wrote:
I don't really see anything between v5.0..v5.1 which would account for this=
. Could have been a subtle change to the i2c logic somewhere. The fastest w=
ay to identify the problem would be to do a bisect on the kernel to identif=
y the commit that caused this. There are many guides for this online.
On Sat, Jun 15, 2019 at 12:17 PM Mar Mel <marmel6942-/E1597aS9LQAvxtiuMwx3w@public.gmane.org> wrote:

 Unfortunately, even with this change now reverted in kernel 5.1.10, the fa=
n speed issue persists.
If someone could point me in the direction of a relevant commit(s) I'll hap=
pily file a bug report.
    On Thursday, June 13, 2019, 11:19:25 AM EDT, Mar Mel <marmel6942@yahoo.=
com> wrote: =20
=20
 As of kernel 5.1.9, on resume from suspend, my NV50 fan runs at full speed=
.=20

Not sure if it has to do with this new config option (NOUVEAU_LEGACY_CTX_SU=
PPORT)?

This issue is not present using kernel 5.0.21.
Years ago I filed a similar issue:

60704 =E2=80=93 [nouveau, git regression] - I2C PWM fan control broken on n=
v50 adt7475 on kernels 3.3.x+
Thanks.



|=20
|=20
|  |=20
60704 =E2=80=93 [nouveau, git regression] - I2C PWM fan control broken on n=
v50 a...


 |

 |

 |



  _______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
_______________________________________________Nouveau mailing listNouveau@=
lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
--=20
Cheers, Lyude Paul
 =20
------=_Part_625694_2100451377.1561264488080
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html xmlns=3D"http://www.w3.org/1999/xhtml" xmlns:v=3D"urn:schemas-microso=
ft-com:vml" xmlns:o=3D"urn:schemas-microsoft-com:office:office"><head><!--[=
if gte mso 9]><xml><o:OfficeDocumentSettings><o:AllowPNG/><o:PixelsPerInch>=
96</o:PixelsPerInch></o:OfficeDocumentSettings></xml><![endif]--></head><bo=
dy><div class=3D"ydpb82cc8f1yahoo-style-wrap" style=3D"font-family: Helveti=
ca Neue, Helvetica, Arial, sans-serif; font-size: 13px;"><div></div>
        <div>Sure:</div><div><br></div><div><div>$ lspci -nn -d 10de:<br>01=
:00.0 VGA compatible controller [0300]: NVIDIA Corporation GT200 [GeForce G=
TX 260] [10de:05e2] (rev a1)</div><br></div><div><br></div>
       =20
        </div><div id=3D"yahoo_quoted_1773245339" class=3D"yahoo_quoted">
            <div style=3D"font-family:'Helvetica Neue', Helvetica, Arial, s=
ans-serif;font-size:13px;color:#26282a;">
               =20
                <div>
                    On Saturday, June 22, 2019, 2:19:31 PM EDT, Ilia Mirkin=
 &lt;imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org&gt; wrote:
                </div>
                <div><br></div>
                <div><br></div>
                <div><div id=3D"yiv0375592993"><div><div dir=3D"ltr">Mar - =
can you provide the output of<div><br clear=3D"none"></div><div>lspci -nn -=
d 10de:</div></div><br clear=3D"none"><div class=3D"yiv0375592993yqt1925052=
404" id=3D"yiv0375592993yqt50702"><div class=3D"yiv0375592993gmail_quote"><=
div class=3D"yiv0375592993gmail_attr" dir=3D"ltr">On Sat, Jun 22, 2019 at 2=
:17 PM Lyude Paul &lt;<a rel=3D"nofollow" shape=3D"rect" ymailto=3D"mailto:=
lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" target=3D"_blank" href=3D"mailto:lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org">lyude@=
redhat.com</a>&gt; wrote:<br clear=3D"none"></div><blockquote class=3D"yiv0=
375592993gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex;"><div style=3D"text-align:left;direct=
ion:ltr;"><div>Hi, is this actually an nv50 GPU, or some other model? I can=
 try to take a closer look at this</div><div><br clear=3D"none"></div><div>=
On Sun, 2019-06-16 at 10:28 -0400, Ilia Mirkin wrote:</div><blockquote type=
=3D"cite" style=3D"margin:0px 0px 0px 0.8ex;border-left:2px solid rgb(114,1=
59,207);padding-left:1ex;"><div dir=3D"ltr">I don't really see anything bet=
ween v5.0..v5.1 which would account for this. Could have been a subtle chan=
ge to the i2c logic somewhere. The fastest way to identify the problem woul=
d be to do a bisect on the kernel to identify the commit that caused this. =
There are many guides for this online.</div><br clear=3D"none"><div class=
=3D"yiv0375592993gmail_quote"><div class=3D"yiv0375592993gmail_attr" dir=3D=
"ltr">On Sat, Jun 15, 2019 at 12:17 PM Mar Mel &lt;<a rel=3D"nofollow" shap=
e=3D"rect" ymailto=3D"mailto:marmel6942-/E1597aS9LQAvxtiuMwx3w@public.gmane.org" target=3D"_blank" href=
=3D"mailto:marmel6942-/E1597aS9LQAvxtiuMwx3w@public.gmane.org">marmel6942-/E1597aS9LQAvxtiuMwx3w@public.gmane.org</a>&gt; wrote:<br cle=
ar=3D"none"></div><blockquote type=3D"cite" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:2px solid rgb(114,159,207);padding-left:1ex;"><div><div clas=
s=3D"yiv0375592993gmail-m_614245679332240585gmail-m_6577269616604786429ydpb=
69c7536yahoo-style-wrap" style=3D""><div></div>
        <div>Unfortunately, even with this change now reverted in kernel 5.=
1.10, the fan speed issue persists.</div><div><br clear=3D"none"></div><div=
>If someone could point me in the direction of a relevant commit(s) I'll ha=
ppily file a bug report.</div><div><br clear=3D"none"></div>
       =20
        </div><div class=3D"yiv0375592993gmail-m_614245679332240585gmail-m_=
6577269616604786429yahoo_quoted" id=3D"yiv0375592993gmail-m_614245679332240=
585gmail-m_6577269616604786429yahoo_quoted_0639155532">
            <div style=3D"">
               =20
                <div>
                    On Thursday, June 13, 2019, 11:19:25 AM EDT, Mar Mel &l=
t;<a rel=3D"nofollow" shape=3D"rect" ymailto=3D"mailto:marmel6942-/E1597aS9LQAvxtiuMwx3w@public.gmane.org=
" target=3D"_blank" href=3D"mailto:marmel6942-/E1597aS9LQAvxtiuMwx3w@public.gmane.org">marmel6942@yahoo.c=
om</a>&gt; wrote:
                </div>
                <div><br clear=3D"none"></div>
                <div><br clear=3D"none"></div>
                <div><div id=3D"yiv0375592993gmail-m_614245679332240585gmai=
l-m_6577269616604786429yiv3381411794"><div><div class=3D"yiv0375592993gmail=
-m_614245679332240585gmail-m_6577269616604786429yiv3381411794yahoo-style-wr=
ap" style=3D""><div>As of kernel 5.1.9, on resume from suspend, my NV50 fan=
 runs at full speed. <br clear=3D"none"></div><div><br clear=3D"none"></div=
><div>Not sure if it has to do with this new config option (<span>NOUVEAU_L=
EGACY_CTX_SUPPORT)?</span><br clear=3D"none"></div><div><br clear=3D"none">=
</div><div>This issue is not present using kernel 5.0.21.</div><div><br cle=
ar=3D"none"></div><div>Years ago I filed a similar issue:<br clear=3D"none"=
></div><div><br clear=3D"none"></div><div><a rel=3D"nofollow" shape=3D"rect=
" class=3D"yiv0375592993gmail-m_614245679332240585gmail-m_65772696166047864=
29yiv3381411794enhancr_card_0655079240" target=3D"_blank" href=3D"https://b=
ugs.freedesktop.org/show_bug.cgi?id=3D60704">60704 =E2=80=93 [nouveau, git =
regression] - I2C PWM fan control broken on nv50 adt7475 on kernels 3.3.x+<=
/a></div><div><br clear=3D"none"></div><div>Thanks.<br clear=3D"none"></div=
><div><br clear=3D"none"></div><div><br clear=3D"none"></div><div class=3D"=
yiv0375592993gmail-m_614245679332240585gmail-m_6577269616604786429yiv338141=
1794ydp73b97a3ayahoo-link-enhancr-card yiv0375592993gmail-m_614245679332240=
585gmail-m_6577269616604786429yiv3381411794ydp73b97a3ayahoo-link-enhancr-no=
t-allow-cover yiv0375592993gmail-m_614245679332240585gmail-m_65772696166047=
86429yiv3381411794ydp73b97a3aymail-preserve-class yiv0375592993gmail-m_6142=
45679332240585gmail-m_6577269616604786429yiv3381411794ydp73b97a3aymail-pres=
erve-style" id=3D"yiv0375592993gmail-m_614245679332240585gmail-m_6577269616=
604786429yiv3381411794ydp73b97a3aenhancr_card_0655079240" style=3D"max-widt=
h:400px;font-family:Helvetica, Arial, sans-serif;"><a rel=3D"nofollow" shap=
e=3D"rect" class=3D"yiv0375592993gmail-m_614245679332240585gmail-m_65772696=
16604786429yiv3381411794ydp73b97a3ayahoo-enhancr-cardlink" target=3D"_blank=
" href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D60704" style=3D"te=
xt-decoration:none;color:rgb(0,0,0);"><table class=3D"yiv0375592993gmail-m_=
614245679332240585gmail-m_6577269616604786429yiv3381411794ydp73b97a3acard-w=
rapper yiv0375592993gmail-m_614245679332240585gmail-m_6577269616604786429yi=
v3381411794ydp73b97a3ayahoo-ignore-table" style=3D"max-width:400px;" cellsp=
acing=3D"0" cellpadding=3D"0" border=3D"0"><tbody><tr><td colspan=3D"1" row=
span=3D"1" width=3D"400"><table class=3D"yiv0375592993gmail-m_6142456793322=
40585gmail-m_6577269616604786429yiv3381411794ydp73b97a3acard yiv0375592993g=
mail-m_614245679332240585gmail-m_6577269616604786429yiv3381411794ydp73b97a3=
ayahoo-ignore-table" style=3D"max-width:400px;border-width:1px;border-style=
:solid;border-color:rgb(224,228,233);border-radius:2px;" width=3D"100%" cel=
lspacing=3D"0" cellpadding=3D"0" border=3D"0"><tbody><tr><td colspan=3D"1" =
rowspan=3D"1"><table class=3D"yiv0375592993gmail-m_614245679332240585gmail-=
m_6577269616604786429yiv3381411794ydp73b97a3acard-info yiv0375592993gmail-m=
_614245679332240585gmail-m_6577269616604786429yiv3381411794ydp73b97a3ayahoo=
-ignore-table" style=3D"background-color:rgb(255,255,255);background-repeat=
:repeat;background-image:none;background-size:auto;width:100%;max-width:400=
px;border-radius:0px 0px 2px 2px;border-top:1px solid rgb(224,228,233);" ce=
llspacing=3D"0" cellpadding=3D"0" border=3D"0"><tbody><tr><td colspan=3D"1"=
 rowspan=3D"1" style=3D"background-color:rgb(255,255,255);padding:16px 0px =
16px 12px;vertical-align:top;border-radius:0px 0px 0px 2px;"></td><td colsp=
an=3D"1" rowspan=3D"1" style=3D"vertical-align:middle;padding:12px 24px 16p=
x 12px;width:99%;font-family:Helvetica, Arial, sans-serif;border-radius:0px=
 0px 2px;"><h2 class=3D"yiv0375592993gmail-m_614245679332240585gmail-m_6577=
269616604786429yiv3381411794ydp73b97a3acard-title" style=3D"font-size:14px;=
line-height:19px;margin:0px 0px 6px;font-family:Helvetica, Arial, sans-seri=
f;color:rgb(38,40,42);">60704 =E2=80=93 [nouveau, git regression] - I2C PWM=
 fan control broken on nv50 a...</h2><p class=3D"yiv0375592993gmail-m_61424=
5679332240585gmail-m_6577269616604786429yiv3381411794ydp73b97a3acard-descri=
ption" style=3D"font-size:12px;line-height:16px;margin:0px;color:rgb(151,15=
5,167);"></p></td></tr></tbody></table></td></tr></tbody></table></td></tr>=
</tbody></table></a></div><div><br clear=3D"none"></div><div><br clear=3D"n=
one"></div></div></div></div></div>
            </div>
        </div></div>_______________________________________________<br clea=
r=3D"none">
Nouveau mailing list<br clear=3D"none">
<a rel=3D"nofollow" shape=3D"rect" ymailto=3D"mailto:Nouveau-PD4FTy7X32lzq7FAFJ/aeQ@public.gmane.org=
top.org" target=3D"_blank" href=3D"mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org">No=
uveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org</a><br clear=3D"none">
<a rel=3D"nofollow" shape=3D"rect" target=3D"_blank" href=3D"https://lists.=
freedesktop.org/mailman/listinfo/nouveau">https://lists.freedesktop.org/mai=
lman/listinfo/nouveau</a></blockquote></div>
<pre>_______________________________________________</pre><pre>Nouveau mail=
ing list</pre><a rel=3D"nofollow" shape=3D"rect" ymailto=3D"mailto:Nouveau@=
lists.freedesktop.org" target=3D"_blank" href=3D"mailto:Nouveau-PD4FTy7X32mMSPqsTGOZug@public.gmane.org=
esktop.org"><pre>Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org</pre></a><pre><br clear=3D"n=
one"></pre><a rel=3D"nofollow" shape=3D"rect" target=3D"_blank" href=3D"htt=
ps://lists.freedesktop.org/mailman/listinfo/nouveau"><pre>https://lists.fre=
edesktop.org/mailman/listinfo/nouveau</pre></a></blockquote><div><span></sp=
an><pre>-- <br clear=3D"none"></pre><div style=3D"">Cheers,</div><div style=
=3D"">=09Lyude Paul</div></div></div>
</blockquote></div></div></div></div></div>
            </div>
        </div></body></html>
------=_Part_625694_2100451377.1561264488080--

--===============1688521315==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1688521315==--
