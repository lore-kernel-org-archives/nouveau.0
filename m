From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 108520] [GK104] MST DisplayPort HiDPI screen flicker
Date: Tue, 23 Oct 2018 21:48:32 +0000
Message-ID: <bug-108520-8800-6ixXBf5okD@http.bugs.freedesktop.org/>
References: <bug-108520-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0154637784=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-108520-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0154637784==
Content-Type: multipart/alternative; boundary="15403313121.ccC597.16911"
Content-Transfer-Encoding: 7bit


--15403313121.ccC597.16911
Date: Tue, 23 Oct 2018 21:48:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108520

--- Comment #9 from JM9 <jhnmlkvch9-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #8)
> So it sounds like there's a DP ports are hard-attached to the NVIDIA chip,
> which is why you're seeing it as "DP-1-1" for the "optimus" case. It's
> actually using the outputs attached to the NVIDIA gpu. The "local" DP
> outputs are probably meant for a dock.
>=20
> Are both the 2560x1440 and 1920x1200 monitors attached via DP? Or are the=
re
> converters in between?

They are both connected via dock. 2560x1440 (the only one with the flicker
problem) is additionally going through a DP to DVI Dual Link Adapter.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15403313121.ccC597.16911
Date: Tue, 23 Oct 2018 21:48:32 +0000
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
   title=3D"NEW - [GK104] MST DisplayPort HiDPI screen flicker"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108520#c9">Commen=
t # 9</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [GK104] MST DisplayPort HiDPI screen flicker"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108520">bug 10852=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
jhnmlkvch9&#64;gmail.com" title=3D"JM9 &lt;jhnmlkvch9&#64;gmail.com&gt;"> <=
span class=3D"fn">JM9</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D108=
520#c8">comment #8</a>)
<span class=3D"quote">&gt; So it sounds like there's a DP ports are hard-at=
tached to the NVIDIA chip,
&gt; which is why you're seeing it as &quot;DP-1-1&quot; for the &quot;opti=
mus&quot; case. It's
&gt; actually using the outputs attached to the NVIDIA gpu. The &quot;local=
&quot; DP
&gt; outputs are probably meant for a dock.
&gt;=20
&gt; Are both the 2560x1440 and 1920x1200 monitors attached via DP? Or are =
there
&gt; converters in between?</span >

They are both connected via dock. 2560x1440 (the only one with the flicker
problem) is additionally going through a DP to DVI Dual Link Adapter.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15403313121.ccC597.16911--

--===============0154637784==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0154637784==--
