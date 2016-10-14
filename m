From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98030] Stuttering video playback in totem after
 update to 1.19-rc1
Date: Fri, 14 Oct 2016 09:17:35 +0000
Message-ID: <bug-98030-8800-TmJgnMqEtv@http.bugs.freedesktop.org/>
References: <bug-98030-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0572270721=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-98030-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0572270721==
Content-Type: multipart/alternative; boundary="14764366550.7aFcD.24155";
 charset="UTF-8"


--14764366550.7aFcD.24155
Date: Fri, 14 Oct 2016 09:17:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98030

--- Comment #8 from Chris Wilson <chris-Y6uKTt2uX1cEflXRtASbqLVCufUGDwFn@public.gmane.org> ---
(In reply to Michel D=C3=A4nzer from comment #7)
> (In reply to Chris Wilson from comment #6)
> > -        if (NewOutputPending)
> > -            FlushAllOutput();
> > +       FlushAllOutput();
>=20
> This doesn't fix the problem for me.

Yeah, because the first thing FlushAllOutput() does is check NewOutputPendi=
ng.
Bleh. :| I'm still pretty certain it is the change in considering when to f=
lush
output that causes the event/replies to become stuck.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14764366550.7aFcD.24155
Date: Fri, 14 Oct 2016 09:17:35 +0000
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
   title=3D"NEW - Stuttering video playback in totem after update to 1.19-r=
c1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98030#c8">Comment=
 # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Stuttering video playback in totem after update to 1.19-r=
c1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98030">bug 98030<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
chris&#64;chris-wilson.co.uk" title=3D"Chris Wilson &lt;chris&#64;chris-wil=
son.co.uk&gt;"> <span class=3D"fn">Chris Wilson</span></a>
</span></b>
        <pre>(In reply to Michel D=C3=A4nzer from <a href=3D"show_bug.cgi?i=
d=3D98030#c7">comment #7</a>)
<span class=3D"quote">&gt; (In reply to Chris Wilson from <a href=3D"show_b=
ug.cgi?id=3D98030#c6">comment #6</a>)
&gt; &gt; -        if (NewOutputPending)
&gt; &gt; -            FlushAllOutput();
&gt; &gt; +       FlushAllOutput();
&gt;=20
&gt; This doesn't fix the problem for me.</span >

Yeah, because the first thing FlushAllOutput() does is check NewOutputPendi=
ng.
Bleh. :| I'm still pretty certain it is the change in considering when to f=
lush
output that causes the event/replies to become stuck.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14764366550.7aFcD.24155--

--===============0572270721==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0572270721==--
