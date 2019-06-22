From: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: NOUVEAU_LEGACY_CTX_SUPPORT Fan Speed
Date: Sat, 22 Jun 2019 14:16:59 -0400
Message-ID: <ce271f475953d1580c2fa8ffb561eca1b0426993.camel@redhat.com>
References: <1119631907.971876.1560439165339.ref@mail.yahoo.com>
 <1119631907.971876.1560439165339@mail.yahoo.com>
 <495587496.1966749.1560615436420@mail.yahoo.com>
 <CAKb7UvhZYDRteWUmy0QUT1p5Tk+i_Ky0bFJU23pJSG7LHKLQYg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0382902422=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7UvhZYDRteWUmy0QUT1p5Tk+i_Ky0bFJU23pJSG7LHKLQYg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>, Mar Mel <marmel6942-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>
Cc: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org


--===============0382902422==
Content-Type: multipart/alternative; boundary="=-3I0k6uJjPJvf8VRYJir6"


--=-3I0k6uJjPJvf8VRYJir6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi, is this actually an nv50 GPU, or some other model? I can try to take a
closer look at this
On Sun, 2019-06-16 at 10:28 -0400, Ilia Mirkin wrote:
> I don't really see anything between v5.0..v5.1 which would account for this.
> Could have been a subtle change to the i2c logic somewhere. The fastest way
> to identify the problem would be to do a bisect on the kernel to identify
> the commit that caused this. There are many guides for this online.
> 
> On Sat, Jun 15, 2019 at 12:17 PM Mar Mel <marmel6942-/E1597aS9LQAvxtiuMwx3w@public.gmane.org> wrote:
> >         Unfortunately, even with this change now reverted in kernel
> > 5.1.10, the fan speed issue persists.
> > If someone could point me in the direction of a relevant commit(s) I'll
> > happily file a bug report.
> > 
> >         
> >         
> > 
> >             
> >                 
> >                 
> >                     On Thursday, June 13, 2019, 11:19:25 AM EDT, Mar Mel <
> > marmel6942-/E1597aS9LQAvxtiuMwx3w@public.gmane.org> wrote:
> >                 
> >                 
> > 
> >                 
> > 
> >                 As of kernel 5.1.9, on resume from suspend, my NV50 fan
> > runs at full speed. 
> > 
> > Not sure if it has to do with this new config option
> > (NOUVEAU_LEGACY_CTX_SUPPORT)?
> > 
> > This issue is not present using kernel 5.0.21.
> > 
> > Years ago I filed a similar issue:
> > 
> > 60704 – [nouveau, git regression] - I2C PWM fan control broken on nv50
> > adt7475 on kernels 3.3.x+
> > 
> > Thanks.
> > 
> > 
> > 60704 – [nouveau, git regression] - I2C PWM fan control broken on nv50
> > a...
> > 
> > 
> > 
> >             
> >         
> > _______________________________________________
> > 
> > Nouveau mailing list
> > 
> > Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> > 
> > https://lists.freedesktop.org/mailman/listinfo/nouveau
> 
> _______________________________________________Nouveau mailing 
> listNouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
-- 
Cheers,
	Lyude Paul

--=-3I0k6uJjPJvf8VRYJir6
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr"><head></head><body style=3D"text-align:left; direction:lt=
r;"><div>Hi, is this actually an nv50 GPU, or some other model? I can try t=
o take a closer look at this</div><div><br></div><div>On Sun, 2019-06-16 at=
 10:28 -0400, Ilia Mirkin wrote:</div><blockquote type=3D"cite" style=3D"ma=
rgin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><div dir=
=3D"ltr">I don't really see anything between v5.0..v5.1 which would account=
 for this. Could have been a subtle change to the i2c logic somewhere. The =
fastest way to identify the problem would be to do a bisect on the kernel t=
o identify the commit that caused this. There are many guides for this onli=
ne.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Sat, Jun 15, 2019 at 12:17 PM Mar Mel &lt;<a href=3D"mailto:marmel694=
2@yahoo.com">marmel6942-/E1597aS9LQAvxtiuMwx3w@public.gmane.org</a>&gt; wrote:<br></div><blockquote type=
=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding=
-left:1ex"><div><div class=3D"gmail-m_6577269616604786429ydpb69c7536yahoo-s=
tyle-wrap" style=3D"font-family:&quot;Helvetica Neue&quot;,Helvetica,Arial,=
sans-serif;font-size:13px"><div></div>
        <div>Unfortunately, even with this change now reverted in kernel 5.=
1.10, the fan speed issue persists.</div><div><br></div><div>If someone cou=
ld point me in the direction of a relevant commit(s) I'll happily file a bu=
g report.</div><div><br></div>
       =20
        </div><div id=3D"gmail-m_6577269616604786429yahoo_quoted_0639155532=
" class=3D"gmail-m_6577269616604786429yahoo_quoted">
            <div style=3D"font-family:&quot;Helvetica Neue&quot;,Helvetica,=
Arial,sans-serif;font-size:13px;color:rgb(38,40,42)">
               =20
                <div>
                    On Thursday, June 13, 2019, 11:19:25 AM EDT, Mar Mel &l=
t;<a href=3D"mailto:marmel6942-/E1597aS9LQAvxtiuMwx3w@public.gmane.org" target=3D"_blank">marmel6942@yaho=
o.com</a>&gt; wrote:
                </div>
                <div><br></div>
                <div><br></div>
                <div><div id=3D"gmail-m_6577269616604786429yiv3381411794"><=
