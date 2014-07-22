From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 71659] [NVD9] Hangs under load with ![
 PFIFO][0000:01:00.0] unhandled status 0x00800000
Date: Tue, 22 Jul 2014 23:12:19 +0000
Message-ID: <bug-71659-8800-Qx437mxuzX@http.bugs.freedesktop.org/>
References: <bug-71659-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1318605888=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-71659-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1318605888==
Content-Type: multipart/alternative; boundary="1406070738.7Ed21.27884"; charset="us-ascii"


--1406070738.7Ed21.27884
Date: Tue, 22 Jul 2014 23:12:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D71659

--- Comment #26 from Adrian B=C4=83c=C3=AErcea <adrian.bacircea-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> =
---
Created attachment 103307
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D103307&action=3Dedit
system log nouveau kernel linux-3.16 branch

I've compiled the kernel on the linux-3.16 branch from
http://cgit.freedesktop.org/nouveau/linux-2.6/ and X still freezes but now =
it
recovers temporarily.=20
After it I can close the program that caused the freeze and then I can't use
the nouveau card anymore (glxgears would cause another temporary freeze
followed by a black window).=20
After a while, though, everything started to become unresponsive and I had =
to
cold reboot to do anything.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1406070738.7Ed21.27884
Date: Tue, 22 Jul 2014 23:12:18 +0000
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
   title=3D"NEW --- - [NVD9] Hangs under load with ![ PFIFO][0000:01:00.0] =
unhandled status 0x00800000"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D71659#c26">Commen=
t # 26</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - [NVD9] Hangs under load with ![ PFIFO][0000:01:00.0] =
unhandled status 0x00800000"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D71659">bug 71659<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
adrian.bacircea&#64;gmail.com" title=3D"Adrian B=C4=83c=C3=AErcea &lt;adria=
n.bacircea&#64;gmail.com&gt;"> <span class=3D"fn">Adrian B=C4=83c=C3=AErcea=
</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D103307=
" name=3D"attach_103307" title=3D"system log nouveau kernel linux-3.16 bran=
ch">attachment 103307</a> <a href=3D"attachment.cgi?id=3D103307&amp;action=
=3Dedit" title=3D"system log nouveau kernel linux-3.16 branch">[details]</a=
></span>
system log nouveau kernel linux-3.16 branch

I've compiled the kernel on the linux-3.16 branch from
<a href=3D"http://cgit.freedesktop.org/nouveau/linux-2.6/">http://cgit.free=
desktop.org/nouveau/linux-2.6/</a> and X still freezes but now it
recovers temporarily.=20
After it I can close the program that caused the freeze and then I can't use
the nouveau card anymore (glxgears would cause another temporary freeze
followed by a black window).=20
After a while, though, everything started to become unresponsive and I had =
to
cold reboot to do anything.</pre>
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

--1406070738.7Ed21.27884--

--===============1318605888==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1318605888==--
