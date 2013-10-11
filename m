From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70390] [NV84] Repeated system crashes under graphics
 load, E[PFIFO] DMA_PUSHER and lots of E[PGRAPH]
Date: Fri, 11 Oct 2013 21:22:12 +0000
Message-ID: <bug-70390-8800-ieD48gBmzV@http.bugs.freedesktop.org/>
References: <bug-70390-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1139243970=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70390-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1139243970==
Content-Type: multipart/alternative; boundary="1381526533.71D1B6d1.11100"; charset="us-ascii"


--1381526533.71D1B6d1.11100
Date: Fri, 11 Oct 2013 21:22:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D70390

--- Comment #5 from Martin von Gagern <Martin.vGagern-hi6Y0CQ0nG0@public.gmane.org> ---
Created attachment 87490
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D87490&action=3Dedit
Oct 10 incident reproduced

(In reply to comment #2)
> Oct 10 incident

I was able to reproduce this incident, again with stellarium and that big
Wikipedia image in Firefox. I had netconsole reporting to a different compu=
ter,
with =E2=80=9Cdmesg -n 8=E2=80=9D, which is where the attached log came fro=
m.

 1. I didn't close all non-essential aspects of my session. Should have=E2=
=80=A6
 2. Opened the image in Firefox
 3. Started stellarium
 4. Reduced stellarium to windowed mode
 5. Switched to firefox
 6. Zoomed into image (i.e. 100% instead of fit window)
 7. Scrolled around a bit
 8. Might have zoomed back out, not sure
 9. Noticed the mouse cursor movement to freeze for a moment
10. Received the attached error message on the netconsole receiver
11. System seemed responsive again, i.e. mouse cursor moved fluently
12. Tried to switch to firefox
13. System crashed without further output to netconsole

I guess that the freezing of the mouse cursor might have actually been due =
to
the time it took to send those log messages. I.e. when logging to disk, that
time might have been shorter. In any case, I wasn't aware that the actual
problem might have occurred before the eventual crash the first time around.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1381526533.71D1B6d1.11100
Date: Fri, 11 Oct 2013 21:22:13 +0000
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
   title=3D"NEW --- - [NV84] Repeated system crashes under graphics load, E=
[PFIFO] DMA_PUSHER and lots of E[PGRAPH]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D70390#c5">Comment=
 # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - [NV84] Repeated system crashes under graphics load, E=
[PFIFO] DMA_PUSHER and lots of E[PGRAPH]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D70390">bug 70390<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
Martin.vGagern&#64;gmx.net" title=3D"Martin von Gagern &lt;Martin.vGagern&#=
64;gmx.net&gt;"> <span class=3D"fn">Martin von Gagern</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D87490"=
 name=3D"attach_87490" title=3D"Oct 10 incident reproduced">attachment 8749=
0</a> <a href=3D"attachment.cgi?id=3D87490&amp;action=3Dedit" title=3D"Oct =
10 incident reproduced">[details]</a></span>
Oct 10 incident reproduced

(In reply to <a href=3D"show_bug.cgi?id=3D70390#c2">comment #2</a>)
<span class=3D"quote">&gt; Oct 10 incident</span >

I was able to reproduce this incident, again with stellarium and that big
Wikipedia image in Firefox. I had netconsole reporting to a different compu=
ter,
with =E2=80=9Cdmesg -n 8=E2=80=9D, which is where the attached log came fro=
m.

 1. I didn't close all non-essential aspects of my session. Should have=E2=
=80=A6
 2. Opened the image in Firefox
 3. Started stellarium
 4. Reduced stellarium to windowed mode
 5. Switched to firefox
 6. Zoomed into image (i.e. 100% instead of fit window)
 7. Scrolled around a bit
 8. Might have zoomed back out, not sure
 9. Noticed the mouse cursor movement to freeze for a moment
10. Received the attached error message on the netconsole receiver
11. System seemed responsive again, i.e. mouse cursor moved fluently
12. Tried to switch to firefox
13. System crashed without further output to netconsole

I guess that the freezing of the mouse cursor might have actually been due =
to
the time it took to send those log messages. I.e. when logging to disk, that
time might have been shorter. In any case, I wasn't aware that the actual
problem might have occurred before the eventual crash the first time around=
.</pre>
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

--1381526533.71D1B6d1.11100--

--===============1139243970==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1139243970==--
