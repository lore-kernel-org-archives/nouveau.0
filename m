From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99400] [nouveau] garbled rendering with glamor on G71
Date: Mon, 30 Jan 2017 12:41:54 +0000
Message-ID: <bug-99400-8800-93Qy0NtC7Z@http.bugs.freedesktop.org/>
References: <bug-99400-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1437813127=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-99400-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1437813127==
Content-Type: multipart/alternative; boundary="14857801140.1EF820.9438";
 charset="UTF-8"


--14857801140.1EF820.9438
Date: Mon, 30 Jan 2017 12:41:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99400

--- Comment #16 from Olivier Fourdan <fourdan-eaOCjQ5FDoY@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #13)
> I'd like to help you, but I'm just not sure how -- I don't have Wayland (=
or
> any interest in setting that up), and your traces appear incomplete. I do=
n't
> know why - I've never seen that before. But they don't create contexts.
> [...]
> While the Xwayland trace has none of those. Paradoxically, it starts at c=
all
> 31. Perhaps you have a non-egl-enabled apitrace? Also note that there's n=
ot
> a single instance of UseProgram or any other shader-related items in the
> XWayland trace.
Oh right... Blimey! You got me thinking here, you're right, those Xwayland
traces are just wrong, it's libepoxy not playing nice with "apitrace --api-=
egl"
(https://github.com/anholt/libepoxy/issues/68) so I picked up the forked
version libexpoy, rebuilt apitrace and Xwayland and was able to capture a m=
uch
better trace!

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--14857801140.1EF820.9438
Date: Mon, 30 Jan 2017 12:41:54 +0000
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
   title=3D"NEW - [nouveau] garbled rendering with glamor on G71"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99400#c16">Commen=
t # 16</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [nouveau] garbled rendering with glamor on G71"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99400">bug 99400<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
fourdan&#64;xfce.org" title=3D"Olivier Fourdan &lt;fourdan&#64;xfce.org&gt;=
"> <span class=3D"fn">Olivier Fourdan</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D994=
00#c13">comment #13</a>)
<span class=3D"quote">&gt; I'd like to help you, but I'm just not sure how =
-- I don't have Wayland (or
&gt; any interest in setting that up), and your traces appear incomplete. I=
 don't
&gt; know why - I've never seen that before. But they don't create contexts.
&gt; [...]
&gt; While the Xwayland trace has none of those. Paradoxically, it starts a=
t call
&gt; 31. Perhaps you have a non-egl-enabled apitrace? Also note that there'=
s not
&gt; a single instance of UseProgram or any other shader-related items in t=
he
&gt; XWayland trace.</span >
Oh right... Blimey! You got me thinking here, you're right, those Xwayland
traces are just wrong, it's libepoxy not playing nice with &quot;apitrace -=
-api-egl&quot;
(<a href=3D"https://github.com/anholt/libepoxy/issues/68">https://github.co=
m/anholt/libepoxy/issues/68</a>) so I picked up the forked
version libexpoy, rebuilt apitrace and Xwayland and was able to capture a m=
uch
better trace!</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14857801140.1EF820.9438--

--===============1437813127==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1437813127==--
