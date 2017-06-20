From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: [Bug 99900] nouveau: freeze / crash after kernel
	update to 4.10
Date: Tue, 20 Jun 2017 13:25:44 -0400
Message-ID: <CAKb7Uvj6Gj9OTJs7B_m_-R5AYFcqCnOJ6ADkdnt-37oWRMT06Q@mail.gmail.com>
References: <bug-99900-502@http.bugs.freedesktop.org/>
 <CAOesGMiES49o_Xt1GxsUj7+hivhcwdFECv8QfqiQqZjO57oj6w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0478910804=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAOesGMiES49o_Xt1GxsUj7+hivhcwdFECv8QfqiQqZjO57oj6w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DRI mailing list <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============0478910804==
Content-Type: multipart/alternative; boundary="001a114547daa608780552678aa1"

--001a114547daa608780552678aa1
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 20, 2017 at 12:54 PM, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote:

> Hey,
>
> This was reported back in February and it seems nobody's given a shit?
>

Apparently not -- including you. Someone who was interested in seeing this
issue fixed would certainly have provided a kernel bisection result as it's
apparently so easy to reproduce. (And if it's happening to so many people,
as you suggest, being an enormous regression, we should have hundreds of
bisection results by now all pointing to the same change.)

If you're not up to the task of providing a bisect result or helping with
further debugging, you should be reporting this to the distribution, which
has processes in place to deal with end-users, tracking distro regressions,
and interfacing with upstream development "teams".

Cheers,

  -ilia

--001a114547daa608780552678aa1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On T=
ue, Jun 20, 2017 at 12:54 PM, Olof Johansson <span dir=3D"ltr">&lt;<a href=
=3D"mailto:olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" target=3D"_blank">olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">Hey,<div><br></di=
v><div>This was reported back in February and it seems nobody&#39;s given a=
 shit?</div></div></blockquote><div><br></div><div>Apparently not -- includ=
ing you. Someone who was interested in seeing this issue fixed would certai=
nly have provided a kernel bisection result as it&#39;s apparently so easy =
to reproduce. (And if it&#39;s happening to so many people, as you suggest,=
 being an enormous regression, we should have hundreds of bisection results=
 by now all pointing to the same change.)</div><div><br></div><div>If you&#=
39;re not up to the task of providing a bisect result or helping with furth=
er debugging, you should be reporting this to the distribution, which has p=
rocesses in place to deal with end-users, tracking distro regressions, and =
interfacing with upstream development &quot;teams&quot;.</div><div><br></di=
v><div>Cheers,</div><div><br></div><div>=C2=A0 -ilia</div></div></div></div=
>

--001a114547daa608780552678aa1--

--===============0478910804==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0478910804==--
