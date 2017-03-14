From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99900] [NVC1] nouveau: freeze / crash after kernel
 update to 4.10
Date: Tue, 14 Mar 2017 12:09:46 +0000
Message-ID: <bug-99900-8800-TnKvNjzau2@http.bugs.freedesktop.org/>
References: <bug-99900-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1647330182=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-99900-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1647330182==
Content-Type: multipart/alternative; boundary="14894933850.4d28c.7219";
 charset="UTF-8"


--14894933850.4d28c.7219
Date: Tue, 14 Mar 2017 12:09:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99900

--- Comment #12 from Antoine Saroufim <antoine.saroufim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I'm experiencing the same issues. Nouveau (Gallium 0.4 - NVC1) freezes
everything on Wayland, sometimes the kernel too and it turns the display in=
to a
black screen with a visible cursor on X11. I've noticed this since I've
upgraded to kernel 4.10. Here are a few other things I've observed:

On (X)Wayland:
- Display freezes when starting fullscreen wine games. Graphics sometimes t=
urn
dark and the display freezes. (Can reproduce this 100% of the times if I la=
unch
a mission in Starcraft 2)
- Launching a fullscreen wine game while triggering the GNOME Overview mode
freezes everything including the kernel (can intentionally reproduce this t=
oo)

On X11:
-Whenever a lockscreen mechanism is triggered and the screen goes blank, wa=
king
the screen up yields an unresponsive X session with a black screen and a
working cursor.
- If X11 freezes, it can be killed and the session can be reopened. The ker=
nel
never freezes and you can still switch to other TTYs, unlike on Wayland.
- This happens on both GNOME and Plasma
- The blackscreen X11 issue happens way more often (once every 1-2 hours) t=
han
Wayland's freezing issue (2-3 times per 14 hours).=20

This happens on Mesa 17.1 (Git) and 17.0 (from openSUSE's repos). It does n=
ot
happen on the proprietary driver.=20

Extra information:

Graphics Card: GT730
Operating System: OpenSUSE Tumbleweed
Kernel: 4.10

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14894933850.4d28c.7219
Date: Tue, 14 Mar 2017 12:09:45 +0000
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
   title=3D"NEW - [NVC1] nouveau: freeze / crash after kernel update to 4.1=
0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99900#c12">Commen=
t # 12</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC1] nouveau: freeze / crash after kernel update to 4.1=
0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99900">bug 99900<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
antoine.saroufim&#64;gmail.com" title=3D"Antoine Saroufim &lt;antoine.sarou=
fim&#64;gmail.com&gt;"> <span class=3D"fn">Antoine Saroufim</span></a>
</span></b>
        <pre>I'm experiencing the same issues. Nouveau (Gallium 0.4 - NVC1)=
 freezes
everything on Wayland, sometimes the kernel too and it turns the display in=
to a
black screen with a visible cursor on X11. I've noticed this since I've
upgraded to kernel 4.10. Here are a few other things I've observed:

On (X)Wayland:
- Display freezes when starting fullscreen wine games. Graphics sometimes t=
urn
dark and the display freezes. (Can reproduce this 100% of the times if I la=
unch
a mission in Starcraft 2)
- Launching a fullscreen wine game while triggering the GNOME Overview mode
freezes everything including the kernel (can intentionally reproduce this t=
oo)

On X11:
-Whenever a lockscreen mechanism is triggered and the screen goes blank, wa=
king
the screen up yields an unresponsive X session with a black screen and a
working cursor.
- If X11 freezes, it can be killed and the session can be reopened. The ker=
nel
never freezes and you can still switch to other TTYs, unlike on Wayland.
- This happens on both GNOME and Plasma
- The blackscreen X11 issue happens way more often (once every 1-2 hours) t=
han
Wayland's freezing issue (2-3 times per 14 hours).=20

This happens on Mesa 17.1 (Git) and 17.0 (from openSUSE's repos). It does n=
ot
happen on the proprietary driver.=20

Extra information:

Graphics Card: GT730
Operating System: OpenSUSE Tumbleweed
Kernel: 4.10</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14894933850.4d28c.7219--

--===============1647330182==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1647330182==--
