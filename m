From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90825] nouveau crashes on MacBookPro when VirtualBox
 hardware acceleration is used
Date: Fri, 23 Oct 2015 06:16:46 +0000
Message-ID: <bug-90825-8800-IRvSfpkR4j@http.bugs.freedesktop.org/>
References: <bug-90825-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0109011473=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90825-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0109011473==
Content-Type: multipart/alternative; boundary="1445581005.aad3C50.14767"; charset="UTF-8"


--1445581005.aad3C50.14767
Date: Fri, 23 Oct 2015 06:16:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90825

--- Comment #2 from Victor Costan <costan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I got the following errors with Fedora 23 and VirtualBox 5.0. The display
freezes completely, so I had to get the information from journalctl using the
previous boot info.

Oct 23 01:28:49 pwnie kernel: nouveau E[   PFIFO][0000:01:00.0] PBDMA0: PBENTRY
Oct 23 01:28:49 pwnie kernel: nouveau E[   PFIFO][0000:01:00.0] PBDMA0: ch 10
[VBoxCrWinCmd[20388]] subc 0 mthd 0x0000 data 0x00000000
Oct 23 01:28:49 pwnie kernel: nouveau E[   PFIFO][0000:01:00.0] PBDMA0: PBENTRY
Oct 23 01:28:49 pwnie kernel: nouveau E[   PFIFO][0000:01:00.0] PBDMA0: ch 10
[VBoxCrWinCmd[20388]] subc 0 mthd 0x0000 data 0x00000000
Oct 23 01:28:49 pwnie kernel: nouveau E[  PGRAPH][0000:01:00.0] DATA_ERROR
[INVALID_VALUE] ch 10 [0x003f675000 VBoxCrWinCmd[20388]] subc 0 class 0xa097
mthd 0x2388 data 0x2001091c
Oct 23 01:28:49 pwnie kernel: nouveau E[  PGRAPH][0000:01:00.0] DATA_ERROR
[INVALID_BITFIELD] ch 10 [0x003f675000 VBoxCrWinCmd[20388]] subc 0 class 0xa097
mthd 0x2470 data 0x3f000000
Oct 23 01:28:49 pwnie kernel: nouveau E[  PGRAPH][0000:01:00.0] DATA_ERROR
[INVALID_VALUE] ch 10 [0x003f675000 VBoxCrWinCmd[20388]] subc 0 class 0xa097
mthd 0x2388 data 0x800004b3
Oct 23 01:28:49 pwnie kernel: nouveau E[   PFIFO][0000:01:00.0] PBDMA0: PBENTRY
Oct 23 01:28:49 pwnie kernel: nouveau E[   PFIFO][0000:01:00.0] PBDMA0: ch 10
[VBoxCrWinCmd[20388]] subc 0 mthd 0x0000 data 0x00000000
Oct 23 01:28:49 pwnie kernel: nouveau E[   PFIFO][0000:01:00.0] PBDMA0: PBENTRY
Oct 23 01:28:49 pwnie kernel: nouveau E[   PFIFO][0000:01:00.0] PBDMA0: ch 10
[VBoxCrWinCmd[20388]] subc 0 mthd 0x0000 data 0x00000000
Oct 23 01:28:49 pwnie kernel: nouveau E[  PGRAPH][0000:01:00.0] DATA_ERROR
[INVALID_VALUE] ch 10 [0x003f675000 VBoxCrWinCmd[20388]] subc 0 class 0xa097
mthd 0x2388 data 0x2001091c
Oct 23 01:28:49 pwnie kernel: nouveau E[  PGRAPH][0000:01:00.0] DATA_ERROR
[INVALID_BITFIELD] ch 10 [0x003f675000 VBoxCrWinCmd[20388]] subc 0 class 0xa097
mthd 0x2470 data 0x3f000000
Oct 23 01:28:49 pwnie kernel: nouveau E[  PGRAPH][0000:01:00.0] DATA_ERROR
[INVALID_VALUE] ch 10 [0x003f675000 VBoxCrWinCmd[20388]] subc 0 class 0xa097
mthd 0x2388 data 0x800004b3
Oct 23 01:28:49 pwnie kernel: nouveau E[   PFIFO][0000:01:00.0] PBDMA0: PBENTRY
Oct 23 01:28:49 pwnie kernel: nouveau E[   PFIFO][0000:01:00.0] PBDMA0: ch 10
[VBoxCrWinCmd[20388]] subc 0 mthd 0x0000 data 0x00000000
Oct 23 01:28:49 pwnie kernel: nouveau E[  PGRAPH][0000:01:00.0] DATA_ERROR
[INVALID_BITFIELD] ch 10 [0x003f675000 VBoxCrWinCmd[20388]] subc 0 class 0xa097
mthd 0x2450 data 0x20010487
Oct 23 01:28:49 pwnie kernel: nouveau E[  PGRAPH][0000:01:00.0] DATA_ERROR
[INVALID_BITFIELD] ch 10 [0x003f675000 VBoxCrWinCmd[20388]] subc 3 class 0x902d
mthd 0x0880 data 0x200203fd
Oct 23 01:28:49 pwnie kernel: nouveau E[  PGRAPH][0000:01:00.0] DATA_ERROR
[INVALID_BITFIELD] ch 10 [0x003f675000 VBoxCrWinCmd[20388]] subc 3 class 0x902d
mthd 0x0884 data 0x04140000
Oct 23 01:28:49 pwnie kernel: nouveau E[  PGRAPH][0000:01:00.0] DATA_ERROR
[INVALID_BITFIELD] ch 10 [0x003f675000 VBoxCrWinCmd[20388]] subc 3 class 0x902d
mthd 0x0888 data 0x02fc0000
Oct 23 01:28:49 pwnie kernel: nouveau E[  PGRAPH][0000:01:00.0] DATA_ERROR
[INVALID_BITFIELD] ch 10 [0x003f675000 VBoxCrWinCmd[20388]] subc 3 class 0x902d
mthd 0x088c data 0x20090200
Oct 23 01:28:49 pwnie kernel: nouveau E[  PGRAPH][0000:01:00.0] ILLEGAL_MTHD ch
10 [0x003f675000 VBoxCrWinCmd[20388]] subc 3 class 0x902d mthd 0x0890 data
0x00000000
Oct 23 01:28:49 pwnie kernel: nouveau E[  PGRAPH][0000:01:00.0] ILLEGAL_MTHD ch
10 [0x003f675000 VBoxCrWinCmd[20388]] subc 3 class 0x902d mthd 0x0894 data
0x049a0000

