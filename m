From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 33165] [NVA3, NVA8] gpu lockup during driver probe
Date: Sun, 09 Mar 2014 11:25:03 +0000
Message-ID: <bug-33165-8800-2fBC8CPbbC@http.bugs.freedesktop.org/>
References: <bug-33165-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1860001168=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-33165-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1860001168==
Content-Type: multipart/alternative; boundary="1394364303.4DCbecd87.26315"; charset="us-ascii"


--1394364303.4DCbecd87.26315
Date: Sun, 9 Mar 2014 11:25:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D33165

--- Comment #27 from Andrius =C5=A0tikonas <andrius-4ZmsDwijFH7sq35pWSNszA@public.gmane.org> ---
(In reply to comment #26)
> Created attachment 95408 [details] [review]
> initialize stuff for gddr5 ram
>=20
> This patch is based on Andrew's mmiotrace. I saw a sequence of init that I
> didn't see in other traces for working cards. Andrew -- would be interest=
ing
> if you could check it out and see if it helps. The algorithm I came up wi=
th
> is insane -- there has to be some sort of data-driven thing going on ther=
e,
> but I couldn't work it out.
>=20
> For people having issues, please do a mmiotrace of the blob loading on yo=
ur
> card (see https://wiki.ubuntu.com/X/MMIOTracing for instructions), and se=
nd
> it (xz -9'd) to mmio.dumps-Re5JQEeQqe9fmgfxC/sS/w@public.gmane.org

I might be able to test this patch in the middle of April. Sorry, I can't
access that computer now.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1394364303.4DCbecd87.26315
Date: Sun, 9 Mar 2014 11:25:03 +0000
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
   title=3D"NEW --- - [NVA3, NVA8] gpu lockup during driver probe"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D33165#c27">Commen=
t # 27</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - [NVA3, NVA8] gpu lockup during driver probe"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D33165">bug 33165<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
andrius&#64;stikonas.eu" title=3D"Andrius =C5=A0tikonas &lt;andrius&#64;sti=
konas.eu&gt;"> <span class=3D"fn">Andrius =C5=A0tikonas</span></a>
</span></b>
        <pre>(In reply to <a href=3D"show_bug.cgi?id=3D33165#c26">comment #=
26</a>)
<span class=3D"quote">&gt; Created <span class=3D""><a href=3D"attachment.c=
gi?id=3D95408" name=3D"attach_95408" title=3D"initialize stuff for gddr5 ra=
m">attachment 95408</a> <a href=3D"attachment.cgi?id=3D95408&amp;action=3De=
dit" title=3D"initialize stuff for gddr5 ram">[details]</a></span> <a href=
=3D'page.cgi?id=3Dsplinter.html&amp;bug=3D33165&amp;attachment=3D95408'>[re=
view]</a> [review]
&gt; initialize stuff for gddr5 ram
&gt;=20
&gt; This patch is based on Andrew's mmiotrace. I saw a sequence of init th=
at I
&gt; didn't see in other traces for working cards. Andrew -- would be inter=
esting
&gt; if you could check it out and see if it helps. The algorithm I came up=
 with
&gt; is insane -- there has to be some sort of data-driven thing going on t=
here,
&gt; but I couldn't work it out.
&gt;=20
&gt; For people having issues, please do a mmiotrace of the blob loading on=
 your
&gt; card (see <a href=3D"https://wiki.ubuntu.com/X/MMIOTracing">https://wi=
ki.ubuntu.com/X/MMIOTracing</a> for instructions), and send
&gt; it (xz -9'd) to <a href=3D"mailto:mmio.dumps&#64;gmail.com">mmio.dumps=
&#64;gmail.com</a>.</span >

I might be able to test this patch in the middle of April. Sorry, I can't
access that computer now.</pre>
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

--1394364303.4DCbecd87.26315--

--===============1860001168==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1860001168==--
