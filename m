From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75279] XCloseDisplay() takes one minute around
 nouveau_dri.so, freezing Firefox startup
Date: Sun, 23 Feb 2014 22:25:45 +0000
Message-ID: <bug-75279-8800-WW97uymqLV@http.bugs.freedesktop.org/>
References: <bug-75279-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0647050778=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-75279-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0647050778==
Content-Type: multipart/alternative; boundary="1393194345.c52A3.1466"; charset="us-ascii"


--1393194345.c52A3.1466
Date: Sun, 23 Feb 2014 22:25:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D75279

--- Comment #17 from Karl Tomlinson <bugs.freedesktop-685W5sqp211eoWH0uzbU5w@public.gmane.org> ---
> Thread 1 (Thread 0x7f2d032c2740 (LWP 3445)):
> #0  0x00007f2d02ebfa8d in read () from /usr/lib/libpthread.so.0
> #1  0x00007f2cfd97264a in mozilla::widget::GfxInfo::GetData() ()
>    from /home/fred/T=C3=A9l=C3=A9chargements/firefox/libxul.so

I wouldn't expect a blocking read on a pipe to use 100% CPU.
Is this the same process that top is showing using the CPU?
If it is, can you use 'H' in top to identify the thread, please?

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1393194345.c52A3.1466
Date: Sun, 23 Feb 2014 22:25:45 +0000
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
   title=3D"NEW --- - XCloseDisplay() takes one minute around nouveau_dri.s=
o, freezing Firefox startup"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75279#c17">Commen=
t # 17</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - XCloseDisplay() takes one minute around nouveau_dri.s=
o, freezing Firefox startup"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75279">bug 75279<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
bugs.freedesktop&#64;karlt.net" title=3D"Karl Tomlinson &lt;bugs.freedeskto=
p&#64;karlt.net&gt;"> <span class=3D"fn">Karl Tomlinson</span></a>
</span></b>
        <pre><span class=3D"quote">&gt; Thread 1 (Thread 0x7f2d032c2740 (LW=
P 3445)):
&gt; #0  0x00007f2d02ebfa8d in read () from /usr/lib/libpthread.so.0
&gt; #1  0x00007f2cfd97264a in mozilla::widget::GfxInfo::GetData() ()
&gt;    from /home/fred/T=C3=A9l=C3=A9chargements/firefox/libxul.so</span >

I wouldn't expect a blocking read on a pipe to use 100% CPU.
Is this the same process that top is showing using the CPU?
If it is, can you use 'H' in top to identify the thread, please?</pre>
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

--1393194345.c52A3.1466--

--===============0647050778==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0647050778==--
