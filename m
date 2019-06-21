From: Mar Mel <marmel6942-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>
Subject: Re: NOUVEAU_LEGACY_CTX_SUPPORT Fan Speed
Date: Fri, 21 Jun 2019 20:28:19 +0000 (UTC)
Message-ID: <2129174013.254112.1561148899599@mail.yahoo.com>
References: <1119631907.971876.1560439165339.ref@mail.yahoo.com>
 <1119631907.971876.1560439165339@mail.yahoo.com>
 <495587496.1966749.1560615436420@mail.yahoo.com>
 <CAKb7UvhZYDRteWUmy0QUT1p5Tk+i_Ky0bFJU23pJSG7LHKLQYg@mail.gmail.com>
 <CACvgo518KhG9LFBFqFnRSDXtwhbM5Oc6PHY_vNtLSLiSemJeiA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0146715787=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CACvgo518KhG9LFBFqFnRSDXtwhbM5Oc6PHY_vNtLSLiSemJeiA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>, Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============0146715787==
Content-Type: multipart/alternative;
	boundary="----=_Part_254111_187813297.1561148899597"

------=_Part_254111_187813297.1561148899597
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

 Thanks for finding this Emil! The change you point out also landed on 4.19=
.49 and I am able to reproduce the fan speed issue with that kernel as well=
, whereas previous 4.19.x series kernels were fine.
I'll attempt to build both the latest 4.19.x and 5.1.x stable kernels with =
that patch reverted and see if it's the sole culprit.
    On Friday, June 21, 2019, 1:32:19 PM EDT, Emil Velikov <emil.l.velikov@=
gmail.com> wrote: =20
=20
 Some weird interaction with disabling the i2c access, in the following pat=
ch perhaps?
commit cd68344b283174a9b38e9488d5a929464e1f417c
Author: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date: =C2=A0 Tue Apr 9 16:23:30 2019 -0400

=C2=A0 =C2=A0 drm/nouveau/i2c: Disable i2c bus access after ->fini()

On Sun, 16 Jun 2019 at 15:28, Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> wrote:

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
_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
 =20
------=_Part_254111_187813297.1561148899597
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html xmlns=3D"http://www.w3.org/1999/xhtml" xmlns:v=3D"urn:schemas-microso=
ft-com:vml" xmlns:o=3D"urn:schemas-microsoft-com:office:office"><head><!--[=
if gte mso 9]><xml><o:OfficeDocumentSettings><o:AllowPNG/><o:PixelsPerInch>=
96</o:PixelsPerInch></o:OfficeDocumentSettings></xml><![endif]--></head><bo=
dy><div class=3D"ydpcd1ca9cayahoo-style-wrap" style=3D"font-family:Helvetic=
a Neue, Helvetica, Arial, sans-serif;font-size:13px;"><div></div>
        <div>Thanks for finding this Emil! The change you point out also la=
nded on 4.19.49 and I am able to reproduce the fan speed issue with that ke=
rnel as well, whereas previous 4.19.x series kernels were fine.</div><div><=
br></div><div>I'll attempt to build both the latest 4.19.x and 5.1.x stable=
 kernels with that patch reverted and see if it's the sole culprit.</div><d=
iv><br></div>
       =20
        </div><div id=3D"ydpcf127bc9yahoo_quoted_1946356900" class=3D"ydpcf=
127bc9yahoo_quoted">
            <div style=3D"font-family:'Helvetica Neue', Helvetica, Arial, s=
ans-serif;font-size:13px;color:#26282a;">
               =20
                <div>
                    On Friday, June 21, 2019, 1:32:19 PM EDT, Emil Velikov =
&lt;emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org&gt; wrote:
                </div>
                <div><br></div>
                <div><br></div>
                <div><div id=3D"ydpcf127bc9yiv2478927360"><div><div dir=3D"=
ltr"><div>Some weird interaction with disabling the i2c access, in the foll=
owing patch perhaps?</div><div dir=3D"ltr"><br clear=3D"none"></div><div di=
r=3D"ltr">commit cd68344b283174a9b38e9488d5a929464e1f417c<br clear=3D"none"=
>Author: Lyude Paul &lt;<a shape=3D"rect" href=3D"mailto:lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" =
rel=3D"nofollow" target=3D"_blank">lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org</a>&gt;<br clear=3D"non=
e">Date: &nbsp; Tue Apr 9 16:23:30 2019 -0400<br clear=3D"none"><br clear=
=3D"none">&nbsp; &nbsp; drm/nouveau/i2c: Disable i2c bus access after -&gt;=
fini()<br clear=3D"none"></div><br clear=3D"none"><div class=3D"ydpcf127bc9=
yiv2478927360gmail_quote"><div class=3D"ydpcf127bc9yiv2478927360gmail_attr"=
 dir=3D"ltr">On Sun, 16 Jun 2019 at 15:28, Ilia Mirkin &lt;<a shape=3D"rect=
