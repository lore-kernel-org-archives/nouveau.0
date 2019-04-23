From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 110500] X-Server crashes - GL error:
 GL_OUT_OF_MEMORY in glTexSubImage
Date: Tue, 23 Apr 2019 19:16:02 +0000
Message-ID: <bug-110500-8800-mvwlLd9vh8@http.bugs.freedesktop.org/>
References: <bug-110500-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2089074024=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-110500-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2089074024==
Content-Type: multipart/alternative; boundary="15560469620.a59e37.21896"
Content-Transfer-Encoding: 7bit


--15560469620.a59e37.21896
Date: Tue, 23 Apr 2019 19:16:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110500

--- Comment #6 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to wixbisce-jFQLhMmostjmZLV5cmOKUwC/G2K4zDHf@public.gmane.org from comment #5)
> I think this should be fixed so that normal user dont have to struggle
> around with this.

Agreed. Your distro has made some sort of modification which causes modeset=
 to
be preferred to nouveau. Feel free to inform them that this was a poor idea.

IMO, nouveau's GL implementation is a bad match for GLAMOR.

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--15560469620.a59e37.21896
Date: Tue, 23 Apr 2019 19:16:02 +0000
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
   title=3D"NEW - X-Server crashes - GL error: GL_OUT_OF_MEMORY in glTexSub=
Image"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110500#c6">Commen=
t # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - X-Server crashes - GL error: GL_OUT_OF_MEMORY in glTexSub=
Image"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110500">bug 11050=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href=3D"mailto:wixbisce&#64;guerrillamail.com"=
>wixbisce&#64;guerrillamail.com</a> from <a href=3D"show_bug.cgi?id=3D11050=
0#c5">comment #5</a>)
<span class=3D"quote">&gt; I think this should be fixed so that normal user=
 dont have to struggle
&gt; around with this.</span >

Agreed. Your distro has made some sort of modification which causes modeset=
 to
be preferred to nouveau. Feel free to inform them that this was a poor idea.

IMO, nouveau's GL implementation is a bad match for GLAMOR.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
          <li>You are the QA Contact for the bug.</li>
      </ul>
    </body>
</html>=

--15560469620.a59e37.21896--

--===============2089074024==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============2089074024==--
