From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 83957] [NV50 - NVAF][MCP89] Major screen corruption
 and X crash soon after log in
Date: Wed, 17 Sep 2014 12:24:42 +0000
Message-ID: <bug-83957-8800-Z1VQpmf30r@http.bugs.freedesktop.org/>
References: <bug-83957-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2077322477=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-83957-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2077322477==
Content-Type: multipart/alternative; boundary="1410956682.fDFbB61.24358"; charset="us-ascii"


--1410956682.fDFbB61.24358
Date: Wed, 17 Sep 2014 12:24:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D83957

--- Comment #5 from Lo=C3=AFc Herry <qc.loic-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #4)
> This seems like an extremely unlikely thing to help, but could you try
> booting with
>=20
> nouveau.config=3DPCE0=3D1
>=20
> This should force-enable the copy engine (which is being disabled because=
 we
> see bits that we think mean it should be disabled). I suspect things will=
 be
> even worse with that, but... worth a shot, I suppose?

It made things worse. With nouveau.config=3DPCE0=3D1 the boot and login scr=
een are
unreadable.

I'm booting in EFI with grub.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1410956682.fDFbB61.24358
Date: Wed, 17 Sep 2014 12:24:42 +0000
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
   title=3D"NEW --- - [NV50 - NVAF][MCP89] Major screen corruption and X cr=
ash soon after log in"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D83957#c5">Comment=
 # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - [NV50 - NVAF][MCP89] Major screen corruption and X cr=
ash soon after log in"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D83957">bug 83957<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
qc.loic&#64;gmail.com" title=3D"Lo=C3=AFc Herry &lt;qc.loic&#64;gmail.com&g=
t;"> <span class=3D"fn">Lo=C3=AFc Herry</span></a>
</span></b>
        <pre>(In reply to <a href=3D"show_bug.cgi?id=3D83957#c4">comment #4=
</a>)
<span class=3D"quote">&gt; This seems like an extremely unlikely thing to h=
elp, but could you try
&gt; booting with
&gt;=20
&gt; nouveau.config=3DPCE0=3D1
&gt;=20
&gt; This should force-enable the copy engine (which is being disabled beca=
use we
&gt; see bits that we think mean it should be disabled). I suspect things w=
ill be
&gt; even worse with that, but... worth a shot, I suppose?</span >

It made things worse. With nouveau.config=3DPCE0=3D1 the boot and login scr=
een are
unreadable.

I'm booting in EFI with grub.</pre>
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

--1410956682.fDFbB61.24358--

--===============2077322477==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2077322477==--
