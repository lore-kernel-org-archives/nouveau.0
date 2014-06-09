From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 79823] [NV30/gallium] Mozilla apps freeze on startup
 with nouveau-dri-10.2.1 libs on dual-screen
Date: Mon, 09 Jun 2014 15:58:14 +0000
Message-ID: <bug-79823-8800-85sHaEjZac@http.bugs.freedesktop.org/>
References: <bug-79823-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0301882313=="
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


--===============0301882313==
Content-Type: multipart/alternative; boundary="1402329494.fbc70820.5861"; charset="us-ascii"


--1402329494.fbc70820.5861
Date: Mon, 9 Jun 2014 15:58:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D79823

--- Comment #2 from Natrio <natrio-cmBhpYW9OiY@public.gmane.org> ---
(In reply to comment #1)
> There haven't been too many changes between 10.1 and 10.2 to the nv30
> driver. Mind doing a bisect? It seems reasonable to restrict it to
> src/gallium/drivers/nouveau/nv30.
I've never done a bisect before, but I have an strace log from mozilla star=
t =E2=80=93
with and without freeze. The freeze log is so big (9MB), but if it helps, I
will post it tomorrow.

> By the way, why are you using zaphod heads + 2 separate screens (and no
> xinerama I assume) instead of randr and having it all in one screen and
> dynamically configurable.
I don't need a joint dynamic screen for two monitors. The second strictly
dedicated screen used only for video playback on TV, and the first regular
screen on monitor used for everything else.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1402329494.fbc70820.5861
Date: Mon, 9 Jun 2014 15:58:14 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D79823#c2">Comment=
 # 2</a>
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
        <pre>(In reply to <a href=3D"show_bug.cgi?id=3D79823#c1">comment #1=
</a>)
<span class=3D"quote">&gt; There haven't been too many changes between 10.1=
 and 10.2 to the nv30
&gt; driver. Mind doing a bisect? It seems reasonable to restrict it to
&gt; src/gallium/drivers/nouveau/nv30.</span >
I've never done a bisect before, but I have an strace log from mozilla star=
t =E2=80=93
with and without freeze. The freeze log is so big (9MB), but if it helps, I
will post it tomorrow.

<span class=3D"quote">&gt; By the way, why are you using zaphod heads + 2 s=
eparate screens (and no
&gt; xinerama I assume) instead of randr and having it all in one screen and
&gt; dynamically configurable.</span >
I don't need a joint dynamic screen for two monitors. The second strictly
dedicated screen used only for video playback on TV, and the first regular
screen on monitor used for everything else.</pre>
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

--1402329494.fbc70820.5861--

--===============0301882313==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0301882313==--
