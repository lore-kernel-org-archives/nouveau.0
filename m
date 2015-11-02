From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90626] HP ZBook 15 nouveau driver hangup for kernel
	>= 4.1
Date: Mon, 02 Nov 2015 09:24:26 +0000
Message-ID: <bug-90626-8800-ksC14tMskX@http.bugs.freedesktop.org/>
References: <bug-90626-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0481546900=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90626-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0481546900==
Content-Type: multipart/alternative; boundary="1446456267.C02af8Ae4.8325"; charset="UTF-8"


--1446456267.C02af8Ae4.8325
Date: Mon, 2 Nov 2015 09:24:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D90626

--- Comment #32 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Ortwin Gl=C3=BCck from comment #31)
> The delays during boot are not caused by the bios shadow code but by this:
> [    5.878439] nouveau E[  PGRAPH][0000:01:00.0] wait for idle timeout (e=
n:
> 1, ctxsw: 0, busy: 1)
> [    7.877714] nouveau E[  PGRAPH][0000:01:00.0] wait for idle timeout (e=
n:
> 1, ctxsw: 0, busy: 1)
> [    9.876992] nouveau E[  PGRAPH][0000:01:00.0] wait for idle timeout (e=
n:
> 1, ctxsw: 0, busy: 1)
> [   11.876268] nouveau E[  PGRAPH][0000:01:00.0] wait for idle timeout (e=
n:
> 1, ctxsw: 0, busy: 1)

Try

nouveau.config=3DWar00C800_0=3D1

which will enable yet-another workaround.

>=20
> So I think you could simply scrap the "fast" version and always use the 4K
> "slow" version for compatibility.

The old code was able to make the fallback just fine, apparently (since it
broke when the rewrite happened). The new code should fall back as well, bu=
t...
doesn't. Very odd.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1446456267.C02af8Ae4.8325
Date: Mon, 2 Nov 2015 09:24:27 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - HP ZBook 15 nouveau driver hangup for kernel &gt;=3D 4.1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D90626#c32">Commen=
t # 32</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - HP ZBook 15 nouveau driver hangup for kernel &gt;=3D 4.1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D90626">bug 90626<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Ortwin Gl=C3=BCck from <a href=3D"show_bug.cgi?id=
=3D90626#c31">comment #31</a>)
<span class=3D"quote">&gt; The delays during boot are not caused by the bio=
s shadow code but by this:
&gt; [    5.878439] nouveau E[  PGRAPH][0000:01:00.0] wait for idle timeout=
 (en:
&gt; 1, ctxsw: 0, busy: 1)
&gt; [    7.877714] nouveau E[  PGRAPH][0000:01:00.0] wait for idle timeout=
 (en:
&gt; 1, ctxsw: 0, busy: 1)
&gt; [    9.876992] nouveau E[  PGRAPH][0000:01:00.0] wait for idle timeout=
 (en:
&gt; 1, ctxsw: 0, busy: 1)
&gt; [   11.876268] nouveau E[  PGRAPH][0000:01:00.0] wait for idle timeout=
 (en:
&gt; 1, ctxsw: 0, busy: 1)</span >

Try

nouveau.config=3DWar00C800_0=3D1

which will enable yet-another workaround.

<span class=3D"quote">&gt;=20
&gt; So I think you could simply scrap the &quot;fast&quot; version and alw=
ays use the 4K
&gt; &quot;slow&quot; version for compatibility.</span >

The old code was able to make the fallback just fine, apparently (since it
broke when the rewrite happened). The new code should fall back as well, bu=
t...
doesn't. Very odd.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
=20=20=20=20=20=20
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1446456267.C02af8Ae4.8325--

--===============0481546900==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0481546900==--
