From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 79823] [NV30/gallium] Mozilla apps freeze on startup
 with nouveau-dri-10.2.1 libs on dual-screen
Date: Wed, 11 Jun 2014 05:06:14 +0000
Message-ID: <bug-79823-8800-oysx8Q4KgY@http.bugs.freedesktop.org/>
References: <bug-79823-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1400205379=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-79823-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1400205379==
Content-Type: multipart/alternative; boundary="1402463173.653CC6F0.28638"; charset="us-ascii"


--1402463173.653CC6F0.28638
Date: Wed, 11 Jun 2014 05:06:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D79823

--- Comment #8 from Natrio <natrio-cmBhpYW9OiY@public.gmane.org> ---
(In reply to comment #7)
> Curious. Do you have a dmesg from that? And the full output that was writ=
ten
> out to stderr?
No messages in any system log at this time.
No stderr output =E2=80=93 a library sends output to descriptor #2, but moz=
illa was
opened it as /dev/null.

> A bisect will still be the most effective way of tracking down the issue.
Bisecting in progress, 2 steps from 10.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1402463173.653CC6F0.28638
Date: Wed, 11 Jun 2014 05:06:13 +0000
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
   title=3D"NEW --- - [NV30/gallium] Mozilla apps freeze on startup with no=
uveau-dri-10.2.1 libs on dual-screen"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D79823#c8">Comment=
 # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - [NV30/gallium] Mozilla apps freeze on startup with no=
uveau-dri-10.2.1 libs on dual-screen"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D79823">bug 79823<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
natrio&#64;list.ru" title=3D"Natrio &lt;natrio&#64;list.ru&gt;"> <span clas=
s=3D"fn">Natrio</span></a>
</span></b>
        <pre>(In reply to <a href=3D"show_bug.cgi?id=3D79823#c7">comment #7=
</a>)
<span class=3D"quote">&gt; Curious. Do you have a dmesg from that? And the =
full output that was written
&gt; out to stderr?</span >
No messages in any system log at this time.
No stderr output =E2=80=93 a library sends output to descriptor #2, but moz=
illa was
opened it as /dev/null.

<span class=3D"quote">&gt; A bisect will still be the most effective way of=
 tracking down the issue.</span >
Bisecting in progress, 2 steps from 10.</pre>
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

--1402463173.653CC6F0.28638--

--===============1400205379==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1400205379==--
