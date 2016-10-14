From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98030] Stuttering video playback in totem after
 update to 1.19-rc1
Date: Fri, 14 Oct 2016 08:42:01 +0000
Message-ID: <bug-98030-8800-Tervv0TcbU@http.bugs.freedesktop.org/>
References: <bug-98030-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0328026902=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-98030-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0328026902==
Content-Type: multipart/alternative; boundary="14764345210.0c5D7.21870";
 charset="UTF-8"


--14764345210.0c5D7.21870
Date: Fri, 14 Oct 2016 08:42:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98030

--- Comment #6 from Chris Wilson <chris-Y6uKTt2uX1cEflXRtASbqLVCufUGDwFn@public.gmane.org> ---
The change in 8f1edf4bd3a1f050ce9eeb5eac45dd1a8f7a6d5e is that we no longer
wakeup and flush writers when space in the write queue becomes available -
instead before we poll() we flush the writers iff NewOutputPending since the
last poll(), i.e.

diff --git a/os/WaitFor.c b/os/WaitFor.c
index 8164c30..5b0c342 100644
--- a/os/WaitFor.c
+++ b/os/WaitFor.c
@@ -207,8 +207,7 @@ WaitForSomething(Bool are_ready)
                 (1000000 / MILLI_PER_SECOND);
             wt =3D &waittime;
         }
-        if (NewOutputPending)
-            FlushAllOutput();
+       FlushAllOutput();
         /* keep this check close to select() call to minimize race */
         if (dispatchException)
             i =3D -1;

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14764345210.0c5D7.21870
Date: Fri, 14 Oct 2016 08:42:01 +0000
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
   title=3D"NEW - Stuttering video playback in totem after update to 1.19-r=
c1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98030#c6">Comment=
 # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Stuttering video playback in totem after update to 1.19-r=
c1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98030">bug 98030<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
chris&#64;chris-wilson.co.uk" title=3D"Chris Wilson &lt;chris&#64;chris-wil=
son.co.uk&gt;"> <span class=3D"fn">Chris Wilson</span></a>
</span></b>
        <pre>The change in 8f1edf4bd3a1f050ce9eeb5eac45dd1a8f7a6d5e is that=
 we no longer
wakeup and flush writers when space in the write queue becomes available -
instead before we poll() we flush the writers iff NewOutputPending since the
last poll(), i.e.

diff --git a/os/WaitFor.c b/os/WaitFor.c
index 8164c30..5b0c342 100644
--- a/os/WaitFor.c
+++ b/os/WaitFor.c
&#64;&#64; -207,8 +207,7 &#64;&#64; WaitForSomething(Bool are_ready)
                 (1000000 / MILLI_PER_SECOND);
             wt =3D &amp;waittime;
         }
-        if (NewOutputPending)
-            FlushAllOutput();
+       FlushAllOutput();
         /* keep this check close to select() call to minimize race */
         if (dispatchException)
             i =3D -1;</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14764345210.0c5D7.21870--

--===============0328026902==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0328026902==--
