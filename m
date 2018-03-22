From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 105626] [GT218][Regression] BUG: unable to handle
 kernel NULL pointer dereference at 0000000000000040
Date: Thu, 22 Mar 2018 15:58:36 +0000
Message-ID: <bug-105626-8800-w8Z6O5aUOh@http.bugs.freedesktop.org/>
References: <bug-105626-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2125267536=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-105626-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2125267536==
Content-Type: multipart/alternative; boundary="15217343151.5eEBbE4c.16190"
Content-Transfer-Encoding: 7bit


--15217343151.5eEBbE4c.16190
Date: Thu, 22 Mar 2018 15:58:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105626

--- Comment #6 from Philip Raets <philip.raets-CNXmb7IdZIWZIoH1IeqzKA@public.gmane.org> ---
I am using X

praets@PRAETS:~> loginctl show-session 1 -p Type
Type=3Dx11

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15217343151.5eEBbE4c.16190
Date: Thu, 22 Mar 2018 15:58:35 +0000
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
   title=3D"NEW - [GT218][Regression] BUG: unable to handle kernel NULL poi=
nter dereference at 0000000000000040"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105626#c6">Commen=
t # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [GT218][Regression] BUG: unable to handle kernel NULL poi=
nter dereference at 0000000000000040"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105626">bug 10562=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
philip.raets&#64;telenet.be" title=3D"Philip Raets &lt;philip.raets&#64;tel=
enet.be&gt;"> <span class=3D"fn">Philip Raets</span></a>
</span></b>
        <pre>I am using X

praets&#64;PRAETS:~&gt; loginctl show-session 1 -p Type
Type=3Dx11</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15217343151.5eEBbE4c.16190--

--===============2125267536==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2125267536==--
