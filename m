From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67382] [nouveau,
 nv50] linux 3.9.7-3.10.3: Xorg won't be available
Date: Thu, 22 Aug 2013 22:35:47 +0000
Message-ID: <bug-67382-8800-t6OnbsoEW5@http.bugs.freedesktop.org/>
References: <bug-67382-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0876212373=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-67382-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0876212373==
Content-Type: multipart/alternative; boundary="1377210947.2843d12.16741"; charset="us-ascii"


--1377210947.2843d12.16741
Date: Thu, 22 Aug 2013 22:35:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67382

--- Comment #34 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Here is a bit more information as to the blob's handing on the case

nv50

Simple register bashing

write(loadval | 0x0100000)
udelay(140s)
read()
write(0)

nv94/96

HWSQ

00000000: 5f 01 00           ewait #CRTC0_VBLANK 0x0
00000003: 5f 01 01           ewait #CRTC0_VBLANK 0x1
00000006: 0e                 wait 0x2 shl 0x6
00000007: 0d                 wait 0x1 shl 0x6
00000008: 02                 wait 0x2 shl 0x0
00000009: 01                 wait 0x1 shl 0x0
// the above are only valid if the output is already enabled
0000000a: e2 08 02 10 00     data 0x100208
0000000f: e0 0c a8 61 00     addr 0x61a80c
00000014: 00                 nop
00000015: 40 0c a8           addrlo 0xa80c
00000018: 05                 wait 0x1 shl 0x2
00000019: e2 00 00 00 00     data 0x0
0000001e: 40 0c a8           addrlo 0xa80c
00000021: 7f                 exit
00000022: 7f                 exit
00000023: 7f                 exit

PBUS.HWSQ.TRIGGER <= { TYPE = START | ENTRY_POINT = 0 }
PBUS.HWSQ.STATUS => { A = { IP = 0x5 | ACTIVE } }

if output is connected ~5,4 ms later
PDISPLAY.DAC[0x1].LOAD_CTRL => { LOAD_PATTERN = 0 | PRESENT = 0x7 }
PDISPLAY.DAC[0x1].LOAD_CTRL <= { LOAD_PATTERN = 0 | PRESENT = 0 }

otherwise in ~5us
PDISPLAY.DAC[0x1].LOAD_CTRL => { LOAD_PATTERN = 0 | PRESENT = 0x0 }
PDISPLAY.DAC[0x1].LOAD_CTRL <= { LOAD_PATTERN = 0 | PRESENT = 0 }

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377210947.2843d12.16741
Date: Thu, 22 Aug 2013 22:35:47 +0000
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
   title="NEW --- - [nouveau, nv50] linux 3.9.7-3.10.3: Xorg won't be available"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67382#c34">Comment # 34</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nouveau, nv50] linux 3.9.7-3.10.3: Xorg won't be available"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67382">bug 67382</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>Here is a bit more information as to the blob's handing on the case

nv50

Simple register bashing

write(loadval | 0x0100000)
udelay(140s)
read()
write(0)

nv94/96

HWSQ

00000000: 5f 01 00           ewait #CRTC0_VBLANK 0x0
00000003: 5f 01 01           ewait #CRTC0_VBLANK 0x1
00000006: 0e                 wait 0x2 shl 0x6
00000007: 0d                 wait 0x1 shl 0x6
00000008: 02                 wait 0x2 shl 0x0
00000009: 01                 wait 0x1 shl 0x0
// the above are only valid if the output is already enabled
0000000a: e2 08 02 10 00     data 0x100208
0000000f: e0 0c a8 61 00     addr 0x61a80c
00000014: 00                 nop
00000015: 40 0c a8           addrlo 0xa80c
00000018: 05                 wait 0x1 shl 0x2
00000019: e2 00 00 00 00     data 0x0
0000001e: 40 0c a8           addrlo 0xa80c
00000021: 7f                 exit
00000022: 7f                 exit
00000023: 7f                 exit

PBUS.HWSQ.TRIGGER &lt;= { TYPE = START | ENTRY_POINT = 0 }
PBUS.HWSQ.STATUS =&gt; { A = { IP = 0x5 | ACTIVE } }

if output is connected ~5,4 ms later
PDISPLAY.DAC[0x1].LOAD_CTRL =&gt; { LOAD_PATTERN = 0 | PRESENT = 0x7 }
PDISPLAY.DAC[0x1].LOAD_CTRL &lt;= { LOAD_PATTERN = 0 | PRESENT = 0 }

otherwise in ~5us
PDISPLAY.DAC[0x1].LOAD_CTRL =&gt; { LOAD_PATTERN = 0 | PRESENT = 0x0 }
PDISPLAY.DAC[0x1].LOAD_CTRL &lt;= { LOAD_PATTERN = 0 | PRESENT = 0 }</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377210947.2843d12.16741--

--===============0876212373==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0876212373==--
