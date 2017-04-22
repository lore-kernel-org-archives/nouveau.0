From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100758] Kernel Oops when starting X nv50_dma_push
Date: Sat, 22 Apr 2017 15:14:28 +0000
Message-ID: <bug-100758-8800-5ykBmXfTW9@http.bugs.freedesktop.org/>
References: <bug-100758-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0465980210=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-100758-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0465980210==
Content-Type: multipart/alternative; boundary="14928740681.bFbA3DcBB.7569";
 charset="UTF-8"


--14928740681.bFbA3DcBB.7569
Date: Sat, 22 Apr 2017 15:14:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100758

--- Comment #5 from Kevin Winchester <kjwinchester-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
After this crash, I rebooted and I'm currently running sway on wayland and
things seem to work well, but I've been having trouble with X for weeks now.

I first noticed issues when the following messages started appearing in my =
boot
logs:

nouveau 0000:01:00.0: bios: OOB 1 015f1901 015f1901
nouveau 0000:01:00.0: bios: OOB 1 b90900b8 b90900b8
nouveau 0000:01:00.0: bios: OOB 1 b90900b8 b90900b8
nouveau 0000:01:00.0: bios: OOB 1 b90900b8 b90900b8

I have a dual monitor setup and I was always running with no specific
xorg.config files, just the following in my .xinitrc file:

xrandr --output LVDS-1 --preferred
xrandr --output HDMI-1 --preferred --primary --left-of LVDS-1

But suddenly after some updates, that was resulting in the same content bei=
ng
displayed on both screens, but I can still move my mouse cursor over onto t=
he
second screen.

I put in the xorg.conf file that I used to use (already pasted in) and it
seemed to improve the situation, but there were still issues. The same cont=
ent
would still appear on both screens, but once I let the xfce power management
shut off the monitors and then woke the computer back up, the screens would
work correctly again.

Then this I installed a new kernel and nouveau driver, and after starting X
everything froze and I found the Oops in my logs.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14928740681.bFbA3DcBB.7569
Date: Sat, 22 Apr 2017 15:14:28 +0000
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
   title=3D"NEW - Kernel Oops when starting X nv50_dma_push"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100758#c5">Commen=
t # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Kernel Oops when starting X nv50_dma_push"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100758">bug 10075=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
kjwinchester&#64;gmail.com" title=3D"Kevin Winchester &lt;kjwinchester&#64;=
gmail.com&gt;"> <span class=3D"fn">Kevin Winchester</span></a>
</span></b>
        <pre>After this crash, I rebooted and I'm currently running sway on=
 wayland and
things seem to work well, but I've been having trouble with X for weeks now.

I first noticed issues when the following messages started appearing in my =
boot
logs:

nouveau 0000:01:00.0: bios: OOB 1 015f1901 015f1901
nouveau 0000:01:00.0: bios: OOB 1 b90900b8 b90900b8
nouveau 0000:01:00.0: bios: OOB 1 b90900b8 b90900b8
nouveau 0000:01:00.0: bios: OOB 1 b90900b8 b90900b8

I have a dual monitor setup and I was always running with no specific
xorg.config files, just the following in my .xinitrc file:

xrandr --output LVDS-1 --preferred
xrandr --output HDMI-1 --preferred --primary --left-of LVDS-1

But suddenly after some updates, that was resulting in the same content bei=
ng
displayed on both screens, but I can still move my mouse cursor over onto t=
he
second screen.

I put in the xorg.conf file that I used to use (already pasted in) and it
seemed to improve the situation, but there were still issues. The same cont=
ent
would still appear on both screens, but once I let the xfce power management
shut off the monitors and then woke the computer back up, the screens would
work correctly again.

Then this I installed a new kernel and nouveau driver, and after starting X
everything froze and I found the Oops in my logs.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14928740681.bFbA3DcBB.7569--

--===============0465980210==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0465980210==--
