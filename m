From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 105626] [GT218][Regression] BUG: unable to handle
 kernel NULL pointer dereference at 0000000000000040
Date: Tue, 27 Mar 2018 08:48:08 +0000
Message-ID: <bug-105626-8800-t89CVi35IA@http.bugs.freedesktop.org/>
References: <bug-105626-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0403808911=="
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


--===============0403808911==
Content-Type: multipart/alternative; boundary="15221404881.5dD9.20688"
Content-Transfer-Encoding: 7bit


--15221404881.5dD9.20688
Date: Tue, 27 Mar 2018 08:48:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105626

--- Comment #8 from Philip Raets <philip.raets-CNXmb7IdZIWZIoH1IeqzKA@public.gmane.org> ---
I updated tumbleweed to snapshot 20180324
(https://lists.opensuse.org/opensuse-factory/2018-03/msg00615.html) which
contains updates for Mesa and I've updated the kernel to the latest build on
openSUSE:

praets@PRAETS:~> uname -a
Linux PRAETS.boma.local 4.16.0-rc6-3.g2539ea5-default #1 SMP PREEMPT Sun Ma=
r 25
11:36:35 UTC 2018 (2539ea5) x86_64 x86_64 x86_64 GNU/Linux

So far I haven't had any crashes anymore, tried opening a lot of photo's,
switching windows, maximizing windows, ...=20

So far so good

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15221404881.5dD9.20688
Date: Tue, 27 Mar 2018 08:48:08 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105626#c8">Commen=
t # 8</a>
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
        <pre>I updated tumbleweed to snapshot 20180324
(<a href=3D"https://lists.opensuse.org/opensuse-factory/2018-03/msg00615.ht=
ml">https://lists.opensuse.org/opensuse-factory/2018-03/msg00615.html</a>) =
which
contains updates for Mesa and I've updated the kernel to the latest build on
openSUSE:

praets&#64;PRAETS:~&gt; uname -a
Linux PRAETS.boma.local 4.16.0-rc6-3.g2539ea5-default #1 SMP PREEMPT Sun Ma=
r 25
11:36:35 UTC 2018 (2539ea5) x86_64 x86_64 x86_64 GNU/Linux

So far I haven't had any crashes anymore, tried opening a lot of photo's,
switching windows, maximizing windows, ...=20

So far so good</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15221404881.5dD9.20688--

--===============0403808911==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0403808911==--
