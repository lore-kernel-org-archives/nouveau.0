From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 103421] Kernel 4.13+ nouveau breaks screen output
Date: Fri, 10 Nov 2017 15:12:23 +0000
Message-ID: <bug-103421-8800-KePQ23BTbp@http.bugs.freedesktop.org/>
References: <bug-103421-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1883207779=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-103421-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1883207779==
Content-Type: multipart/alternative; boundary="15103267434.5b09CE.10287";
 charset="UTF-8"


--15103267434.5b09CE.10287
Date: Fri, 10 Nov 2017 15:12:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D103421

--- Comment #3 from m-mickan-cl+VPiYnx/1AfugRpC6u6w@public.gmane.org ---
I think I have the same issue with the mobile version of that card:

01:00.0 VGA compatible controller: NVIDIA Corporation GF119M [Quadro NVS 42=
00M]
(rev a1)

It is an optimus setup, so the nvidia card is only used when I plug in a
monitor into the DisplayPort.

I compiled the kernel with commit af85389c614ae04970c0eea7a5c50fb889c8a480 =
and
its parent.
With the parent, there were no error messages from the kernel, but the outp=
ut
was static and full of glitches. With the mentioned commit, there were error
messages from the kernel and no output at all.

I attached the kernel log (with kernel version 4.13.11) and the dmesg output
after plugging in a monitor into the Displayport (kernel compiled from comm=
it
af85389c614ae).

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15103267434.5b09CE.10287
Date: Fri, 10 Nov 2017 15:12:23 +0000
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
   title=3D"NEW - Kernel 4.13+ nouveau breaks screen output"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103421#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Kernel 4.13+ nouveau breaks screen output"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103421">bug 10342=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
m-mickan&#64;mailbox.org" title=3D"m-mickan&#64;mailbox.org">m-mickan&#64;m=
ailbox.org</a>
</span></b>
        <pre>I think I have the same issue with the mobile version of that =
card:

01:00.0 VGA compatible controller: NVIDIA Corporation GF119M [Quadro NVS 42=
00M]
(rev a1)

It is an optimus setup, so the nvidia card is only used when I plug in a
monitor into the DisplayPort.

I compiled the kernel with commit af85389c614ae04970c0eea7a5c50fb889c8a480 =
and
its parent.
With the parent, there were no error messages from the kernel, but the outp=
ut
was static and full of glitches. With the mentioned commit, there were error
messages from the kernel and no output at all.

I attached the kernel log (with kernel version 4.13.11) and the dmesg output
after plugging in a monitor into the Displayport (kernel compiled from comm=
it
af85389c614ae).</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15103267434.5b09CE.10287--

--===============1883207779==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1883207779==--
