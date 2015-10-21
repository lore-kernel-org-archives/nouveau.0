From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 88893] [NV46] GPU lockup with Quadro NVS 110M
Date: Wed, 21 Oct 2015 13:00:29 +0000
Message-ID: <bug-88893-8800-YlliXaSgzG@http.bugs.freedesktop.org/>
References: <bug-88893-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0133238868=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-88893-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0133238868==
Content-Type: multipart/alternative; boundary="1445432429.8EB1b2.6928"; charset="UTF-8"


--1445432429.8EB1b2.6928
Date: Wed, 21 Oct 2015 13:00:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=88893

--- Comment #15 from russianneuromancer-k+OT61UuxXo@public.gmane.org ---
Richard, try out Linux 4.3 (look into bug 89775 for more info) and KDE with
OpenGL ES 2 rendering engine (after login hit Alt+Shift+F12 to disable OpenGL
effects, get into System Settings > Display > Effects, switch to OpenGL ES 2
here) or Gnome Shell Wayland session (works for me here on Ubuntu Gnome 15.10
and GeForce 7300 Go).
OpenGL usage for some reason give me issues on NV46 (desktop content doesn't
get updated with enabled OpenGL desktop effects) but OpenGL ES 2 suddenly works
fine (at least I doesn't notice issues with OpenGL ES 2 yet).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1445432429.8EB1b2.6928
Date: Wed, 21 Oct 2015 13:00:29 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV46] GPU lockup with Quadro NVS 110M"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=88893#c15">Comment # 15</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV46] GPU lockup with Quadro NVS 110M"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=88893">bug 88893</a>
              from <span class="vcard"><a class="email" href="mailto:russianneuromancer&#64;ya.ru" title="russianneuromancer&#64;ya.ru">russianneuromancer&#64;ya.ru</a>
</span></b>
        <pre>Richard, try out Linux 4.3 (look into <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Grpahics card G72 [GeForce 7200 GS / 7300 SE] 3d does not work"
   href="show_bug.cgi?id=89775">bug 89775</a> for more info) and KDE with
OpenGL ES 2 rendering engine (after login hit Alt+Shift+F12 to disable OpenGL
effects, get into System Settings &gt; Display &gt; Effects, switch to OpenGL ES 2
here) or Gnome Shell Wayland session (works for me here on Ubuntu Gnome 15.10
and GeForce 7300 Go).
OpenGL usage for some reason give me issues on NV46 (desktop content doesn't
get updated with enabled OpenGL desktop effects) but OpenGL ES 2 suddenly works
fine (at least I doesn't notice issues with OpenGL ES 2 yet).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1445432429.8EB1b2.6928--

--===============0133238868==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0133238868==--
