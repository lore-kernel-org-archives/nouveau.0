From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 97588] Disconnecting/Reconnecting monitor results in
 'laggy' graphics and disappearing mouse cursor
Date: Sat, 03 Sep 2016 22:19:56 +0000
Message-ID: <bug-97588-8800-cwJiCg8Lcy@http.bugs.freedesktop.org/>
References: <bug-97588-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0687790946=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-97588-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0687790946==
Content-Type: multipart/alternative; boundary="14729411951.33De.25415";
 charset="UTF-8"


--14729411951.33De.25415
Date: Sat, 3 Sep 2016 22:19:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D97588

--- Comment #10 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
And no messages are constantly repeating in "steady state"? If not, I got
nothing. Otherwise we're not properly clearing some interrupt state. I do s=
ee

nouveau 0000:01:00.0: disp: DAC1 sense: 80100000

a whole bunch. Which reminds me - there was some userspace application that
kept polling and repolling connector state and messing things up. Perhaps t=
he
unplug/plug activates it in your desktop environment?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14729411951.33De.25415
Date: Sat, 3 Sep 2016 22:19:55 +0000
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
   title=3D"NEW - Disconnecting/Reconnecting monitor results in 'laggy' gra=
phics and disappearing mouse cursor"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97588#c10">Commen=
t # 10</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Disconnecting/Reconnecting monitor results in 'laggy' gra=
phics and disappearing mouse cursor"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97588">bug 97588<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>And no messages are constantly repeating in &quot;steady state=
&quot;? If not, I got
nothing. Otherwise we're not properly clearing some interrupt state. I do s=
ee

nouveau 0000:01:00.0: disp: DAC1 sense: 80100000

a whole bunch. Which reminds me - there was some userspace application that
kept polling and repolling connector state and messing things up. Perhaps t=
he
unplug/plug activates it in your desktop environment?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14729411951.33De.25415--

--===============0687790946==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0687790946==--
