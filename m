From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 103721] [GM107] Frequent freezes with nouveau on
	Thinkpad P50
Date: Tue, 16 Jan 2018 19:56:00 +0000
Message-ID: <bug-103721-8800-6TebkAmBQ6@http.bugs.freedesktop.org/>
References: <bug-103721-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0184076622=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-103721-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0184076622==
Content-Type: multipart/alternative; boundary="15161325600.6F5E.1614"
Content-Transfer-Encoding: 7bit


--15161325600.6F5E.1614
Date: Tue, 16 Jan 2018 19:56:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D103721

--- Comment #5 from James Hewitt <james.hewitt-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 136787
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D136787&action=3Dedit
journalctl -k from a recent freeze, newer kernel, newer bios, still occuring

Have had three recent freezes with a newer bios and newer kernel. Full log =
of
last freeze attached. Was editing a video in kdenlive, and could still hear=
 the
audio of the video and notifications coming in, so its not a 100% freeze. No
keyboard or mouse input was responsive, video wasn't updating on screen.

End of logs for last three freezes:

Jan 16 13:08:24 ibm007470 kernel: nouveau 0000:01:00.0: disp: 0x00006671[0]:
INIT_GENERIC_CONDITON: unknown 0x07
Jan 16 13:21:57 ibm007470 kernel: nouveau 0000:01:00.0: fifo: write fault at
000cc40000 engine 00 [GR] client 0f [GPC0/PROP_0] reason 00 [PDE] on channe=
l 7
[007f087000 Xorg[2752]]
Jan 16 13:21:57 ibm007470 kernel: nouveau 0000:01:00.0: fifo: channel 7: ki=
lled
Jan 16 13:21:57 ibm007470 kernel: nouveau 0000:01:00.0: fifo: runlist 0:
scheduled for recovery
Jan 16 13:21:57 ibm007470 kernel: nouveau 0000:01:00.0: fifo: engine 0:
scheduled for recovery
Jan 16 13:21:57 ibm007470 kernel: nouveau 0000:01:00.0: Xorg[2752]: channel=
 7
killed!


Jan 16 12:12:02 ibm007470 kernel: nouveau 0000:01:00.0: fifo: read fault at
8e8e32b000 engine 00 [GR] client 0d [GPC0/GCC] reason 00 [PDE] on channel 7
[007f10f000 Xorg[3050]]
Jan 16 12:12:02 ibm007470 kernel: nouveau 0000:01:00.0: fifo: channel 7: ki=
lled
Jan 16 12:12:02 ibm007470 kernel: nouveau 0000:01:00.0: fifo: runlist 0:
scheduled for recovery
Jan 16 12:12:02 ibm007470 kernel: nouveau 0000:01:00.0: fifo: engine 0:
scheduled for recovery


Jan 14 18:30:20 ibm007470 kernel: nouveau 0000:01:00.0: fifo: read fault at
002fda0000 engine 00 [GR] client 0f [GPC0/PROP_0] reason 00 [PDE] on channe=
l 4
[007f9e9000 systemd-logind[1052]]
Jan 14 18:30:20 ibm007470 kernel: nouveau 0000:01:00.0: fifo: channel 4: ki=
lled
Jan 14 18:30:20 ibm007470 kernel: nouveau 0000:01:00.0: fifo: runlist 0:
scheduled for recovery
Jan 14 18:30:20 ibm007470 kernel: nouveau 0000:01:00.0: fifo: engine 0:
scheduled for recovery

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15161325600.6F5E.1614
Date: Tue, 16 Jan 2018 19:56:00 +0000
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
   title=3D"NEW - [GM107] Frequent freezes with nouveau on Thinkpad P50"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103721#c5">Commen=
t # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [GM107] Frequent freezes with nouveau on Thinkpad P50"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103721">bug 10372=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
james.hewitt&#64;gmail.com" title=3D"James Hewitt &lt;james.hewitt&#64;gmai=
l.com&gt;"> <span class=3D"fn">James Hewitt</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D136787=
" name=3D"attach_136787" title=3D"journalctl -k from a recent freeze, newer=
 kernel, newer bios, still occuring">attachment 136787</a> <a href=3D"attac=
hment.cgi?id=3D136787&amp;action=3Dedit" title=3D"journalctl -k from a rece=
nt freeze, newer kernel, newer bios, still occuring">[details]</a></span>
journalctl -k from a recent freeze, newer kernel, newer bios, still occuring

Have had three recent freezes with a newer bios and newer kernel. Full log =
of
last freeze attached. Was editing a video in kdenlive, and could still hear=
 the
audio of the video and notifications coming in, so its not a 100% freeze. No
keyboard or mouse input was responsive, video wasn't updating on screen.

End of logs for last three freezes:

Jan 16 13:08:24 ibm007470 kernel: nouveau 0000:01:00.0: disp: 0x00006671[0]:
INIT_GENERIC_CONDITON: unknown 0x07
Jan 16 13:21:57 ibm007470 kernel: nouveau 0000:01:00.0: fifo: write fault at
000cc40000 engine 00 [GR] client 0f [GPC0/PROP_0] reason 00 [PDE] on channe=
l 7
[007f087000 Xorg[2752]]
Jan 16 13:21:57 ibm007470 kernel: nouveau 0000:01:00.0: fifo: channel 7: ki=
lled
Jan 16 13:21:57 ibm007470 kernel: nouveau 0000:01:00.0: fifo: runlist 0:
scheduled for recovery
Jan 16 13:21:57 ibm007470 kernel: nouveau 0000:01:00.0: fifo: engine 0:
scheduled for recovery
Jan 16 13:21:57 ibm007470 kernel: nouveau 0000:01:00.0: Xorg[2752]: channel=
 7
killed!


Jan 16 12:12:02 ibm007470 kernel: nouveau 0000:01:00.0: fifo: read fault at
8e8e32b000 engine 00 [GR] client 0d [GPC0/GCC] reason 00 [PDE] on channel 7
[007f10f000 Xorg[3050]]
Jan 16 12:12:02 ibm007470 kernel: nouveau 0000:01:00.0: fifo: channel 7: ki=
lled
Jan 16 12:12:02 ibm007470 kernel: nouveau 0000:01:00.0: fifo: runlist 0:
scheduled for recovery
Jan 16 12:12:02 ibm007470 kernel: nouveau 0000:01:00.0: fifo: engine 0:
scheduled for recovery


Jan 14 18:30:20 ibm007470 kernel: nouveau 0000:01:00.0: fifo: read fault at
002fda0000 engine 00 [GR] client 0f [GPC0/PROP_0] reason 00 [PDE] on channe=
l 4
[007f9e9000 systemd-logind[1052]]
Jan 14 18:30:20 ibm007470 kernel: nouveau 0000:01:00.0: fifo: channel 4: ki=
lled
Jan 14 18:30:20 ibm007470 kernel: nouveau 0000:01:00.0: fifo: runlist 0:
scheduled for recovery
Jan 14 18:30:20 ibm007470 kernel: nouveau 0000:01:00.0: fifo: engine 0:
scheduled for recovery</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15161325600.6F5E.1614--

--===============0184076622==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0184076622==--
