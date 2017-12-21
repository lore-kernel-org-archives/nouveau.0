From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 88272] [NVAC] Flickering screen on 1920x1080 monitor
 with 9400M in MacbookPro 5, 5
Date: Thu, 21 Dec 2017 19:54:56 +0000
Message-ID: <bug-88272-8800-BVOZ2yMUST@http.bugs.freedesktop.org/>
References: <bug-88272-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1586067346=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-88272-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1586067346==
Content-Type: multipart/alternative; boundary="15138860961.d277.1938";
 charset="UTF-8"


--15138860961.d277.1938
Date: Thu, 21 Dec 2017 19:54:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D88272

--- Comment #8 from mbazzinotti-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
Created attachment 136348
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D136348&action=3Dedit
nvidia demmio-trace MARKing important points in the monitor attach sequence

Todo
----=20
Use this trace log and compare with nouveau source code or (the not yet
provided) Nouveau trace to identify the distinction of nvidia blob providing
flicker free display. Then, incorporate those changes to nouveau in a way t=
hat
is unhindering to its present operation.

- INFO -

I had mmiotrace start at the point when my service "local" modprobes the nv=
idia
driver.

You can search with string "MARK" or "bazz" to see where I've marked the
different transition points.

I marked the following points: modprobe to VT, VT to X, plugin mDP adapter,
activate screen via xrandr, deactivate via xrandr, and unplug mDP cable.

This log was processed with envytools rnn/demmio
(https://github.com/envytools/envytools) and compressed by xz to a 4MB file.
You could use `xzcat | less` to view it. The file is Ansi color coded so ma=
ke
sure you're able to reap those reading benefits. The bootup and startx part=
s of
the log are likely extraneous but kept for posterity.=20

I still have the original mmiotrace log if necessary.

mmiotrace picks up other devices that are iomap'd throughout this recording.
demmio seems to have truncated or removed those details.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15138860961.d277.1938
Date: Thu, 21 Dec 2017 19:54:56 +0000
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
          bz_status_ASSIGNED "
   title=3D"ASSIGNED - [NVAC] Flickering screen on 1920x1080 monitor with 9=
400M in MacbookPro 5,5"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D88272#c8">Comment=
 # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_ASSIGNED "
   title=3D"ASSIGNED - [NVAC] Flickering screen on 1920x1080 monitor with 9=
400M in MacbookPro 5,5"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D88272">bug 88272<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mbazzinotti&#64;gmail.com" title=3D"mbazzinotti&#64;gmail.com">mbazzinotti&=
#64;gmail.com</a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D136348=
" name=3D"attach_136348" title=3D"nvidia demmio-trace MARKing important poi=
nts in the monitor attach sequence">attachment 136348</a> <a href=3D"attach=
ment.cgi?id=3D136348&amp;action=3Dedit" title=3D"nvidia demmio-trace MARKin=
g important points in the monitor attach sequence">[details]</a></span>
nvidia demmio-trace MARKing important points in the monitor attach sequence

Todo
----=20
Use this trace log and compare with nouveau source code or (the not yet
provided) Nouveau trace to identify the distinction of nvidia blob providing
flicker free display. Then, incorporate those changes to nouveau in a way t=
hat
is unhindering to its present operation.

- INFO -

I had mmiotrace start at the point when my service &quot;local&quot; modpro=
bes the nvidia
driver.

You can search with string &quot;MARK&quot; or &quot;bazz&quot; to see wher=
e I've marked the
different transition points.

I marked the following points: modprobe to VT, VT to X, plugin mDP adapter,
activate screen via xrandr, deactivate via xrandr, and unplug mDP cable.

This log was processed with envytools rnn/demmio
(<a href=3D"https://github.com/envytools/envytools">https://github.com/envy=
tools/envytools</a>) and compressed by xz to a 4MB file.
You could use `xzcat | less` to view it. The file is Ansi color coded so ma=
ke
sure you're able to reap those reading benefits. The bootup and startx part=
s of
the log are likely extraneous but kept for posterity.=20

I still have the original mmiotrace log if necessary.

mmiotrace picks up other devices that are iomap'd throughout this recording.
demmio seems to have truncated or removed those details.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15138860961.d277.1938--

--===============1586067346==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1586067346==--
