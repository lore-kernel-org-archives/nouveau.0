From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 110830] [nouveau] GeForce GTX 1660 Ti (mobile) not
 supported (NV168/TU116)
Date: Fri, 07 Jun 2019 10:30:48 +0000
Message-ID: <bug-110830-8800-q6Q07VmkW3@http.bugs.freedesktop.org/>
References: <bug-110830-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1159582723=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-110830-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1159582723==
Content-Type: multipart/alternative; boundary="15599034480.a376c.16735"
Content-Transfer-Encoding: 7bit


--15599034480.a376c.16735
Date: Fri, 7 Jun 2019 10:30:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110830

--- Comment #5 from Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Marcin Zajaczkowski from comment #4)
> Of course it didn't make sense to turn it on, as it was already turned on
> (DynPwr) in my case :) ). I can switch it off with vgaswitcheroo (or at
> least to be reported as DynOff - I will check it later with powertop) when
> no external output is connected. And what I missed in my previous comment=
 -
> the external monitor works out-of-box, which is nice progress.
>=20
> Later on I will try to play with DRI_PRIME to enable also rendering with =
the
> NVidia card.
>=20
> What could be the side effects of:
> > kernel: nouveau 0000:01:00.0: DRM: failed to create kernel channel, -22
That's expected at this point. We don't have firmware available to enable
acceleration yet.=20
 Support for Turing is limited to modesetting currently.=20

> ?
>=20
> And, in general, thanks for you suggestion with NvChipset :). If you would
> like to test anything else on that hardware, please let me know.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15599034480.a376c.16735
Date: Fri, 7 Jun 2019 10:30:48 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [nouveau] GeForce GTX 1660 Ti (mobile) not supported (NV1=
68/TU116)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110830#c5">Commen=
t # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [nouveau] GeForce GTX 1660 Ti (mobile) not supported (NV1=
68/TU116)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110830">bug 11083=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
skeggsb&#64;gmail.com" title=3D"Ben Skeggs &lt;skeggsb&#64;gmail.com&gt;"> =
<span class=3D"fn">Ben Skeggs</span></a>
</span></b>
        <pre>(In reply to Marcin Zajaczkowski from <a href=3D"show_bug.cgi?=
id=3D110830#c4">comment #4</a>)
<span class=3D"quote">&gt; Of course it didn't make sense to turn it on, as=
 it was already turned on
&gt; (DynPwr) in my case :) ). I can switch it off with vgaswitcheroo (or at
&gt; least to be reported as DynOff - I will check it later with powertop) =
when
&gt; no external output is connected. And what I missed in my previous comm=
ent -
&gt; the external monitor works out-of-box, which is nice progress.
&gt;=20
&gt; Later on I will try to play with DRI_PRIME to enable also rendering wi=
th the
&gt; NVidia card.
&gt;=20
&gt; What could be the side effects of:
&gt; &gt; kernel: nouveau 0000:01:00.0: DRM: failed to create kernel channe=
l, -22</span >
That's expected at this point. We don't have firmware available to enable
acceleration yet.=20
 Support for Turing is limited to modesetting currently.=20

<span class=3D"quote">&gt; ?
&gt;=20
&gt; And, in general, thanks for you suggestion with NvChipset :). If you w=
ould
&gt; like to test anything else on that hardware, please let me know.</span=
 ></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15599034480.a376c.16735--

--===============1159582723==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1159582723==--
