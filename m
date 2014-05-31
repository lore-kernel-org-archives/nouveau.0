From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75761] weston-launch no output - black screen
Date: Sat, 31 May 2014 08:23:03 +0000
Message-ID: <bug-75761-8800-OUMsfNB03P@http.bugs.freedesktop.org/>
References: <bug-75761-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0052639870=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-75761-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0052639870==
Content-Type: multipart/alternative; boundary="1401524583.603DB4.21637"; charset="us-ascii"


--1401524583.603DB4.21637
Date: Sat, 31 May 2014 08:23:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D75761

--- Comment #28 from Pekka Paalanen <ppaalanen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I wonder if there are two different bugs in play here.

If you do get the vblank events right, like it sounds that Nerdopolis does
indeed get, then does reverting the blamed nouveau kernel patch make any
difference? I would be surprised if it does make a difference.

This other bug would be, that when Weston changes the video mode, it does n=
ot
call drmModeCrtcSetGamma. IIRC Michel D=C3=A4nzer told me, that not calling=
 that may
lead to black output, if the color translations tables are all zero due not
being explicitly set. So the main question here is, does Weston change the
video mode, or does it use the mode that is already set for fbcon?

Weston code base already has a call to drmModeCrtcSetGamma(), but it is used
only for color managed outputs I think. Yet, it is an example of how to call
it, so if someone having this problem could test that, it would be very use=
ful.
If missing this call is indeed the problem, I think it should be a new West=
on
bug report, as the Nouveau patch blamed here should not make a difference
AFAIU.

One more note: if you test reverting the blamed Nouveau patch, make sure yo=
ur
*both* kernels with and without are built by you and launched the same way,=
 to
make sure that the fbcon video mode is really the same on both. If the fbcon
video mode is different, then that could mask the drmModeCrtcSetGamma issue.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1401524583.603DB4.21637
Date: Sat, 31 May 2014 08:23:03 +0000
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
          bz_status_REOPENED "
   title=3D"REOPENED --- - weston-launch no output - black screen"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75761#c28">Commen=
t # 28</a>
              on <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED --- - weston-launch no output - black screen"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75761">bug 75761<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
ppaalanen&#64;gmail.com" title=3D"Pekka Paalanen &lt;ppaalanen&#64;gmail.co=
m&gt;"> <span class=3D"fn">Pekka Paalanen</span></a>
</span></b>
        <pre>I wonder if there are two different bugs in play here.

If you do get the vblank events right, like it sounds that Nerdopolis does
indeed get, then does reverting the blamed nouveau kernel patch make any
difference? I would be surprised if it does make a difference.

This other bug would be, that when Weston changes the video mode, it does n=
ot
call drmModeCrtcSetGamma. IIRC Michel D=C3=A4nzer told me, that not calling=
 that may
lead to black output, if the color translations tables are all zero due not
being explicitly set. So the main question here is, does Weston change the
video mode, or does it use the mode that is already set for fbcon?

Weston code base already has a call to drmModeCrtcSetGamma(), but it is used
only for color managed outputs I think. Yet, it is an example of how to call
it, so if someone having this problem could test that, it would be very use=
ful.
If missing this call is indeed the problem, I think it should be a new West=
on
bug report, as the Nouveau patch blamed here should not make a difference
AFAIU.

One more note: if you test reverting the blamed Nouveau patch, make sure yo=
ur
*both* kernels with and without are built by you and launched the same way,=
 to
make sure that the fbcon video mode is really the same on both. If the fbcon
video mode is different, then that could mask the drmModeCrtcSetGamma issue=
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

--1401524583.603DB4.21637--

--===============0052639870==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0052639870==--
