From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91526] World of Warcraft (on Wine) has UI corruption
 with nouveau
Date: Sat, 01 Aug 2015 20:55:33 +0000
Message-ID: <bug-91526-8800-ZlHxBlJj3j@http.bugs.freedesktop.org/>
References: <bug-91526-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0037549944=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91526-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0037549944==
Content-Type: multipart/alternative; boundary="1438462532.52E870.31054"; charset="UTF-8"


--1438462532.52E870.31054
Date: Sat, 1 Aug 2015 20:55:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D91526

--- Comment #3 from Gediminas Jakutis <gediminas-1NU85dn7e2ownf/OCUKchA@public.gmane.org> ---
>Out of curiousity, does this happen with st/nine?

Hard to tell =E2=80=93 with GalliumNine I get a whole different set of high=
ly varying
and inconsistent issues =E2=80=93 from trivial negligible ones to it's-nigh=
-unplayable
ones. All those while never noticing any of these UI problems at all. So it=
's
hard to tell if the issues are related.

>I had a patch somewhere that worked around it (initializing values to 0,0,=
0,1) at https://bugs.freedesktop.org/attachment.cgi?id=3D116966

I see no difference in behaviour with this patch whatsoever. Neither "norma=
lly"
nor with GalliumNine.

P.S. As a side-note, the most interestingly looking issue I encountered with
GalliumNine was when one of the xyz coordinates on *some* objects very
obviously appeared to be clamped to 0 ;]

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1438462532.52E870.31054
Date: Sat, 1 Aug 2015 20:55:32 +0000
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
   title=3D"NEW - World of Warcraft (on Wine) has UI corruption with nouvea=
u"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D91526#c3">Comment=
 # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - World of Warcraft (on Wine) has UI corruption with nouvea=
u"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D91526">bug 91526<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
gediminas&#64;varciai.lt" title=3D"Gediminas Jakutis &lt;gediminas&#64;varc=
iai.lt&gt;"> <span class=3D"fn">Gediminas Jakutis</span></a>
</span></b>
        <pre><span class=3D"quote">&gt;Out of curiousity, does this happen =
with st/nine?</span >

Hard to tell =E2=80=93 with GalliumNine I get a whole different set of high=
ly varying
and inconsistent issues =E2=80=93 from trivial negligible ones to it's-nigh=
-unplayable
ones. All those while never noticing any of these UI problems at all. So it=
's
hard to tell if the issues are related.

<span class=3D"quote">&gt;I had a patch somewhere that worked around it (in=
itializing values to 0,0,0,1) at <a href=3D"https://bugs.freedesktop.org/at=
tachment.cgi?id=3D116966">https://bugs.freedesktop.org/attachment.cgi?id=3D=
116966</a></span >

I see no difference in behaviour with this patch whatsoever. Neither &quot;=
normally&quot;
nor with GalliumNine.

P.S. As a side-note, the most interestingly looking issue I encountered with
GalliumNine was when one of the xyz coordinates on *some* objects very
obviously appeared to be clamped to 0 ;]</pre>
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

--1438462532.52E870.31054--

--===============0037549944==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0037549944==--
