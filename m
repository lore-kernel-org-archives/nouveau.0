From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70354] [NVE7] Failed to initialise context object:
 2D_NVC0 (0) (for my GeForce GT 750M)
Date: Sat, 12 Oct 2013 20:13:42 +0000
Message-ID: <bug-70354-8800-YUUiKwzdNO@http.bugs.freedesktop.org/>
References: <bug-70354-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0453904835=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70354-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0453904835==
Content-Type: multipart/alternative; boundary="1381608822.FB732.22878"; charset="us-ascii"


--1381608822.FB732.22878
Date: Sat, 12 Oct 2013 20:13:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70354

--- Comment #7 from 4712.joey-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
(In reply to comment #6)

Without external firmware (without config=NvGrUseFw=1) the dmesg when starting
X looks like this: (very similar to the one reported above, as far as I can
see)


[  969.762998] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x300000 [ IBUS ]
[  969.763048] nouveau E[   PIBUS][0000:01:00.0] GPC0: 0x419eb4 0xbadf1000
(0x3800820c)
[  971.764879] nouveau E[  PGRAPH][0000:01:00.0] HUB_INIT timed out
[  971.764886] nouveau E[  PGRAPH][0000:01:00.0] 409000 - done 0x00000244
[  971.764896] nouveau E[  PGRAPH][0000:01:00.0] 409000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[  971.764906] nouveau E[  PGRAPH][0000:01:00.0] 409000 - stat 0x00000000
0x00000000 0x00000002 0x00000009
[  971.764909] nouveau E[  PGRAPH][0000:01:00.0] 502000 - done 0x00000300
[  971.764915] nouveau E[  PGRAPH][0000:01:00.0] 502000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[  971.764920] nouveau E[  PGRAPH][0000:01:00.0] 502000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[  971.764922] nouveau E[  PGRAPH][0000:01:00.0] init failed, -16

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1381608822.FB732.22878
Date: Sat, 12 Oct 2013 20:13:42 +0000
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
   title="NEW --- - [NVE7] Failed to initialise context object: 2D_NVC0 (0) (for my GeForce GT 750M)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70354#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE7] Failed to initialise context object: 2D_NVC0 (0) (for my GeForce GT 750M)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70354">bug 70354</a>
              from <span class="vcard"><a class="email" href="mailto:4712.joey&#64;gmail.com" title="4712.joey&#64;gmail.com">4712.joey&#64;gmail.com</a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=70354#c6">comment #6</a>)

Without external firmware (without config=NvGrUseFw=1) the dmesg when starting
X looks like this: (very similar to the one reported above, as far as I can
see)


[  969.762998] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x300000 [ IBUS ]
[  969.763048] nouveau E[   PIBUS][0000:01:00.0] GPC0: 0x419eb4 0xbadf1000
(0x3800820c)
[  971.764879] nouveau E[  PGRAPH][0000:01:00.0] HUB_INIT timed out
[  971.764886] nouveau E[  PGRAPH][0000:01:00.0] 409000 - done 0x00000244
[  971.764896] nouveau E[  PGRAPH][0000:01:00.0] 409000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[  971.764906] nouveau E[  PGRAPH][0000:01:00.0] 409000 - stat 0x00000000
0x00000000 0x00000002 0x00000009
[  971.764909] nouveau E[  PGRAPH][0000:01:00.0] 502000 - done 0x00000300
[  971.764915] nouveau E[  PGRAPH][0000:01:00.0] 502000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[  971.764920] nouveau E[  PGRAPH][0000:01:00.0] 502000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[  971.764922] nouveau E[  PGRAPH][0000:01:00.0] init failed, -16</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1381608822.FB732.22878--

--===============0453904835==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0453904835==--
