From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 111843] Resume fails after suspend with nouveau and
 Gtx 1050 ti
Date: Fri, 27 Sep 2019 19:13:01 +0000
Message-ID: <bug-111843-8800-Dlo0AovJVG@http.bugs.freedesktop.org/>
References: <bug-111843-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1600008421=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-111843-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1600008421==
Content-Type: multipart/alternative; boundary="15696115812.D58e2.11953"
Content-Transfer-Encoding: 7bit


--15696115812.D58e2.11953
Date: Fri, 27 Sep 2019 19:13:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111843

--- Comment #3 from Karol Herbst <karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to txuxifel from comment #2)
> Created attachment 145558 [details]
> Dmesg with nouveau

thanks. There are two interesting bits in there:

* nouveau 0000:01:00.0: gr: intr 00000040
* nouveau 0000:01:00.0: bus: MMIO write of 800002af FAULT at 10eb14 [ TIMEO=
UT ]

Ben, did you ever see this issue? Is it something which might be fixed by y=
our
secboot rework?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15696115812.D58e2.11953
Date: Fri, 27 Sep 2019 19:13:01 +0000
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
   title=3D"NEW - Resume fails after suspend with nouveau and Gtx 1050 ti"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111843#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Resume fails after suspend with nouveau and Gtx 1050 ti"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111843">bug 11184=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
karolherbst&#64;gmail.com" title=3D"Karol Herbst &lt;karolherbst&#64;gmail.=
com&gt;"> <span class=3D"fn">Karol Herbst</span></a>
</span></b>
        <pre>(In reply to txuxifel from <a href=3D"show_bug.cgi?id=3D111843=
#c2">comment #2</a>)
<span class=3D"quote">&gt; Created <span class=3D""><a href=3D"attachment.c=
gi?id=3D145558" name=3D"attach_145558" title=3D"Dmesg with nouveau">attachm=
ent 145558</a> <a href=3D"attachment.cgi?id=3D145558&amp;action=3Dedit" tit=
le=3D"Dmesg with nouveau">[details]</a></span>
&gt; Dmesg with nouveau</span >

thanks. There are two interesting bits in there:

* nouveau 0000:01:00.0: gr: intr 00000040
* nouveau 0000:01:00.0: bus: MMIO write of 800002af FAULT at 10eb14 [ TIMEO=
UT ]

Ben, did you ever see this issue? Is it something which might be fixed by y=
our
secboot rework?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15696115812.D58e2.11953--

--===============1600008421==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1600008421==--
