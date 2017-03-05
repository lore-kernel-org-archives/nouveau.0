From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99913] [G96] Reclocking fails on voltage
Date: Sun, 05 Mar 2017 13:04:18 +0000
Message-ID: <bug-99913-8800-W5igQAe4WH@http.bugs.freedesktop.org/>
References: <bug-99913-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1463387194=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-99913-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1463387194==
Content-Type: multipart/alternative; boundary="14887190580.ef7b0c8b.27808";
 charset="UTF-8"


--14887190580.ef7b0c8b.27808
Date: Sun, 5 Mar 2017 13:04:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99913

Pekka Paalanen <ppaalanen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |NEEDINFO

--- Comment #9 from Pekka Paalanen <ppaalanen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Karol Herbst from comment #8)
> it would be quite unpleasant if nvidia would indeed use the highest clock
> level here.

Do you mean an noise or something else?

> And that mmiotrace seems a bit odd, because it accesses a GPIO which
> shouldn't exist and in any case it doesn't change the voltage of that GPU.

Yeah, I guessed it might not be enough, since it was recorded for HDMI
enablement. Thanks for taking a look.

> Would you mind checking what nvidia clocks to on this system?

Yeah, looks like I should be able to install the legacy drivers 340.x. I'll=
 put
that on my todo to record a new mmiotrace with some OpenGL action or someth=
ing
else to get the clocks to max.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14887190580.ef7b0c8b.27808
Date: Sun, 5 Mar 2017 13:04:18 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:ppaalanen=
&#64;gmail.com" title=3D"Pekka Paalanen &lt;ppaalanen&#64;gmail.com&gt;"> <=
span class=3D"fn">Pekka Paalanen</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEEDINFO "
   title=3D"NEEDINFO - [G96] Reclocking fails on voltage"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99913">bug 99913<=
/a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Status</td>
           <td>NEW
           </td>
           <td>NEEDINFO
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEEDINFO "
   title=3D"NEEDINFO - [G96] Reclocking fails on voltage"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99913#c9">Comment=
 # 9</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEEDINFO "
   title=3D"NEEDINFO - [G96] Reclocking fails on voltage"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99913">bug 99913<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
ppaalanen&#64;gmail.com" title=3D"Pekka Paalanen &lt;ppaalanen&#64;gmail.co=
m&gt;"> <span class=3D"fn">Pekka Paalanen</span></a>
</span></b>
        <pre>(In reply to Karol Herbst from <a href=3D"show_bug.cgi?id=3D99=
913#c8">comment #8</a>)
<span class=3D"quote">&gt; it would be quite unpleasant if nvidia would ind=
eed use the highest clock
&gt; level here.</span >

Do you mean an noise or something else?

<span class=3D"quote">&gt; And that mmiotrace seems a bit odd, because it a=
ccesses a GPIO which
&gt; shouldn't exist and in any case it doesn't change the voltage of that =
GPU.</span >

Yeah, I guessed it might not be enough, since it was recorded for HDMI
enablement. Thanks for taking a look.

<span class=3D"quote">&gt; Would you mind checking what nvidia clocks to on=
 this system?</span >

Yeah, looks like I should be able to install the legacy drivers 340.x. I'll=
 put
that on my todo to record a new mmiotrace with some OpenGL action or someth=
ing
else to get the clocks to max.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14887190580.ef7b0c8b.27808--

--===============1463387194==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1463387194==--
