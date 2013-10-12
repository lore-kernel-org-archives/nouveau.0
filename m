From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70354] [NVE7] Failed to initialise context object:
 2D_NVC0 (0) (for my GeForce GT 750M)
Date: Sat, 12 Oct 2013 19:58:16 +0000
Message-ID: <bug-70354-8800-9CbfaVp1ZO@http.bugs.freedesktop.org/>
References: <bug-70354-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1042849854=="
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


--===============1042849854==
Content-Type: multipart/alternative; boundary="1381607896.DD8Bf2c2.19492"; charset="us-ascii"


--1381607896.DD8Bf2c2.19492
Date: Sat, 12 Oct 2013 19:58:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70354

--- Comment #6 from 4712.joey-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
Think I have the same problem on my Geforce GT 750M on Asus N750JV laptop.

I'm using Manjaro Linux and tried it with Kernel 3.11 and 3.12. 

After fixing the loading of the vbios (see
https://bugs.freedesktop.org/show_bug.cgi?id=70208) I get the following
message:

 Failed to initialise context object: 2D_NVC0 (0)

When I extract the firmware and load the nouveau kernel module with
config=NvGrUseFw=1 I'm getting this error on dmesg when starting X:

 [   43.161759] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x300000 [ IBUS ]
 [   43.161803] nouveau E[   PIBUS][0000:01:00.0] GPC0: 0x419eb4 0xbadf1000
(0x3800820c)
 [   45.164110] nouveau E[  PGRAPH][0000:01:00.0] fuc09 req 0x10 timeout
 [   45.164114] nouveau E[  PGRAPH][0000:01:00.0] init failed, -16


I will attach the full dmesg for both kernels, with and without using external
firmware. Please also note that I extracted the firmware myself and I'm not
sure if the generated firmware files are correct.

In addition I will send mmiotrace of the working nvidia blob driver to mmio dot
dumps at gmail dot com.

If you need more information or if I can support you in any way having a closer
look at this, please just let me know :-)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1381607896.DD8Bf2c2.19492
Date: Sat, 12 Oct 2013 19:58:16 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70354#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE7] Failed to initialise context object: 2D_NVC0 (0) (for my GeForce GT 750M)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70354">bug 70354</a>
              from <span class="vcard"><a class="email" href="mailto:4712.joey&#64;gmail.com" title="4712.joey&#64;gmail.com">4712.joey&#64;gmail.com</a>
</span></b>
        <pre>Think I have the same problem on my Geforce GT 750M on Asus N750JV laptop.

I'm using Manjaro Linux and tried it with Kernel 3.11 and 3.12. 

After fixing the loading of the vbios (see
<a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Nouveau driver doesn't find vbios for Geforce GT 750M on Asus N750JV laptop"
   href="show_bug.cgi?id=70208">https://bugs.freedesktop.org/show_bug.cgi?id=70208</a>) I get the following
message:

 Failed to initialise context object: 2D_NVC0 (0)

When I extract the firmware and load the nouveau kernel module with
config=NvGrUseFw=1 I'm getting this error on dmesg when starting X:

 [   43.161759] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x300000 [ IBUS ]
 [   43.161803] nouveau E[   PIBUS][0000:01:00.0] GPC0: 0x419eb4 0xbadf1000
(0x3800820c)
 [   45.164110] nouveau E[  PGRAPH][0000:01:00.0] fuc09 req 0x10 timeout
 [   45.164114] nouveau E[  PGRAPH][0000:01:00.0] init failed, -16


I will attach the full dmesg for both kernels, with and without using external
firmware. Please also note that I extracted the firmware myself and I'm not
sure if the generated firmware files are correct.

In addition I will send mmiotrace of the working nvidia blob driver to mmio dot
dumps at gmail dot com.

If you need more information or if I can support you in any way having a closer
look at this, please just let me know :-)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1381607896.DD8Bf2c2.19492--

--===============1042849854==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1042849854==--
