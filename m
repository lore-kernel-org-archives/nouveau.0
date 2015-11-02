From: Daniel Melo Jorge da Cunha <dmjcunha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: help with push
Date: Mon, 2 Nov 2015 14:31:26 -0300
Message-ID: <CANbfre6ywp5quasRAsF-69DtYAj5XY3GwKXK4HtUk92G-Y22gw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0244985297=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============0244985297==
Content-Type: multipart/alternative; boundary=001a114a6b989fdf2405239225d0

--001a114a6b989fdf2405239225d0
Content-Type: text/plain; charset=UTF-8

Hi, sorry if I misunderstood everything...

In the file src/gallium/drivers/nouveau/nv30/nv30_screen.c there is loans of
PUSH_DATA which is basically *push->curr = data;

I'm thinking that somehow push->curr is the bo->map = drm_mmap(...)
that is called in nouveau_bo_map. But I cannot see how they are linked...
Because when nouveau_bo_map calls nouveau_bo_wait
push = cli_push_get(client, bo) returns NULL...

Is push->curr the region of memory that we send data to the card?
If so, how is it mapped?
Has bo->map something to do with it? If so, how are they linked?

--001a114a6b989fdf2405239225d0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div><div><div>Hi, sorry if I misunder=
stood everything...<br><br></div>In the file src/gallium/drivers/nouveau/nv=
30/nv30_screen.c there is loans of<br></div>PUSH_DATA which is basically *p=
ush-&gt;curr =3D data;<br><br></div>I&#39;m thinking that somehow push-&gt;=
curr is the bo-&gt;map =3D drm_mmap(...)<br></div>that is called in nouveau=
_bo_map. But I cannot see how they are linked...<br></div><div>Because when=
 nouveau_bo_map calls nouveau_bo_wait<br>push =3D <span class=3D"">cli_push=
_get</span>(client, bo) returns NULL...<br></div><div><br></div>Is push-&gt=
;curr the region of memory that we send data to the card?<br></div>If so, h=
ow is it mapped?<br></div>Has bo-&gt;map something to do with it? If so, ho=
w are they linked?<br></div>

--001a114a6b989fdf2405239225d0--

--===============0244985297==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0244985297==--
