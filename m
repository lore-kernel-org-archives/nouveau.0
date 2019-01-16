From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 109371] Textures seem to be byteswapped on big
 endian architectures
Date: Wed, 16 Jan 2019 05:41:23 +0000
Message-ID: <bug-109371-8800-bGg0uK0UzR@http.bugs.freedesktop.org/>
References: <bug-109371-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0421831165=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-109371-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0421831165==
Content-Type: multipart/alternative; boundary="15476172830.fB0b2fAc8.5970"
Content-Transfer-Encoding: 7bit


--15476172830.fB0b2fAc8.5970
Date: Wed, 16 Jan 2019 05:41:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109371

--- Comment #2 from Adam Stylinski <kungfujesus06-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 143138
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D143138&action=3Dedit
Trace demoing the issue

Heh, the issue is there by the time I hit the title screen.

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15476172830.fB0b2fAc8.5970
Date: Wed, 16 Jan 2019 05:41:23 +0000
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
   title=3D"NEW - Textures seem to be byteswapped on big endian architectur=
es"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109371#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Textures seem to be byteswapped on big endian architectur=
es"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109371">bug 10937=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
kungfujesus06&#64;gmail.com" title=3D"Adam Stylinski &lt;kungfujesus06&#64;=
gmail.com&gt;"> <span class=3D"fn">Adam Stylinski</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D143138=
" name=3D"attach_143138" title=3D"Trace demoing the issue">attachment 14313=
8</a> <a href=3D"attachment.cgi?id=3D143138&amp;action=3Dedit" title=3D"Tra=
ce demoing the issue">[details]</a></span>
Trace demoing the issue

Heh, the issue is there by the time I hit the title screen.</pre>
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

--15476172830.fB0b2fAc8.5970--

--===============0421831165==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0421831165==--
