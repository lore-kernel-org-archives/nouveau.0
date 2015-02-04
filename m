From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87819] [NVAC] EQ overflowing
Date: Wed, 04 Feb 2015 17:56:56 +0000
Message-ID: <bug-87819-8800-zv4nidR0tS@http.bugs.freedesktop.org/>
References: <bug-87819-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1115481225=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-87819-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1115481225==
Content-Type: multipart/alternative; boundary="1423072616.0eFA1.13309"; charset="UTF-8"


--1423072616.0eFA1.13309
Date: Wed, 4 Feb 2015 17:56:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D87819

--- Comment #11 from Stuart Longland <stuartl-3e+Fe6x+Dsh6S/UX/emfpkB+6BGkLq7r@public.gmane.org> ---
Now running a kernel built from the Nouveau git tree at this commit:

commit ff4c0d5213b015e60aa87c1352604f10ba9c3e12
Author: Bruno Pr=C3=A9mont <bonbons-ud5FBsm0p/xEiooADzr8i9i2O/JbrIOy@public.gmane.org>
Date:   Sun Dec 21 17:43:31 2014 +0100

    drm/nouveau/nouveau: Do not BUG_ON(!spin_is_locked()) on UP

    On !SMP systems spinlocks do not exist. Thus checking of they
    are active will always fail.

    Use
      assert_spin_locked(lock);
    instead of
      BUG_ON(!spin_is_locked(lock));
    to not BUG() on all UP systems.

    Signed-off-by: Bruno Pr=C3=A9mont <bonbons-ud5FBsm0p/xEiooADzr8i9i2O/JbrIOy@public.gmane.org>
    Signed-off-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

RC=3D0 stuartl@vk4msl-mb ~ $ uname -a
Linux vk4msl-mb 3.18.0-rc4-vk4msl-mb-00789-gff4c0d5 #1 SMP PREEMPT Wed Feb 4
20:19:39 EST 2015 x86_64 Intel(R) Core(TM)2 Duo CPU P7350 @ 2.00GHz
GenuineIntel GNU/Linux
RC=3D0 stuartl@vk4msl-mb ~ $ uptime
 03:52:41 up 17 min,  1 user,  load average: 0.62, 0.49, 0.47

I've been tinkering in OpenSCAD for a while and it has not yet crashed.  Ma=
ybe
this weekend I'll try stock kernel 3.18.0-rc4 then bisect until we figure o=
ut
what patches fix it and try cherry-picking those.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1423072616.0eFA1.13309
Date: Wed, 4 Feb 2015 17:56:56 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVAC] EQ overflowing"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D87819#c11">Commen=
t # 11</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVAC] EQ overflowing"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D87819">bug 87819<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
stuartl&#64;longlandclan.yi.org" title=3D"Stuart Longland &lt;stuartl&#64;l=
onglandclan.yi.org&gt;"> <span class=3D"fn">Stuart Longland</span></a>
</span></b>
        <pre>Now running a kernel built from the Nouveau git tree at this c=
ommit:

commit ff4c0d5213b015e60aa87c1352604f10ba9c3e12
Author: Bruno Pr=C3=A9mont &lt;<a href=3D"mailto:bonbons&#64;linux-vserver.=
org">bonbons&#64;linux-vserver.org</a>&gt;
Date:   Sun Dec 21 17:43:31 2014 +0100

    drm/nouveau/nouveau: Do not BUG_ON(!spin_is_locked()) on UP

    On !SMP systems spinlocks do not exist. Thus checking of they
    are active will always fail.

    Use
      assert_spin_locked(lock);
    instead of
      BUG_ON(!spin_is_locked(lock));
    to not BUG() on all UP systems.

    Signed-off-by: Bruno Pr=C3=A9mont &lt;<a href=3D"mailto:bonbons&#64;lin=
ux-vserver.org">bonbons&#64;linux-vserver.org</a>&gt;
    Signed-off-by: Ben Skeggs &lt;<a href=3D"mailto:bskeggs&#64;redhat.com"=
>bskeggs&#64;redhat.com</a>&gt;

RC=3D0 stuartl&#64;vk4msl-mb ~ $ uname -a
Linux vk4msl-mb 3.18.0-rc4-vk4msl-mb-00789-gff4c0d5 #1 SMP PREEMPT Wed Feb 4
20:19:39 EST 2015 x86_64 Intel(R) Core(TM)2 Duo CPU P7350 &#64; 2.00GHz
GenuineIntel GNU/Linux
RC=3D0 stuartl&#64;vk4msl-mb ~ $ uptime
 03:52:41 up 17 min,  1 user,  load average: 0.62, 0.49, 0.47

I've been tinkering in OpenSCAD for a while and it has not yet crashed.  Ma=
ybe
this weekend I'll try stock kernel 3.18.0-rc4 then bisect until we figure o=
ut
what patches fix it and try cherry-picking those.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
=20=20=20=20=20=20
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1423072616.0eFA1.13309--

--===============1115481225==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1115481225==--
