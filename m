From: Dan Moulding <dmoulding-BUHhN+a2lJ4@public.gmane.org>
Subject: Re:
 =?utf-8?q?=5BPATCH=5D_drm/nouveau/gr/gf100=3A_Log_info_?=
 =?utf-8?q?message_when_loading_external_firmware?=
Date: Thu, 29 Sep 2016 16:57:42 +0000 (GMT)
Message-ID: <00690da3-6595-47d3-ab3f-28147730bf69@me.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0156860447=="
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


--===============0156860447==
Content-type: multipart/alternative;
 boundary="Boundary_(ID_wWGrgPbanQOvFgvgMBuwjg)"


--Boundary_(ID_wWGrgPbanQOvFgvgMBuwjg)
Content-type: text/plain; charset=utf-8; format=flowed
Content-transfer-encoding: quoted-printable

Any comments? I also think for developers, it's good to be able to see fro=
m someone's dmesg output whether or not external firmware was loaded. Unle=
ss there is some other way to do that without this log message?=0A=0A-- Da=
n=0A=0AOn Sep 17, 2016, at 02:04 AM, Dan Moulding <dmoulding-BUHhN+a2lJ4@public.gmane.org> wrote=
:=0A=0AIn previous versions, it used to log an info message when loading=0A=
external GR firmware. But that info message was (inadvertently?)=0Aremoved=
 in commit 18cd5bc. This just adds it back. It's nice for users=0Ato be ab=
le to confirm whether external firmware was loaded or not.=0A=0ASigned-off=
-by: Dan Moulding <dmoulding-BUHhN+a2lJ4@public.gmane.org>=0A---=0Adrivers/gpu/drm/nouveau/nvkm/=
engine/gr/gf100.c | 1 +=0A1 file changed, 1 insertion(+)=0A=0Adiff --git a=
/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c b/drivers/gpu/drm/nouveau/=
nvkm/engine/gr/gf100.c=0Aindex ae9ab5b..0ed56ff 100644=0A--- a/drivers/gpu=
/drm/nouveau/nvkm/engine/gr/gf100.c=0A+++ b/drivers/gpu/drm/nouveau/nvkm/e=
ngine/gr/gf100.c=0A@@ -1805,6 +1805,7 @@ gf100_gr_new_(const struct gf100_=
gr_func *func, struct nvkm_device *device,=0A=C2=A0 =C2=A0 =C2=A0return re=
t;=0A=0A=C2=A0 =C2=A0 =C2=A0if (gr->firmware) {=0A+ =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0nvkm_info(&gr->base.engine.subdev, "using external firmware\n");=
=0A=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (gf100_gr_cto=
r_fw(gr, "fecs_inst", &gr->fuc409c) ||=0A=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 gf100_gr_ctor_fw(gr, "fecs_data", &gr->fuc409d) ||=0A=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gf100_gr_ctor_fw(gr, "gpccs_inst", &gr->fuc41=
ac) ||=0A-- =0A2.7.3=0A=0A=

--Boundary_(ID_wWGrgPbanQOvFgvgMBuwjg)
Content-type: multipart/related;
 boundary="Boundary_(ID_fKuDVeYaMtwEnKa9SCQX4w)"; type="text/html"


--Boundary_(ID_fKuDVeYaMtwEnKa9SCQX4w)
Content-type: text/html; CHARSET=US-ASCII
Content-transfer-encoding: quoted-printable

<html><body><div>Any comments? I also think for developers, it's good to be able to se=
e from someone's dmesg output whether or not external firmware was loaded.=
 Unless there is some other way to do that without this log message?</div>=
<div><br data-mce-bogus=3D"1"></div><div>-- Dan</div><div><br>On Sep 17, 2=
016, at 02:04 AM, Dan Moulding &lt;dmoulding-BUHhN+a2lJ4@public.gmane.org&gt; wrote:<br><br></di=
v><div><blockquote type=3D"cite"><div class=3D"msg-quote"><div class=3D"_s=
tretch"><span class=3D"body-text-content">In previous versions, it used to=
 log an info message when loading<br>external GR firmware. But that info m=
essage was (inadvertently?)<br>removed in commit 18cd5bc. This just adds i=
t back. It's nice for users<br>to be able to confirm whether external firm=
ware was loaded or not.<br><br>Signed-off-by: Dan Moulding &lt;dmoulding@m=
e.com&gt;<br>---<br> drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c | 1 +<=
br> 1 file changed, 1 insertion(+)<br><br>diff --git a/drivers/gpu/drm/nou=
veau/nvkm/engine/gr/gf100.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100=
.c<br>index ae9ab5b..0ed56ff 100644<br>--- a/drivers/gpu/drm/nouveau/nvkm/=
engine/gr/gf100.c<br>+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c<=
br>@@ -1805,6 +1805,7 @@ gf100_gr_new_(const struct gf100_gr_func *func, s=
truct nvkm_device *device,<br> &nbsp; &nbsp; &nbsp;return ret;<br> <br> &n=
bsp; &nbsp; &nbsp;if (gr-&gt;firmware) {<br>+ &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;nvkm_info(&amp;gr-&gt;base.engine.subdev, "using external firmware\n=
");<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (gf100_g=
r_ctor_fw(gr, "fecs_inst", &amp;gr-&gt;fuc409c) ||<br> &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; gf100_gr_ctor_fw(gr, "fecs_data", &amp;gr-&gt;fuc40=
9d) ||<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; gf100_gr_ctor_fw(gr, =
"gpccs_inst", &amp;gr-&gt;fuc41ac) ||<br>-- <br>2.7.3<br><br></span></div>=
</div></blockquote></div></body></html>=

--Boundary_(ID_fKuDVeYaMtwEnKa9SCQX4w)--

--Boundary_(ID_wWGrgPbanQOvFgvgMBuwjg)--

--===============0156860447==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0156860447==--
