From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 46557] nouveau: NV4E acceleration corruption when
 DMA above 31-bit (2 Gig barrier)
Date: Sat, 29 Dec 2012 14:35:27 +0000
Message-ID: <bug-46557-8800-tGDFl1UDz1@http.bugs.freedesktop.org/>
References: <bug-46557-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2027012231=="
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


--===============2027012231==
Content-Type: multipart/alternative; boundary="1356791728.E0300aAE4.3606"; charset="us-ascii"


--1356791728.E0300aAE4.3606
Date: Sat, 29 Dec 2012 14:35:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D46557

--- Comment #33 from Rapha=C3=ABl Droz <gibboris-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 72253
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D72253&action=3Dedit
nouveau CALL_SUBR_ACTIVE errors unpatched 3.7.0

oops, I spoke too soon. It just happened again with an unpatched 3.7 kernel.
I'll come back later after testing your patch, heavily.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1356791728.E0300aAE4.3606
Date: Sat, 29 Dec 2012 14:35:28 +0000
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
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - nouveau: NV4E acceleration corruption when DMA=
 above 31-bit (2 Gig barrier)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D46557#c33">Commen=
t # 33</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - nouveau: NV4E acceleration corruption when DMA=
 above 31-bit (2 Gig barrier)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D46557">bug 46557<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
gibboris&#64;gmail.com" title=3D"Rapha=C3=ABl Droz &lt;gibboris&#64;gmail.c=
om&gt;"> <span class=3D"fn">Rapha=C3=ABl Droz</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D72253"=
 name=3D"attach_72253" title=3D"nouveau CALL_SUBR_ACTIVE errors unpatched 3=
.7.0">attachment 72253</a> <a href=3D"attachment.cgi?id=3D72253&amp;action=
=3Dedit" title=3D"nouveau CALL_SUBR_ACTIVE errors unpatched 3.7.0">[details=
]</a></span>
nouveau CALL_SUBR_ACTIVE errors unpatched 3.7.0

oops, I spoke too soon. It just happened again with an unpatched 3.7 kernel.
I'll come back later after testing your patch, heavily.</pre>
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

--1356791728.E0300aAE4.3606--

--===============2027012231==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2027012231==--