Here are some relevant bits from glxinfo.

server glx vendor string: SGI
server glx version string: 1.4
client glx vendor string: Mesa Project and SGI
client glx version string: 1.4
OpenGL core profile version string: 4.1 (Core Profile) Mesa 11.0.3
(git-b4bfea0)
OpenGL core profile shading language version string: 4.10
OpenGL core profile context flags: (none)
OpenGL core profile profile mask: core profile
OpenGL version string: 3.0 Mesa 11.0.3 (git-b4bfea0)
OpenGL shading language version string: 1.30
OpenGL context flags: (none)

Thank you very much for looking into this bug! Is there anything else I can
provide to help investigate it?

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1445581005.aad3C50.14767
Date: Fri, 23 Oct 2015 06:16:45 +0000
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
   title="NEW - nouveau crashes on MacBookPro when VirtualBox hardware acceleration is used"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90825#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - nouveau crashes on MacBookPro when VirtualBox hardware acceleration is used"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90825">bug 90825</a>
              from <span class="vcard"><a class="email" href="mailto:costan&#64;gmail.com" title="Victor Costan &lt;costan&#64;gmail.com&gt;"> <span class="fn">Victor Costan</span></a>
</span></b>
        <pre>I got the following errors with Fedora 23 and VirtualBox 5.0. The display
freezes completely, so I had to get the information from journalctl using the
previous boot info.

