From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 112201] Syscall param ioctl(generic) points to
 uninitialised byte(s)
Date: Sun, 03 Nov 2019 03:39:55 +0000
Message-ID: <bug-112201-8800-OeijXcLuim@http.bugs.freedesktop.org/>
References: <bug-112201-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0648280619=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-112201-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0648280619==
Content-Type: multipart/alternative; boundary="15727523950.EaDE8.12421"
Content-Transfer-Encoding: 7bit


--15727523950.EaDE8.12421
Date: Sun, 3 Nov 2019 03:39:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D112201

--- Comment #3 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to stratus from comment #2)
> So this is not causing any problems, I suppose it's controlling the hardw=
are
> by reading/writing to memory addresses provided by the kernel, and valgri=
nd
> is giving a false positive, thank you for your rapid answer explaining
> things. I can look at some other things instead then.

Nope, the issue has nothing to do with that. It has to do with valgrind not
understanding how that ioctl() works. That specific one works by the kernel
filling in some data structures, but valgrind thinks that the ioctl is being
passed data. But that's not the case.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15727523950.EaDE8.12421
Date: Sun, 3 Nov 2019 03:39:55 +0000
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
   title=3D"NEW - Syscall param ioctl(generic) points to uninitialised byte=
(s)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112201#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Syscall param ioctl(generic) points to uninitialised byte=
(s)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112201">bug 11220=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to stratus from <a href=3D"show_bug.cgi?id=3D112201#=
c2">comment #2</a>)
<span class=3D"quote">&gt; So this is not causing any problems, I suppose i=
t's controlling the hardware
&gt; by reading/writing to memory addresses provided by the kernel, and val=
grind
&gt; is giving a false positive, thank you for your rapid answer explaining
&gt; things. I can look at some other things instead then.</span >

Nope, the issue has nothing to do with that. It has to do with valgrind not
understanding how that ioctl() works. That specific one works by the kernel
filling in some data structures, but valgrind thinks that the ioctl is being
passed data. But that's not the case.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15727523950.EaDE8.12421--

--===============0648280619==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0648280619==--
