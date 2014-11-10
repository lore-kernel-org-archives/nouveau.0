From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 86115] [NV84] gpu hang on resume from suspend to ram
Date: Mon, 10 Nov 2014 19:36:07 +0000
Message-ID: <bug-86115-8800-hNuHIoFtbJ@http.bugs.freedesktop.org/>
References: <bug-86115-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0668848432=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-86115-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0668848432==
Content-Type: multipart/alternative; boundary="1415648167.f6C8F4CD2.20726"; charset="UTF-8"


--1415648167.f6C8F4CD2.20726
Date: Mon, 10 Nov 2014 19:36:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D86115

--- Comment #11 from Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org> ---
(In reply to Lars M=C3=BCller from comment #9)
> Created attachment 109236 [details]
> Retest S3 after calling: echo 0 > /sys/power/pm_async
>=20
> With /sys/power/pm_async set to 0 the system no longer crashes while resu=
me.
>=20
> I'm able to ssh into the system but x.org doesn't come back.  The two
> screens stay black.

OK, then I guess you're seeing two distinct issues.  One is the broken grap=
hics
by S3, and another is the kernel panic due to the stall of disk PM.  Disabl=
ing
async PM seems curing the latter while the graphics remains broken.

Could you try to boot with nomodeset boot option in runlevel 3, and try S3,=
 but
without pm_async adjustment?  The graphics can be broken in this case after=
 S3,
but if the system alives, you should be able to remote-login.

If S3 crashes even without nouveau, we can check the two issues above
completely separately.  If S3 crash happens only with nouveau, it implies t=
hat
the disk problem is somehow related with nouveau problem.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1415648167.f6C8F4CD2.20726
Date: Mon, 10 Nov 2014 19:36:07 +0000
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
   title=3D"NEW - [NV84] gpu hang on resume from suspend to ram"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D86115#c11">Commen=
t # 11</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV84] gpu hang on resume from suspend to ram"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D86115">bug 86115<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
tiwai&#64;suse.de" title=3D"Takashi Iwai &lt;tiwai&#64;suse.de&gt;"> <span =
class=3D"fn">Takashi Iwai</span></a>
</span></b>
        <pre>(In reply to Lars M=C3=BCller from <a href=3D"show_bug.cgi?id=
=3D86115#c9">comment #9</a>)
<span class=3D"quote">&gt; Created <span class=3D""><a href=3D"attachment.c=
gi?id=3D109236" name=3D"attach_109236" title=3D"Retest S3 after calling: ec=
ho 0 &gt; /sys/power/pm_async">attachment 109236</a> <a href=3D"attachment.=
cgi?id=3D109236&amp;action=3Dedit" title=3D"Retest S3 after calling: echo 0=
 &gt; /sys/power/pm_async">[details]</a></span>
&gt; Retest S3 after calling: echo 0 &gt; /sys/power/pm_async
&gt;=20
&gt; With /sys/power/pm_async set to 0 the system no longer crashes while r=
esume.
&gt;=20
&gt; I'm able to ssh into the system but x.org doesn't come back.  The two
&gt; screens stay black.</span >

OK, then I guess you're seeing two distinct issues.  One is the broken grap=
hics
by S3, and another is the kernel panic due to the stall of disk PM.  Disabl=
ing
async PM seems curing the latter while the graphics remains broken.

Could you try to boot with nomodeset boot option in runlevel 3, and try S3,=
 but
without pm_async adjustment?  The graphics can be broken in this case after=
 S3,
but if the system alives, you should be able to remote-login.

If S3 crashes even without nouveau, we can check the two issues above
completely separately.  If S3 crash happens only with nouveau, it implies t=
hat
the disk problem is somehow related with nouveau problem.</pre>
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

--1415648167.f6C8F4CD2.20726--

--===============0668848432==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0668848432==--