Oct 23 01:28:49 pwnie kernel: nouveau E[   PFIFO][0000:01:00.0] PBDMA0: PBENTRY
Oct 23 01:28:49 pwnie kernel: nouveau E[   PFIFO][0000:01:00.0] PBDMA0: ch 10
[VBoxCrWinCmd[20388]] subc 0 mthd 0x0000 data 0x00000000
Oct 23 01:28:49 pwnie kernel: nouveau E[   PFIFO][0000:01:00.0] PBDMA0: PBENTRY
Oct 23 01:28:49 pwnie kernel: nouveau E[   PFIFO][0000:01:00.0] PBDMA0: ch 10
[VBoxCrWinCmd[20388]] subc 0 mthd 0x0000 data 0x00000000
Oct 23 01:28:49 pwnie kernel: nouveau E[  PGRAPH][0000:01:00.0] DATA_ERROR
[INVALID_VALUE] ch 10 [0x003f675000 VBoxCrWinCmd[20388]] subc 0 class 0xa097
mthd 0x2388 data 0x2001091c
Oct 23 01:28:49 pwnie kernel: nouveau E[  PGRAPH][0000:01:00.0] DATA_ERROR
[INVALID_BITFIELD] ch 10 [0x003f675000 VBoxCrWinCmd[20388]] subc 0 class 0xa097
mthd 0x2470 data 0x3f000000
Oct 23 01:28:49 pwnie kernel: nouveau E[  PGRAPH][0000:01:00.0] DATA_ERROR
[INVALID_VALUE] ch 10 [0x003f675000 VBoxCrWinCmd[20388]] subc 0 class 0xa097
mthd 0x2388 data 0x800004b3
Oct 23 01:28:49 pwnie kernel: nouveau E[   PFIFO][0000:01:00.0] PBDMA0: PBENTRY
Oct 23 01:28:49 pwnie kernel: nouveau E[   PFIFO][0000:01:00.0] PBDMA0: ch 10
[VBoxCrWinCmd[20388]] subc 0 mthd 0x0000 data 0x00000000
Oct 23 01:28:49 pwnie kernel: nouveau E[   PFIFO][0000:01:00.0] PBDMA0: PBENTRY
Oct 23 01:28:49 pwnie kernel: nouveau E[   PFIFO][0000:01:00.0] PBDMA0: ch 10
[VBoxCrWinCmd[20388]] subc 0 mthd 0x0000 data 0x00000000
Oct 23 01:28:49 pwnie kernel: nouveau E[  PGRAPH][0000:01:00.0] DATA_ERROR
[INVALID_VALUE] ch 10 [0x003f675000 VBoxCrWinCmd[20388]] subc 0 class 0xa097
mthd 0x2388 data 0x2001091c
Oct 23 01:28:49 pwnie kernel: nouveau E[  PGRAPH][0000:01:00.0] DATA_ERROR
[INVALID_BITFIELD] ch 10 [0x003f675000 VBoxCrWinCmd[20388]] subc 0 class 0xa097
mthd 0x2470 data 0x3f000000
Oct 23 01:28:49 pwnie kernel: nouveau E[  PGRAPH][0000:01:00.0] DATA_ERROR
[INVALID_VALUE] ch 10 [0x003f675000 VBoxCrWinCmd[20388]] subc 0 class 0xa097
mthd 0x2388 data 0x800004b3
Oct 23 01:28:49 pwnie kernel: nouveau E[   PFIFO][0000:01:00.0] PBDMA0: PBENTRY
Oct 23 01:28:49 pwnie kernel: nouveau E[   PFIFO][0000:01:00.0] PBDMA0: ch 10
[VBoxCrWinCmd[20388]] subc 0 mthd 0x0000 data 0x00000000
Oct 23 01:28:49 pwnie kernel: nouveau E[  PGRAPH][0000:01:00.0] DATA_ERROR
[INVALID_BITFIELD] ch 10 [0x003f675000 VBoxCrWinCmd[20388]] subc 0 class 0xa097
mthd 0x2450 data 0x20010487
Oct 23 01:28:49 pwnie kernel: nouveau E[  PGRAPH][0000:01:00.0] DATA_ERROR
[INVALID_BITFIELD] ch 10 [0x003f675000 VBoxCrWinCmd[20388]] subc 3 class 0x902d
mthd 0x0880 data 0x200203fd
Oct 23 01:28:49 pwnie kernel: nouveau E[  PGRAPH][0000:01:00.0] DATA_ERROR
[INVALID_BITFIELD] ch 10 [0x003f675000 VBoxCrWinCmd[20388]] subc 3 class 0x902d
mthd 0x0884 data 0x04140000
Oct 23 01:28:49 pwnie kernel: nouveau E[  PGRAPH][0000:01:00.0] DATA_ERROR
[INVALID_BITFIELD] ch 10 [0x003f675000 VBoxCrWinCmd[20388]] subc 3 class 0x902d
mthd 0x0888 data 0x02fc0000
Oct 23 01:28:49 pwnie kernel: nouveau E[  PGRAPH][0000:01:00.0] DATA_ERROR
[INVALID_BITFIELD] ch 10 [0x003f675000 VBoxCrWinCmd[20388]] subc 3 class 0x902d
mthd 0x088c data 0x20090200
Oct 23 01:28:49 pwnie kernel: nouveau E[  PGRAPH][0000:01:00.0] ILLEGAL_MTHD ch
10 [0x003f675000 VBoxCrWinCmd[20388]] subc 3 class 0x902d mthd 0x0890 data
0x00000000
Oct 23 01:28:49 pwnie kernel: nouveau E[  PGRAPH][0000:01:00.0] ILLEGAL_MTHD ch
10 [0x003f675000 VBoxCrWinCmd[20388]] subc 3 class 0x902d mthd 0x0894 data
0x049a0000

Here are some relevant bits from glxinfo.

server glx vendor string: SGI
server glx version string: 1.4
client glx vendor string: Mesa Project and SGI
client glx version string: 1.4
OpenGL core profile version string: 4.1 (Core Profile) Mesa 11.0.3
(git-b4bfea0)
OpenGL core profile shading language version string: 4.10
OpenGL core profile context flags: (none)
OpenGL core profile profile mask: core profile
OpenGL version string: 3.0 Mesa 11.0.3 (git-b4bfea0)
OpenGL shading language version string: 1.30
OpenGL context flags: (none)

Thank you very much for looking into this bug! Is there anything else I can
provide to help investigate it?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1445581005.aad3C50.14767--

--===============0109011473==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0109011473==--
