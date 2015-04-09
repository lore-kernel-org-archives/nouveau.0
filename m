From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89969] vaDriverInit fails with gallium/nouveau driver
Date: Thu, 09 Apr 2015 18:42:56 +0000
Message-ID: <bug-89969-8800-nw7mBHIWZ4@http.bugs.freedesktop.org/>
References: <bug-89969-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1254869503=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-89969-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1254869503==
Content-Type: multipart/alternative; boundary="1428604976.b4B7BE1.11653"; charset="UTF-8"


--1428604976.b4B7BE1.11653
Date: Thu, 9 Apr 2015 18:42:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D89969

--- Comment #7 from Christian K=C3=B6nig <deathsimple-ANTagKRnAhcb1SvskN2V4Q@public.gmane.org> ---
Chunked decoding means that between begin picture and end picture the state
tracker calls the decode function multiple times for the same picture.

E.g. you don't get the bitstream all at once, but rather in small chunks.

Nouveau can't deal with that cause Maarten didn't wanted that interface, ra=
deon
on the other hand never used anything else.

You just need to fix nouveau to implement bitstream buffer resizing in the =
same
way radeon does it (or move that stuff into the state tracker like I always
suggested).

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1428604976.b4B7BE1.11653
Date: Thu, 9 Apr 2015 18:42:56 +0000
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
   title=3D"NEW - vaDriverInit fails with gallium/nouveau driver"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D89969#c7">Comment=
 # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - vaDriverInit fails with gallium/nouveau driver"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D89969">bug 89969<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
deathsimple&#64;vodafone.de" title=3D"Christian K=C3=B6nig &lt;deathsimple&=
#64;vodafone.de&gt;"> <span class=3D"fn">Christian K=C3=B6nig</span></a>
</span></b>
        <pre>Chunked decoding means that between begin picture and end pict=
ure the state
tracker calls the decode function multiple times for the same picture.

E.g. you don't get the bitstream all at once, but rather in small chunks.

Nouveau can't deal with that cause Maarten didn't wanted that interface, ra=
deon
on the other hand never used anything else.

You just need to fix nouveau to implement bitstream buffer resizing in the =
same
way radeon does it (or move that stuff into the state tracker like I always
suggested).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
=20=20=20=20=20=20
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1428604976.b4B7BE1.11653--

--===============1254869503==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1254869503==--
