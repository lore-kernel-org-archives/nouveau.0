From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 110660] GeForce GT 750M Mac Edition fullscreen issues
Date: Fri, 10 May 2019 14:50:58 +0000
Message-ID: <bug-110660-8800-WDJl7FjpAV@http.bugs.freedesktop.org/>
References: <bug-110660-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1266668150=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-110660-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1266668150==
Content-Type: multipart/alternative; boundary="15574998580.e9fBe7b5.31012"
Content-Transfer-Encoding: 7bit


--15574998580.e9fBe7b5.31012
Date: Fri, 10 May 2019 14:50:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110660

--- Comment #6 from Alexey Kuznetsov <ak-b7SOpcJQXxU@public.gmane.org> ---
Thanks for tips. Seems like I'm not the only one:

https://askubuntu.com/questions/1038899/xorg-fails-to-start-after-upgrade-t=
o-18-04-dev-dri-card0-no-such-file

My drm file exists and readable:

axet@axet-laptop:~$ ls -al /dev/dri/
total 0
drwxr-xr-x   3 root root       100 =D0=BC=D0=B0=D1=8F 10 17:41 .
drwxr-xr-x  21 root root      4640 =D0=BC=D0=B0=D1=8F 10 17:42 ..
drwxr-xr-x   2 root root        80 =D0=BC=D0=B0=D1=8F 10 17:41 by-path
crw-rw----+  1 root video 226,   0 =D0=BC=D0=B0=D1=8F 10 17:41 card0
crw-rw----+  1 root video 226, 128 =D0=BC=D0=B0=D1=8F 10 17:41 renderD128
axet@axet-laptop:~$=20

no cat errors:

axet@axet-laptop:~$ cat /dev/dri/card0=20
^C
axet@axet-laptop:~$=20

all with disabled selinux:

axet@axet-laptop:~$ getenforce=20
Disabled
axet@axet-laptop:~$

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15574998580.e9fBe7b5.31012
Date: Fri, 10 May 2019 14:50:58 +0000
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
   title=3D"NEW - GeForce GT 750M Mac Edition fullscreen issues"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110660#c6">Commen=
t # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - GeForce GT 750M Mac Edition fullscreen issues"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110660">bug 11066=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
ak&#64;axet.ru" title=3D"Alexey Kuznetsov &lt;ak&#64;axet.ru&gt;"> <span cl=
ass=3D"fn">Alexey Kuznetsov</span></a>
</span></b>
        <pre>Thanks for tips. Seems like I'm not the only one:

<a href=3D"https://askubuntu.com/questions/1038899/xorg-fails-to-start-afte=
r-upgrade-to-18-04-dev-dri-card0-no-such-file">https://askubuntu.com/questi=
ons/1038899/xorg-fails-to-start-after-upgrade-to-18-04-dev-dri-card0-no-suc=
h-file</a>

My drm file exists and readable:

axet&#64;axet-laptop:~$ ls -al /dev/dri/
total 0
drwxr-xr-x   3 root root       100 =D0=BC=D0=B0=D1=8F 10 17:41 .
drwxr-xr-x  21 root root      4640 =D0=BC=D0=B0=D1=8F 10 17:42 ..
drwxr-xr-x   2 root root        80 =D0=BC=D0=B0=D1=8F 10 17:41 by-path
crw-rw----+  1 root video 226,   0 =D0=BC=D0=B0=D1=8F 10 17:41 card0
crw-rw----+  1 root video 226, 128 =D0=BC=D0=B0=D1=8F 10 17:41 renderD128
axet&#64;axet-laptop:~$=20

no cat errors:

axet&#64;axet-laptop:~$ cat /dev/dri/card0=20
^C
axet&#64;axet-laptop:~$=20

all with disabled selinux:

axet&#64;axet-laptop:~$ getenforce=20
Disabled
axet&#64;axet-laptop:~$</pre>
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

--15574998580.e9fBe7b5.31012--

--===============1266668150==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1266668150==--