" href=3D"mailto:imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org" rel=3D"nofollow" target=3D"_blank">i=
mirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org</a>&gt; wrote:<br clear=3D"none"></div><blockquote clas=
s=3D"ydpcf127bc9yiv2478927360gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex;"><div dir=3D"ltr"=
>I don't really see anything between v5.0..v5.1 which would account for thi=
s. Could have been a subtle change to the i2c logic somewhere. The fastest =
way to identify the problem would be to do a bisect on the kernel to identi=
fy the commit that caused this. There are many guides for this online.</div=
><br clear=3D"none"><div class=3D"ydpcf127bc9yiv2478927360gmail_quote"><div=
 class=3D"ydpcf127bc9yiv2478927360gmail_attr" dir=3D"ltr">On Sat, Jun 15, 2=
019 at 12:17 PM Mar Mel &lt;<a shape=3D"rect" href=3D"mailto:marmel6942@yah=
oo.com" rel=3D"nofollow" target=3D"_blank">marmel6942-/E1597aS9LQAvxtiuMwx3w@public.gmane.org</a>&gt; wro=
te:<br clear=3D"none"></div><blockquote class=3D"ydpcf127bc9yiv2478927360gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex;"><div><div class=3D"ydpcf127bc9yiv2478927360gmai=
l-m_425674517675831047gmail-m_6577269616604786429ydpb69c7536yahoo-style-wra=
p"><div></div>
        <div>Unfortunately, even with this change now reverted in kernel 5.=
1.10, the fan speed issue persists.</div><div><br clear=3D"none"></div><div=
>If someone could point me in the direction of a relevant commit(s) I'll ha=
ppily file a bug report.</div><div><br clear=3D"none"></div>
       =20
        </div><div class=3D"ydpcf127bc9yiv2478927360gmail-m_425674517675831=
047gmail-m_6577269616604786429yahoo_quoted" id=3D"ydpcf127bc9yiv2478927360g=
mail-m_425674517675831047gmail-m_6577269616604786429yahoo_quoted_0639155532=
">
            <div>
               =20
                <div>
                    On Thursday, June 13, 2019, 11:19:25 AM EDT, Mar Mel &l=
t;<a shape=3D"rect" href=3D"mailto:marmel6942-/E1597aS9LQAvxtiuMwx3w@public.gmane.org" rel=3D"nofollow" t=
arget=3D"_blank">marmel6942-/E1597aS9LQAvxtiuMwx3w@public.gmane.org</a>&gt; wrote:
                </div>
                <div><br clear=3D"none"></div>
                <div><br clear=3D"none"></div>
                <div><div id=3D"ydpcf127bc9yiv2478927360gmail-m_42567451767=
5831047gmail-m_6577269616604786429yiv3381411794"><div><div class=3D"ydpcf12=
7bc9yiv2478927360gmail-m_425674517675831047gmail-m_6577269616604786429yiv33=
81411794yahoo-style-wrap"><div>As of kernel 5.1.9, on resume from suspend, =
my NV50 fan runs at full speed. <br clear=3D"none"></div><div><br clear=3D"=
none"></div><div>Not sure if it has to do with this new config option (<spa=
n>NOUVEAU_LEGACY_CTX_SUPPORT)?</span><br clear=3D"none"></div><div><br clea=
r=3D"none"></div><div>This issue is not present using kernel 5.0.21.</div><=
div><br clear=3D"none"></div><div>Years ago I filed a similar issue:<br cle=
ar=3D"none"></div><div><br clear=3D"none"></div><div><a shape=3D"rect" clas=
s=3D"ydpcf127bc9yiv2478927360gmail-m_425674517675831047gmail-m_657726961660=
4786429yiv3381411794enhancr_card_0655079240" href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D60704" rel=3D"nofollow" target=3D"_blank">60704 =
=E2=80=93 [nouveau, git regression] - I2C PWM fan control broken on nv50 ad=
t7475 on kernels 3.3.x+</a></div><div><br clear=3D"none"></div><div>Thanks.=
<br clear=3D"none"></div><div><br clear=3D"none"></div><div><br clear=3D"no=
ne"></div><div class=3D"ydpcf127bc9yiv2478927360gmail-m_425674517675831047g=
mail-m_6577269616604786429yiv3381411794ydp73b97a3ayahoo-link-enhancr-card y=
dpcf127bc9yiv2478927360gmail-m_425674517675831047gmail-m_657726961660478642=
9yiv3381411794ydp73b97a3ayahoo-link-enhancr-not-allow-cover ydpcf127bc9yiv2=
478927360gmail-m_425674517675831047gmail-m_6577269616604786429yiv3381411794=
ydp73b97a3aymail-preserve-class ydpcf127bc9yiv2478927360gmail-m_42567451767=
5831047gmail-m_6577269616604786429yiv3381411794ydp73b97a3aymail-preserve-st=
yle" id=3D"ydpcf127bc9yiv2478927360gmail-m_425674517675831047gmail-m_657726=
9616604786429yiv3381411794ydp73b97a3aenhancr_card_0655079240" style=3D"max-=
width:400px;font-family:Helvetica, Arial, sans-serif;"><a shape=3D"rect" cl=
ass=3D"ydpcf127bc9yiv2478927360gmail-m_425674517675831047gmail-m_6577269616=
604786429yiv3381411794ydp73b97a3ayahoo-enhancr-cardlink" href=3D"https://bu=
gs.freedesktop.org/show_bug.cgi?id=3D60704" style=3D"text-decoration:none;c=
olor:rgb(0,0,0);" rel=3D"nofollow" target=3D"_blank"><table class=3D"ydpcf1=
27bc9yiv2478927360gmail-m_425674517675831047gmail-m_6577269616604786429yiv3=
381411794ydp73b97a3acard-wrapper ydpcf127bc9yiv2478927360gmail-m_4256745176=
75831047gmail-m_6577269616604786429yiv3381411794ydp73b97a3ayahoo-ignore-tab=
le" style=3D"max-width:400px;" cellspacing=3D"0" cellpadding=3D"0" border=
=3D"0"><tbody><tr><td colspan=3D"1" rowspan=3D"1" width=3D"400"><table clas=
s=3D"ydpcf127bc9yiv2478927360gmail-m_425674517675831047gmail-m_657726961660=
4786429yiv3381411794ydp73b97a3acard ydpcf127bc9yiv2478927360gmail-m_4256745=
17675831047gmail-m_6577269616604786429yiv3381411794ydp73b97a3ayahoo-ignore-=
table" style=3D"max-width:400px;border-width:1px;border-style:solid;border-=
color:rgb(224,228,233);border-radius:2px;" width=3D"100%" cellspacing=3D"0"=
 cellpadding=3D"0" border=3D"0"><tbody><tr><td colspan=3D"1" rowspan=3D"1">=
