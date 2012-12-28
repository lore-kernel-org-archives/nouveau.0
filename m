From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 46557] nouveau: NV4E acceleration corruption when
 DMA above 31-bit (2 Gig barrier)
Date: Fri, 28 Dec 2012 01:33:39 +0000
Message-ID: <bug-46557-8800-VNBld21NsG@http.bugs.freedesktop.org/>
References: <bug-46557-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1137238781=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-46557-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1137238781==
Content-Type: multipart/alternative; boundary="1356658420.58A1Cc5.23907"; charset="us-ascii"


--1356658420.58A1Cc5.23907
Date: Fri, 28 Dec 2012 01:33:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D46557

--- Comment #29 from Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 72201
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D72201&action=3Dedit
limit vm size to 31 bits (nv04-nv40,nv45)

Ok, original Salah's issue seems to be fixed. Xorg crashes and CACHE_ERRORs
look like separate bugs - please open new bug reports for them (note that f=
or
CACHE_ERRORs I advise running nouveau git kernel with
http://lists.freedesktop.org/archives/nouveau/2012-December/011780.html).

Rapha=C3=ABl Droz's: you have nv34, so changing something in *nv44.c* obvio=
usly
won't fix anything for you... Does the above patch help?

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1356658420.58A1Cc5.23907
Date: Fri, 28 Dec 2012 01:33:40 +0000
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
   title=3D"NEW --- - nouveau: NV4E acceleration corruption when DMA above =
31-bit (2 Gig barrier)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D46557#c29">Commen=
t # 29</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - nouveau: NV4E acceleration corruption when DMA above =
31-bit (2 Gig barrier)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D46557">bug 46557<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
marcin.slusarz&#64;gmail.com" title=3D"Marcin Slusarz &lt;marcin.slusarz&#6=
4;gmail.com&gt;"> <span class=3D"fn">Marcin Slusarz</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D72201"=
 name=3D"attach_72201" title=3D"limit vm size to 31 bits (nv04-nv40,nv45)">=
attachment 72201</a> <a href=3D"attachment.cgi?id=3D72201&amp;action=3Dedit=
" title=3D"limit vm size to 31 bits (nv04-nv40,nv45)">[details]</a></span> =
<a href=3D'page.cgi?id=3Dsplinter.html&amp;bug=3D46557&amp;attachment=3D722=
01'>[review]</a>
limit vm size to 31 bits (nv04-nv40,nv45)

Ok, original Salah's issue seems to be fixed. Xorg crashes and CACHE_ERRORs
look like separate bugs - please open new bug reports for them (note that f=
or
CACHE_ERRORs I advise running nouveau git kernel with
<a href=3D"http://lists.freedesktop.org/archives/nouveau/2012-December/0117=
80.html">http://lists.freedesktop.org/archives/nouveau/2012-December/011780=
.html</a>).

Rapha=C3=ABl Droz's: you have nv34, so changing something in *nv44.c* obvio=
usly
won't fix anything for you... Does the above patch help?</pre>
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

--1356658420.58A1Cc5.23907--

--===============1137238781==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1137238781==--
