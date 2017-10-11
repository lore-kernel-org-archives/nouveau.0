From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 103202] Tearing with reverse prime (intel primary,
 nouveau secondary)
Date: Wed, 11 Oct 2017 08:45:45 +0000
Message-ID: <bug-103202-8800-GPXKp1Wkjh@http.bugs.freedesktop.org/>
References: <bug-103202-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0747284989=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-103202-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0747284989==
Content-Type: multipart/alternative; boundary="15077115450.f869e.17918";
 charset="UTF-8"


--15077115450.f869e.17918
Date: Wed, 11 Oct 2017 08:45:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D103202

--- Comment #3 from post+fdo-8yesU2pFZgY@public.gmane.org ---
> I'm told that tearing with reverse prime is expected.

That would still be a bug then though?  Clearly some form of synchronization
should be supported.

It seems there is some work on getting synchronization to work with PRIME
<https://www.x.org/wiki/Events/XDC2016/Program/xdc-2016-prime-sync.pdf>; not
sure what the current status of that is.  Some sites make it sound like usi=
ng
the NVidia card with the proprietary drivers as primary actually can get you
V-sync on both screens, so is this just a matter of getting the nouveau DRM
driver hooked up to that infrastructure?

> if you were to flip them around and run the nvidia board as primary, you'=
d see tearing on the intel-connected screen.

Possible; I would then also have really bad battery life with no external
screen connected as the NVidia card would keep running.

> -intel/radeon both offer the option to stage that copy into a back buffer=
 for flipping to avoid the tear

Given that the Intel card is the primary here, that wouldn't really help,
right?  I would expect to need such an option for whatever drives the NVidia
card.

> X tears by default.

Well, yes, but with reverse PRIME I get tearing even if the application uses
V-Sync or if I use a compositor.  So, this is not about a lack of
synchronization per default, it is about synchronization never happening ev=
en
when using the appropriate APIs.

I wouldn't mind looking into Wayland, but found no indication that reverse
PRIME is supported there at all.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15077115450.f869e.17918
Date: Wed, 11 Oct 2017 08:45:45 +0000
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
   title=3D"NEW - Tearing with reverse prime (intel primary, nouveau second=
ary)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103202#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Tearing with reverse prime (intel primary, nouveau second=
ary)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103202">bug 10320=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
post+fdo&#64;ralfj.de" title=3D"post+fdo&#64;ralfj.de">post+fdo&#64;ralfj.d=
e</a>
</span></b>
        <pre><span class=3D"quote">&gt; I'm told that tearing with reverse =
prime is expected.</span >

That would still be a bug then though?  Clearly some form of synchronization
should be supported.

It seems there is some work on getting synchronization to work with PRIME
&lt;<a href=3D"https://www.x.org/wiki/Events/XDC2016/Program/xdc-2016-prime=
-sync.pdf">https://www.x.org/wiki/Events/XDC2016/Program/xdc-2016-prime-syn=
c.pdf</a>&gt;; not
sure what the current status of that is.  Some sites make it sound like usi=
ng
the NVidia card with the proprietary drivers as primary actually can get you
V-sync on both screens, so is this just a matter of getting the nouveau DRM
driver hooked up to that infrastructure?

<span class=3D"quote">&gt; if you were to flip them around and run the nvid=
ia board as primary, you'd see tearing on the intel-connected screen.</span=
 >

Possible; I would then also have really bad battery life with no external
screen connected as the NVidia card would keep running.

<span class=3D"quote">&gt; -intel/radeon both offer the option to stage tha=
t copy into a back buffer for flipping to avoid the tear</span >

Given that the Intel card is the primary here, that wouldn't really help,
right?  I would expect to need such an option for whatever drives the NVidia
card.

<span class=3D"quote">&gt; X tears by default.</span >

Well, yes, but with reverse PRIME I get tearing even if the application uses
V-Sync or if I use a compositor.  So, this is not about a lack of
synchronization per default, it is about synchronization never happening ev=
en
when using the appropriate APIs.

I wouldn't mind looking into Wayland, but found no indication that reverse
PRIME is supported there at all.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15077115450.f869e.17918--

--===============0747284989==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0747284989==--
