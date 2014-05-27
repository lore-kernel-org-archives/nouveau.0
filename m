From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67878] [NV98] [BISECTED] Hardware freeze after
 resume from suspend
Date: Tue, 27 May 2014 15:33:47 +0000
Message-ID: <bug-67878-8800-1izrZvLOZs@http.bugs.freedesktop.org/>
References: <bug-67878-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0160434012=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-67878-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0160434012==
Content-Type: multipart/alternative; boundary="1401204827.8d6eC4.32145"; charset="us-ascii"


--1401204827.8d6eC4.32145
Date: Tue, 27 May 2014 15:33:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D67878

--- Comment #41 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #40)
> I hit this bug upon upgrade from Ubuntu 12.04 to 14.04. I can confirm
> nouveau is working in Ubuntu kernel 3.7.10 and it freezes on resume in
> 3.13.0.
> My hardware:
>=20
> 02:00.0 VGA compatible controller: NVIDIA Corporation C79 [GeForce 9400M]
> (rev b1) (prog-if 00 [VGA controller])
> 	Subsystem: Apple Inc. MacBook5,1

Did you verify that the same commit is responsible? If not, please do a bis=
ect
(you can cheat and just assume this is the same issue and test the commit a=
nd
its parent). If it's the same commit, please let us know. If not, open a
separate issue.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1401204827.8d6eC4.32145
Date: Tue, 27 May 2014 15:33:47 +0000
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
   title=3D"NEW --- - [NV98] [BISECTED] Hardware freeze after resume from s=
uspend"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D67878#c41">Commen=
t # 41</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - [NV98] [BISECTED] Hardware freeze after resume from s=
uspend"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D67878">bug 67878<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href=3D"show_bug.cgi?id=3D67878#c40">comment #=
40</a>)
<span class=3D"quote">&gt; I hit this bug upon upgrade from Ubuntu 12.04 to=
 14.04. I can confirm
&gt; nouveau is working in Ubuntu kernel 3.7.10 and it freezes on resume in
&gt; 3.13.0.
&gt; My hardware:
&gt;=20
&gt; 02:00.0 VGA compatible controller: NVIDIA Corporation C79 [GeForce 940=
0M]
&gt; (rev b1) (prog-if 00 [VGA controller])
&gt; 	Subsystem: Apple Inc. MacBook5,1</span >

Did you verify that the same commit is responsible? If not, please do a bis=
ect
(you can cheat and just assume this is the same issue and test the commit a=
nd
its parent). If it's the same commit, please let us know. If not, open a
separate issue.</pre>
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

--1401204827.8d6eC4.32145--

--===============0160434012==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0160434012==--