<table class=3D"ydpcf127bc9yiv2478927360gmail-m_425674517675831047gmail-m_6=
577269616604786429yiv3381411794ydp73b97a3acard-info ydpcf127bc9yiv247892736=
0gmail-m_425674517675831047gmail-m_6577269616604786429yiv3381411794ydp73b97=
a3ayahoo-ignore-table" style=3D"background-color:rgb(255,255,255);backgroun=
d-repeat:repeat;background-image:none;background-size:auto;width:100%;max-w=
idth:400px;border-radius:0px 0px 2px 2px;border-top:1px solid rgb(224,228,2=
33);" cellspacing=3D"0" cellpadding=3D"0" border=3D"0"><tbody><tr><td colsp=
an=3D"1" rowspan=3D"1" style=3D"background-color:rgb(255,255,255);padding:1=
6px 0px 16px 12px;vertical-align:top;border-radius:0px 0px 0px 2px;"></td><=
td colspan=3D"1" rowspan=3D"1" style=3D"vertical-align:middle;padding:12px =
24px 16px 12px;width:99%;font-family:Helvetica, Arial, sans-serif;border-ra=
dius:0px 0px 2px;"><h2 class=3D"ydpcf127bc9yiv2478927360gmail-m_42567451767=
5831047gmail-m_6577269616604786429yiv3381411794ydp73b97a3acard-title" style=
=3D"font-size:14px;line-height:19px;margin:0px 0px 6px;font-family:Helvetic=
a, Arial, sans-serif;color:rgb(38,40,42);">60704 =E2=80=93 [nouveau, git re=
gression] - I2C PWM fan control broken on nv50 a...</h2><p class=3D"ydpcf12=
7bc9yiv2478927360gmail-m_425674517675831047gmail-m_6577269616604786429yiv33=
81411794ydp73b97a3acard-description" style=3D"font-size:12px;line-height:16=
px;margin:0px;color:rgb(151,155,167);"></p></td></tr></tbody></table></td><=
/tr></tbody></table></td></tr></tbody></table></a></div><div><br clear=3D"n=
one"></div><div><br clear=3D"none"></div></div></div></div></div>
            </div>
        </div></div>_______________________________________________<br clea=
r=3D"none">
Nouveau mailing list<br clear=3D"none">
<a shape=3D"rect" href=3D"mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" rel=3D"nofo=
llow" target=3D"_blank">Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org</a><br clear=3D"none"=
>
<a shape=3D"rect" href=3D"https://lists.freedesktop.org/mailman/listinfo/no=
uveau" rel=3D"nofollow" target=3D"_blank">https://lists.freedesktop.org/mai=
lman/listinfo/nouveau</a></blockquote></div>
_______________________________________________<div class=3D"ydpcf127bc9yiv=
2478927360yqt1360240492" id=3D"ydpcf127bc9yiv2478927360yqtfd61884"><br clea=
r=3D"none">
Nouveau mailing list<br clear=3D"none">
<a shape=3D"rect" href=3D"mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" rel=3D"nofo=
llow" target=3D"_blank">Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org</a><br clear=3D"none"=
>
<a shape=3D"rect" href=3D"https://lists.freedesktop.org/mailman/listinfo/no=
uveau" rel=3D"nofollow" target=3D"_blank">https://lists.freedesktop.org/mai=
lman/listinfo/nouveau</a></div></blockquote></div></div></div></div></div>
            </div>
        </div></body></html>
------=_Part_254111_187813297.1561148899597--

--===============0146715787==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0146715787==--
