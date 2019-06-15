From: Mar Mel <marmel6942-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>
Subject: Re: NOUVEAU_LEGACY_CTX_SUPPORT Fan Speed
Date: Sat, 15 Jun 2019 16:17:16 +0000 (UTC)
Message-ID: <495587496.1966749.1560615436420@mail.yahoo.com>
References: <1119631907.971876.1560439165339.ref@mail.yahoo.com>
 <1119631907.971876.1560439165339@mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1659026647=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1119631907.971876.1560439165339-sAHhhX/85wgbqTNvkayDYw@public.gmane.org>
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

--===============1659026647==
Content-Type: multipart/alternative;
	boundary="----=_Part_1966748_1458472801.1560615436418"

------=_Part_1966748_1458472801.1560615436418
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

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



 =20
------=_Part_1966748_1458472801.1560615436418
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html xmlns=3D"http://www.w3.org/1999/xhtml" xmlns:v=3D"urn:schemas-microso=
ft-com:vml" xmlns:o=3D"urn:schemas-microsoft-com:office:office"><head><!--[=
if gte mso 9]><xml><o:OfficeDocumentSettings><o:AllowPNG/><o:PixelsPerInch>=
96</o:PixelsPerInch></o:OfficeDocumentSettings></xml><![endif]--></head><bo=
dy><div class=3D"ydpb69c7536yahoo-style-wrap" style=3D"font-family: Helveti=
ca Neue, Helvetica, Arial, sans-serif; font-size: 13px;"><div></div>
        <div>Unfortunately, even with this change now reverted in kernel 5.=
1.10, the fan speed issue persists.</div><div><br></div><div>If someone cou=
ld point me in the direction of a relevant commit(s) I'll happily file a bu=
g report.</div><div><br></div>
       =20
        </div><div id=3D"yahoo_quoted_0639155532" class=3D"yahoo_quoted">
            <div style=3D"font-family:'Helvetica Neue', Helvetica, Arial, s=
ans-serif;font-size:13px;color:#26282a;">
               =20
                <div>
                    On Thursday, June 13, 2019, 11:19:25 AM EDT, Mar Mel &l=
t;marmel6942-/E1597aS9LQAvxtiuMwx3w@public.gmane.org&gt; wrote:
                </div>
                <div><br></div>
                <div><br></div>
                <div><div id=3D"yiv3381411794"><!--[if gte mso 9]><xml><o:O=
fficeDocumentSettings><o:AllowPNG/><o:PixelsPerInch>96</o:PixelsPerInch></o=
:OfficeDocumentSettings></xml><![endif]--><div><div class=3D"yiv3381411794y=
ahoo-style-wrap" style=3D"font-family:Helvetica Neue, Helvetica, Arial, san=
s-serif;font-size:13px;"><div>As of kernel 5.1.9, on resume from suspend, m=
y NV50 fan runs at full speed. <br></div><div><br></div><div>Not sure if it=
 has to do with this new config option (<span>NOUVEAU_LEGACY_CTX_SUPPORT)?<=
/span><br></div><div><br></div><div>This issue is not present using kernel =
5.0.21.</div><div><br></div><div>Years ago I filed a similar issue:<br></di=
v><div><br></div><div><a rel=3D"nofollow" target=3D"_blank" href=3D"https:/=
/bugs.freedesktop.org/show_bug.cgi?id=3D60704" class=3D"yiv3381411794enhanc=
r_card_0655079240">60704 =E2=80=93 [nouveau, git regression] - I2C PWM fan =
control broken on nv50 adt7475 on kernels 3.3.x+</a></div><div><br></div><d=
iv>Thanks.<br></div><div><br></div><div><br></div><div id=3D"yiv3381411794y=
dp73b97a3aenhancr_card_0655079240" class=3D"yiv3381411794ydp73b97a3ayahoo-l=
ink-enhancr-card yiv3381411794ydp73b97a3ayahoo-link-enhancr-not-allow-cover=
 yiv3381411794ydp73b97a3aymail-preserve-class yiv3381411794ydp73b97a3aymail=
-preserve-style" style=3D"max-width:400px;font-family:Helvetica, Arial, san=
s-serif;" data-url=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D60704"=
 data-type=3D"YENHANCER" data-size=3D"MEDIUM"><a rel=3D"nofollow" target=3D=
"_blank" href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D60704" styl=
e=3D"text-decoration:none !important;color:#000 !important;" class=3D"yiv33=
81411794ydp73b97a3ayahoo-enhancr-cardlink"><table class=3D"yiv3381411794ydp=
73b97a3acard-wrapper yiv3381411794ydp73b97a3ayahoo-ignore-table" style=3D"m=
ax-width:400px;" cellspacing=3D"0" cellpadding=3D"0" border=3D"0"><tbody><t=
r><td width=3D"400"><table class=3D"yiv3381411794ydp73b97a3acard yiv3381411=
794ydp73b97a3ayahoo-ignore-table" style=3D"max-width:400px;border-width:1px=
;border-style:solid;border-color:rgb(224, 228, 233);border-radius:2px;" wid=
th=3D"100%" cellspacing=3D"0" cellpadding=3D"0" border=3D"0"><tbody><tr><td=
><table class=3D"yiv3381411794ydp73b97a3acard-info yiv3381411794ydp73b97a3a=
yahoo-ignore-table" style=3D"background-color:rgb(255, 255, 255);background=
-repeat:repeat;background-attachment:scroll;background-image:none;backgroun=
d-size:auto;position:relative;z-index:2;width:100%;max-width:400px;border-r=
adius:0px 0px 2px 2px;border-top:1px solid rgb(224, 228, 233);" cellspacing=
=3D"0" cellpadding=3D"0" border=3D"0"><tbody><tr><td style=3D"background-co=
lor:#ffffff;padding:16px 0 16px 12px;vertical-align:top;border-radius:0 0 0=
 2px;"></td><td style=3D"vertical-align:middle;padding:12px 24px 16px 12px;=
width:99%;font-family:Helvetica, Arial, sans-serif;border-radius:0 0 2px 0;=
"><h2 class=3D"yiv3381411794ydp73b97a3acard-title" style=3D"font-size:14px;=
line-height:19px;margin:0px 0px 6px;font-family:Helvetica, Arial, sans-seri=
f;color:rgb(38, 40, 42);">60704 =E2=80=93 [nouveau, git regression] - I2C P=
WM fan control broken on nv50 a...</h2><p class=3D"yiv3381411794ydp73b97a3a=
card-description" style=3D"font-size:12px;line-height:16px;margin:0px;color=
:rgb(151, 155, 167);"></p></td></tr></tbody></table></td></tr></tbody></tab=
le></td></tr></tbody></table></a></div><div><br></div><div><br></div></div>=
</div></div></div>
            </div>
        </div></body></html>
------=_Part_1966748_1458472801.1560615436418--

--===============1659026647==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1659026647==--
