From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91598] Broken Rendering of Plasma 5 Desktop
Date: Sun, 06 Sep 2015 20:12:09 +0000
Message-ID: <bug-91598-8800-vdlB1psclr@http.bugs.freedesktop.org/>
References: <bug-91598-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1996757547=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91598-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1996757547==
Content-Type: multipart/alternative; boundary="1441570329.5Dfa7b1C1.32596"; charset="UTF-8"


--1441570329.5Dfa7b1C1.32596
Date: Sun, 6 Sep 2015 20:12:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91598

--- Comment #13 from David March <davidmarch007-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Just wanted to add that this also can be replicated on KDE4 (I have since
downgraded to get a usable system) as well (although far more rare).  In this
case it is a freeze (sometimes indefinite) but I do not notice any visible
graphical corruption yet.  The same (mostly - kwin is listed rather than
plasmashell, of course messages as above are in the log like so:

(Note reverse order - output generated  using 'journalctl -r'
--------

Sep 06 12:42:39 gentoot3400 kernel: nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP
- TP 0 - e0c: 00000000, e18: 00000000, e1c: 000807f0, e20: 00002a00, e24:
00030000
Sep 06 12:42:39 gentoot3400 kernel: nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP
- TP 0 - RT_FAULT - Address 0047a7f200
Sep 06 12:42:39 gentoot3400 kernel: nouveau E[     PFB][0000:01:00.0] trapped
write at 0x0047a79000 on channel 0x0000f949 [kwin[1926]] PGRAPH/PROP/RT0
reason: PAGE_NOT_PRESENT
Sep 06 12:42:39 gentoot3400 kernel: nouveau E[  PGRAPH][0000:01:00.0] ch 4
[0x000f949000 kwin[1926]] subc 3 class 0x8297 mthd 0x1b0c data 0x1000f010
Sep 06 12:42:39 gentoot3400 kernel: nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP
- TP 0 - e0c: 00000000, e18: 00000000, e1c: 0000079e, e20: 00002a00, e24:
00030000
Sep 06 12:42:39 gentoot3400 kernel: nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP
- TP 0 - RT_FAULT - Address 0047a79000
Sep 06 12:42:39 gentoot3400 kernel: nouveau E[kwin[1926]] validate: -22
Sep 06 12:42:39 gentoot3400 kernel: nouveau E[kwin[1926]] validating bo list
Sep 06 12:42:39 gentoot3400 kernel: nouveau E[kwin[1926]] fail set_domain
Sep 06 12:42:39 gentoot3400 kernel: nouveau E[kwin[1926]] validate: -22

---------

So the issue is not just really an issue related to Plasma 5 although it is
worse on Plasma 5.  Again it does seem to occur far less often with KDE4
though.

New System Info:

Linux gentoot3400 4.2.0-gentoo #1 SMP Mon Aug 31 17:07:28 EDT 2015 x86_64
Intel(R) Core(TM)2 Quad CPU Q6600 @ 2.40GHz GenuineIntel GNU/Linux

media-libs/mesa-11.0.0_rc2
x11-drivers/xf86-video-nouveau-1.0.11
kde-base/kwin-4.11.22(4)
x11-base/xorg-server-1.17.2-r1

(with compositing ON)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1441570329.5Dfa7b1C1.32596
Date: Sun, 6 Sep 2015 20:12:09 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Broken Rendering of Plasma 5 Desktop"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91598#c13">Comment # 13</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Broken Rendering of Plasma 5 Desktop"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91598">bug 91598</a>
              from <span class="vcard"><a class="email" href="mailto:davidmarch007&#64;gmail.com" title="David March &lt;davidmarch007&#64;gmail.com&gt;"> <span class="fn">David March</span></a>
</span></b>
        <pre>Just wanted to add that this also can be replicated on KDE4 (I have since
downgraded to get a usable system) as well (although far more rare).  In this
case it is a freeze (sometimes indefinite) but I do not notice any visible
graphical corruption yet.  The same (mostly - kwin is listed rather than
plasmashell, of course messages as above are in the log like so:

(Note reverse order - output generated  using 'journalctl -r'
--------

Sep 06 12:42:39 gentoot3400 kernel: nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP
- TP 0 - e0c: 00000000, e18: 00000000, e1c: 000807f0, e20: 00002a00, e24:
00030000
Sep 06 12:42:39 gentoot3400 kernel: nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP
- TP 0 - RT_FAULT - Address 0047a7f200
Sep 06 12:42:39 gentoot3400 kernel: nouveau E[     PFB][0000:01:00.0] trapped
write at 0x0047a79000 on channel 0x0000f949 [kwin[1926]] PGRAPH/PROP/RT0
reason: PAGE_NOT_PRESENT
Sep 06 12:42:39 gentoot3400 kernel: nouveau E[  PGRAPH][0000:01:00.0] ch 4
[0x000f949000 kwin[1926]] subc 3 class 0x8297 mthd 0x1b0c data 0x1000f010
Sep 06 12:42:39 gentoot3400 kernel: nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP
- TP 0 - e0c: 00000000, e18: 00000000, e1c: 0000079e, e20: 00002a00, e24:
00030000
Sep 06 12:42:39 gentoot3400 kernel: nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP
- TP 0 - RT_FAULT - Address 0047a79000
Sep 06 12:42:39 gentoot3400 kernel: nouveau E[kwin[1926]] validate: -22
Sep 06 12:42:39 gentoot3400 kernel: nouveau E[kwin[1926]] validating bo list
Sep 06 12:42:39 gentoot3400 kernel: nouveau E[kwin[1926]] fail set_domain
Sep 06 12:42:39 gentoot3400 kernel: nouveau E[kwin[1926]] validate: -22

---------

So the issue is not just really an issue related to Plasma 5 although it is
worse on Plasma 5.  Again it does seem to occur far less often with KDE4
though.

New System Info:

Linux gentoot3400 4.2.0-gentoo #1 SMP Mon Aug 31 17:07:28 EDT 2015 x86_64
Intel(R) Core(TM)2 Quad CPU Q6600 &#64; 2.40GHz GenuineIntel GNU/Linux

media-libs/mesa-11.0.0_rc2
x11-drivers/xf86-video-nouveau-1.0.11
kde-base/kwin-4.11.22(4)
x11-base/xorg-server-1.17.2-r1

(with compositing ON)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1441570329.5Dfa7b1C1.32596--

--===============1996757547==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1996757547==--
