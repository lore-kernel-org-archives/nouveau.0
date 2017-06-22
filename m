From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 101559] Displays fail to wake up when booting
 machine away from Display Port KVM switch
Date: Thu, 22 Jun 2017 17:42:34 +0000
Message-ID: <bug-101559-8800-1VQnkWcpUI@http.bugs.freedesktop.org/>
References: <bug-101559-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0059729063=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-101559-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0059729063==
Content-Type: multipart/alternative; boundary="14981533541.61d9b6FD.2665";
 charset="UTF-8"


--14981533541.61d9b6FD.2665
Date: Thu, 22 Jun 2017 17:42:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101559

--- Comment #5 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to dhruv.a.thakkar from comment #4)
> I'm slightly confused by your comment. Currently, we are using Redhat 7.3
> with kernal version 3.10.0-514, which is the latest version available as
> shown here: https://access.redhat.com/articles/3078

This isn't the RH support forum. This is upstream. http://www.kernel.org/ h=
as
the relevant info of what the current kernel releases are.

Kernel 3.10 was released in 2013. Then someone at RH has been cherry-picking
"important" fixes for the past 4 years. The idea of such stable branches is=
 "if
it worked before, it'll keep working". However for you, it didn't work
"before".

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14981533541.61d9b6FD.2665
Date: Thu, 22 Jun 2017 17:42:34 +0000
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
   title=3D"NEW - Displays fail to wake up when booting machine away from D=
isplay Port KVM switch"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101559#c5">Commen=
t # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Displays fail to wake up when booting machine away from D=
isplay Port KVM switch"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101559">bug 10155=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to dhruv.a.thakkar from <a href=3D"show_bug.cgi?id=
=3D101559#c4">comment #4</a>)
<span class=3D"quote">&gt; I'm slightly confused by your comment. Currently=
, we are using Redhat 7.3
&gt; with kernal version 3.10.0-514, which is the latest version available =
as
&gt; shown here: <a href=3D"https://access.redhat.com/articles/3078">https:=
//access.redhat.com/articles/3078</a></span >

This isn't the RH support forum. This is upstream. <a href=3D"http://www.ke=
rnel.org/">http://www.kernel.org/</a> has
the relevant info of what the current kernel releases are.

Kernel 3.10 was released in 2013. Then someone at RH has been cherry-picking
&quot;important&quot; fixes for the past 4 years. The idea of such stable b=
ranches is &quot;if
it worked before, it'll keep working&quot;. However for you, it didn't work
&quot;before&quot;.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14981533541.61d9b6FD.2665--

--===============0059729063==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0059729063==--
