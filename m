From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 102337] Full system crash when running a custom
 OpenGL 4.3 graphic engine
Date: Tue, 22 Aug 2017 12:44:03 +0000
Message-ID: <bug-102337-8800-28vCPCNt11@http.bugs.freedesktop.org/>
References: <bug-102337-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1003307364=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-102337-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1003307364==
Content-Type: multipart/alternative; boundary="15034058430.dd3fc41.24910";
 charset="UTF-8"


--15034058430.dd3fc41.24910
Date: Tue, 22 Aug 2017 12:44:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D102337

--- Comment #4 from TheBrokenGod <from.the.darkest.past-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I tried the 08/21 image but I'm having trouble installing the needed packag=
es.
I managed to install and run LXDE but when trying to install the rest it sa=
ys
there is no enough space, which is strange because with 8GB of RAM there sh=
ould
be plenty of it. Unfortunately I have no free partition on which perform the
installation.

Anyway, it is very simple to reproduce the problem:

1) Download the whole project from https://github.com/TheBrokenGod/OmegaEng=
ine
and unzip it
2) Install the following packages and libraries: make, g++, glfw, glew, ass=
imp,
freeimage
3) Run 'make -f makefile' in the root directory of the project
4) Launch the test scene with './omega Scene/scene.dae'

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15034058430.dd3fc41.24910
Date: Tue, 22 Aug 2017 12:44:03 +0000
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
   title=3D"NEW - Full system crash when running a custom OpenGL 4.3 graphi=
c engine"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102337#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Full system crash when running a custom OpenGL 4.3 graphi=
c engine"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102337">bug 10233=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
from.the.darkest.past&#64;gmail.com" title=3D"TheBrokenGod &lt;from.the.dar=
kest.past&#64;gmail.com&gt;"> <span class=3D"fn">TheBrokenGod</span></a>
</span></b>
        <pre>I tried the 08/21 image but I'm having trouble installing the =
needed packages.
I managed to install and run LXDE but when trying to install the rest it sa=
ys
there is no enough space, which is strange because with 8GB of RAM there sh=
ould
be plenty of it. Unfortunately I have no free partition on which perform the
installation.

Anyway, it is very simple to reproduce the problem:

1) Download the whole project from <a href=3D"https://github.com/TheBrokenG=
od/OmegaEngine">https://github.com/TheBrokenGod/OmegaEngine</a>
and unzip it
2) Install the following packages and libraries: make, g++, glfw, glew, ass=
imp,
freeimage
3) Run 'make -f makefile' in the root directory of the project
4) Launch the test scene with './omega Scene/scene.dae'</pre>
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

--15034058430.dd3fc41.24910--

--===============1003307364==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1003307364==--