div><div class=3D"gmail-m_6577269616604786429yiv3381411794yahoo-style-wrap"=
 style=3D"font-family:&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif=
;font-size:13px"><div>As of kernel 5.1.9, on resume from suspend, my NV50 f=
an runs at full speed. <br></div><div><br></div><div>Not sure if it has to =
do with this new config option (<span>NOUVEAU_LEGACY_CTX_SUPPORT)?</span><b=
r></div><div><br></div><div>This issue is not present using kernel 5.0.21.<=
/div><div><br></div><div>Years ago I filed a similar issue:<br></div><div><=
br></div><div><a rel=3D"nofollow" href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D60704" class=3D"gmail-m_6577269616604786429yiv3381411794enhan=
cr_card_0655079240" target=3D"_blank">60704 =E2=80=93 [nouveau, git regress=
ion] - I2C PWM fan control broken on nv50 adt7475 on kernels 3.3.x+</a></di=
v><div><br></div><div>Thanks.<br></div><div><br></div><div><br></div><div i=
d=3D"gmail-m_6577269616604786429yiv3381411794ydp73b97a3aenhancr_card_065507=
9240" class=3D"gmail-m_6577269616604786429yiv3381411794ydp73b97a3ayahoo-lin=
k-enhancr-card gmail-m_6577269616604786429yiv3381411794ydp73b97a3ayahoo-lin=
k-enhancr-not-allow-cover gmail-m_6577269616604786429yiv3381411794ydp73b97a=
3aymail-preserve-class gmail-m_6577269616604786429yiv3381411794ydp73b97a3ay=
mail-preserve-style" style=3D"max-width:400px;font-family:Helvetica,Arial,s=
ans-serif"><a rel=3D"nofollow" href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D60704" style=3D"text-decoration:none;color:rgb(0,0,0)" class=3D"=
gmail-m_6577269616604786429yiv3381411794ydp73b97a3ayahoo-enhancr-cardlink" =
target=3D"_blank"><table class=3D"gmail-m_6577269616604786429yiv3381411794y=
dp73b97a3acard-wrapper gmail-m_6577269616604786429yiv3381411794ydp73b97a3ay=
ahoo-ignore-table" style=3D"max-width:400px" cellspacing=3D"0" cellpadding=
=3D"0" border=3D"0"><tbody><tr><td width=3D"400"><table class=3D"gmail-m_65=
77269616604786429yiv3381411794ydp73b97a3acard gmail-m_6577269616604786429yi=
v3381411794ydp73b97a3ayahoo-ignore-table" style=3D"max-width:400px;border-w=
idth:1px;border-style:solid;border-color:rgb(224,228,233);border-radius:2px=
" width=3D"100%" cellspacing=3D"0" cellpadding=3D"0" border=3D"0"><tbody><t=
r><td><table class=3D"gmail-m_6577269616604786429yiv3381411794ydp73b97a3aca=
rd-info gmail-m_6577269616604786429yiv3381411794ydp73b97a3ayahoo-ignore-tab=
le" style=3D"background-color:rgb(255,255,255);background-repeat:repeat;bac=
kground-image:none;background-size:auto;width:100%;max-width:400px;border-r=
adius:0px 0px 2px 2px;border-top:1px solid rgb(224,228,233)" cellspacing=3D=
"0" cellpadding=3D"0" border=3D"0"><tbody><tr><td style=3D"background-color=
:rgb(255,255,255);padding:16px 0px 16px 12px;vertical-align:top;border-radi=
us:0px 0px 0px 2px"></td><td style=3D"vertical-align:middle;padding:12px 24=
px 16px 12px;width:99%;font-family:Helvetica,Arial,sans-serif;border-radius=
:0px 0px 2px"><h2 class=3D"gmail-m_6577269616604786429yiv3381411794ydp73b97=
a3acard-title" style=3D"font-size:14px;line-height:19px;margin:0px 0px 6px;=
font-family:Helvetica,Arial,sans-serif;color:rgb(38,40,42)">60704 =E2=80=93=
 [nouveau, git regression] - I2C PWM fan control broken on nv50 a...</h2><p=
 class=3D"gmail-m_6577269616604786429yiv3381411794ydp73b97a3acard-descripti=
on" style=3D"font-size:12px;line-height:16px;margin:0px;color:rgb(151,155,1=
67)"></p></td></tr></tbody></table></td></tr></tbody></table></td></tr></tb=
ody></table></a></div><div><br></div><div><br></div></div></div></div></div=
>
            </div>
        </div></div>_______________________________________________<br>
Nouveau mailing list<br>
<a href=3D"mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" target=3D"_blank">Nouveau@=
lists.freedesktop.org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/nouveau" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman/listinfo=
/nouveau</a></blockquote></div>
<pre>_______________________________________________</pre><pre>Nouveau mail=
ing list</pre><a href=3D"mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org"><pre>Nouveau=
@lists.freedesktop.org</pre></a><pre><br></pre><a href=3D"https://lists.fre=
edesktop.org/mailman/listinfo/nouveau"><pre>https://lists.freedesktop.org/m=
ailman/listinfo/nouveau</pre></a></blockquote><div><span><pre>-- <br></pre>=
<div style=3D"width: 78ch;">Cheers,</div><div style=3D"width: 78ch;">	Lyude=
 Paul</div></span></div></body></html>

--=-3I0k6uJjPJvf8VRYJir6--


--===============0382902422==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0382902422==--
