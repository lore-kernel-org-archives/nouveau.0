From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 72458] [NV63] Machine freezes when launching Firefox
Date: Sun, 08 Dec 2013 04:08:07 +0000
Message-ID: <bug-72458-8800-pDKIlMoWnV@http.bugs.freedesktop.org/>
References: <bug-72458-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1127510062=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-72458-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1127510062==
Content-Type: multipart/alternative; boundary="1386475687.e2a8Ef1.10593"; charset="us-ascii"


--1386475687.e2a8Ef1.10593
Date: Sun, 8 Dec 2013 04:08:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=72458

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|Machine freezes when        |[NV63] Machine freezes when
                   |launching Firefox           |launching Firefox

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Some relevant bits from the log. Pretty sure that the MMIO writes to b010/b020
aren't an issue... although I am a bit surprised you're seeing them. I wonder
if firefox is somehow managing to invoke PMPEG. Or it could be the fifo getting
fed random stuff causing it.

Also, your kernel is compiled with gcc-4.8. Are you using a libdrm before
2.4.48 also compiled with gcc-4.8? If so, upgrade, or use an older gcc.

[ 4986.606330] nouveau E[   PFIFO][0000:00:10.0] DMA_PUSHER - ch 4
[firefox[3578]] get 0x0036a000 put 0x0036a088 state 0xc0000000 (err: MEM_FAULT)
push 0x00000000

MEM_FAULT? A little coincidental that the get pointer is at a page boundary.
But this is pre-nv50, so there's no paging... what does MEM_FAULT mean?

[ 4986.606336] nouveau W[   PFIFO][0000:00:10.0] unknown intr 0x00010000, ch 4
[ 4987.074657] nouveau E[    PBUS][0000:00:10.0] MMIO write of 0x00dd0001 FAULT
at 0x00b010
[ 4987.080772] nouveau E[    PBUS][0000:00:10.0] MMIO write of 0x00e90001 FAULT
at 0x00b020
[ 5002.116004] nouveau E[firefox[3578]] failed to idle channel 0xcccc0000
[firefox[3578]]
[ 5002.116006] nouveau E[firefox[3574]] failed to idle channel 0xcccc0000
[firefox[3574]]
[ 5002.118725] [sched_delayed] sched: RT throttling activated
[ 5002.129735] nouveau E[    PBUS][0000:00:10.0] MMIO write of 0x00000000 FAULT
at 0x00b010
[ 5002.136251] nouveau E[    PBUS][0000:00:10.0] MMIO write of 0x00000000 FAULT
at 0x00b020
[ 5017.116005] nouveau E[firefox[3578]] failed to idle channel 0xcccc0000
[firefox[3578]]
[ 5017.136003] nouveau E[firefox[3574]] failed to idle channel 0xcccc0000
[firefox[3574]]
[ 5024.076000] BUG: soft lockup - CPU#1 stuck for 21s! [firefox:3574]
[ 5024.076000] CPU: 1 PID: 3574 Comm: firefox Tainted: GF           
3.11.0-13-generic #20-Ubuntu
[ 5024.076000] Hardware name: Gigabyte Technology Co., Ltd.
GA-73PVM-S2H/GA-73PVM-S2H, BIOS F6 03/11/2008
[ 5024.076000] task: ffff88003ba51770 ti: ffff88003df4e000 task.ti:
ffff88003df4e000
[ 5024.076000] RIP: 0010:[<ffffffff8136f892>]  [<ffffffff8136f892>]
ioread32+0x42/0x50
[ 5024.076000] RSP: 0018:ffff88003df4fca0  EFLAGS: 00000292
[ 5024.076000] RAX: 0000000000000000 RBX: ffff88003df42280 RCX:
000000000000f7f3
[ 5024.076000] RDX: 000000000000f7f3 RSI: ffffc900023c6048 RDI:
ffffc900023c6048
[ 5024.076000] RBP: ffff88003df4fca8 R08: 0000000000017360 R09:
ffff880061979780
[ 5024.076000] R10: ffffffffa0253b00 R11: ffff88003df4fe10 R12:
ffff88005ea3a808
[ 5024.076000] R13: ffff880072936000 R14: 0000000000000008 R15:
0000000000000001
[ 5024.076000] FS:  00007faf14955740(0000) GS:ffff88007fa80000(0000)
knlGS:0000000000000000
[ 5024.076000] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 5024.076000] CR2: 00007fffbc0f1b08 CR3: 000000005eb19000 CR4:
00000000000007e0
[ 5024.076000] Stack:
[ 5024.076000]  ffffffffa01c06e5 ffff88003df4fcb8 ffffffffa01f2f3f
ffff88003df4fcf0
[ 5024.076000]  ffffffffa01ea83f ffff880061979780 0000000000000000
0000000000000000
[ 5024.076000]  ffff88003ba51770 0000000000000000 ffff88003df4fd48
ffffffffa01eaed5
[ 5024.076000] Call Trace:
[ 5024.076000]  [<ffffffffa01c06e5>] ? _nouveau_fifo_channel_rd32+0x15/0x20
[nouveau]
[ 5024.076000]  [<ffffffffa01f2f3f>] nv10_fence_read+0x1f/0x30 [nouveau]
[ 5024.076000]  [<ffffffffa01ea83f>] nouveau_fence_update+0x6f/0x90 [nouveau]
[ 5024.076000]  [<ffffffffa01eaed5>] nouveau_fence_wait+0xc5/0x1a0 [nouveau]
[ 5024.076000]  [<ffffffffa01eb238>] ? nouveau_fence_new+0x68/0xc0 [nouveau]
[ 5024.076000]  [<ffffffffa01e9495>] nouveau_channel_idle+0x75/0xa0 [nouveau]
[ 5024.076000]  [<ffffffffa01f2bbe>] nouveau_abi16_ioctl_gpuobj_free+0x8e/0x170
[nouveau]

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1386475687.e2a8Ef1.10593
Date: Sun, 8 Dec 2013 04:08:07 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV63] Machine freezes when launching Firefox"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=72458">bug 72458</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>Machine freezes when launching Firefox
           </td>
           <td>[NV63] Machine freezes when launching Firefox
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV63] Machine freezes when launching Firefox"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=72458#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV63] Machine freezes when launching Firefox"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=72458">bug 72458</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Some relevant bits from the log. Pretty sure that the MMIO writes to b010/b020
aren't an issue... although I am a bit surprised you're seeing them. I wonder
if firefox is somehow managing to invoke PMPEG. Or it could be the fifo getting
fed random stuff causing it.

Also, your kernel is compiled with gcc-4.8. Are you using a libdrm before
2.4.48 also compiled with gcc-4.8? If so, upgrade, or use an older gcc.

[ 4986.606330] nouveau E[   PFIFO][0000:00:10.0] DMA_PUSHER - ch 4
[firefox[3578]] get 0x0036a000 put 0x0036a088 state 0xc0000000 (err: MEM_FAULT)
push 0x00000000

MEM_FAULT? A little coincidental that the get pointer is at a page boundary.
But this is pre-nv50, so there's no paging... what does MEM_FAULT mean?

[ 4986.606336] nouveau W[   PFIFO][0000:00:10.0] unknown intr 0x00010000, ch 4
[ 4987.074657] nouveau E[    PBUS][0000:00:10.0] MMIO write of 0x00dd0001 FAULT
at 0x00b010
[ 4987.080772] nouveau E[    PBUS][0000:00:10.0] MMIO write of 0x00e90001 FAULT
at 0x00b020
[ 5002.116004] nouveau E[firefox[3578]] failed to idle channel 0xcccc0000
[firefox[3578]]
[ 5002.116006] nouveau E[firefox[3574]] failed to idle channel 0xcccc0000
[firefox[3574]]
[ 5002.118725] [sched_delayed] sched: RT throttling activated
[ 5002.129735] nouveau E[    PBUS][0000:00:10.0] MMIO write of 0x00000000 FAULT
at 0x00b010
[ 5002.136251] nouveau E[    PBUS][0000:00:10.0] MMIO write of 0x00000000 FAULT
at 0x00b020
[ 5017.116005] nouveau E[firefox[3578]] failed to idle channel 0xcccc0000
[firefox[3578]]
[ 5017.136003] nouveau E[firefox[3574]] failed to idle channel 0xcccc0000
[firefox[3574]]
[ 5024.076000] BUG: soft lockup - CPU#1 stuck for 21s! [firefox:3574]
[ 5024.076000] CPU: 1 PID: 3574 Comm: firefox Tainted: GF           
3.11.0-13-generic #20-Ubuntu
[ 5024.076000] Hardware name: Gigabyte Technology Co., Ltd.
GA-73PVM-S2H/GA-73PVM-S2H, BIOS F6 03/11/2008
[ 5024.076000] task: ffff88003ba51770 ti: ffff88003df4e000 task.ti:
ffff88003df4e000
[ 5024.076000] RIP: 0010:[&lt;ffffffff8136f892&gt;]  [&lt;ffffffff8136f892&gt;]
ioread32+0x42/0x50
[ 5024.076000] RSP: 0018:ffff88003df4fca0  EFLAGS: 00000292
[ 5024.076000] RAX: 0000000000000000 RBX: ffff88003df42280 RCX:
000000000000f7f3
[ 5024.076000] RDX: 000000000000f7f3 RSI: ffffc900023c6048 RDI:
ffffc900023c6048
[ 5024.076000] RBP: ffff88003df4fca8 R08: 0000000000017360 R09:
ffff880061979780
[ 5024.076000] R10: ffffffffa0253b00 R11: ffff88003df4fe10 R12:
ffff88005ea3a808
[ 5024.076000] R13: ffff880072936000 R14: 0000000000000008 R15:
0000000000000001
[ 5024.076000] FS:  00007faf14955740(0000) GS:ffff88007fa80000(0000)
knlGS:0000000000000000
[ 5024.076000] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 5024.076000] CR2: 00007fffbc0f1b08 CR3: 000000005eb19000 CR4:
00000000000007e0
[ 5024.076000] Stack:
[ 5024.076000]  ffffffffa01c06e5 ffff88003df4fcb8 ffffffffa01f2f3f
ffff88003df4fcf0
[ 5024.076000]  ffffffffa01ea83f ffff880061979780 0000000000000000
0000000000000000
[ 5024.076000]  ffff88003ba51770 0000000000000000 ffff88003df4fd48
ffffffffa01eaed5
[ 5024.076000] Call Trace:
[ 5024.076000]  [&lt;ffffffffa01c06e5&gt;] ? _nouveau_fifo_channel_rd32+0x15/0x20
[nouveau]
[ 5024.076000]  [&lt;ffffffffa01f2f3f&gt;] nv10_fence_read+0x1f/0x30 [nouveau]
[ 5024.076000]  [&lt;ffffffffa01ea83f&gt;] nouveau_fence_update+0x6f/0x90 [nouveau]
[ 5024.076000]  [&lt;ffffffffa01eaed5&gt;] nouveau_fence_wait+0xc5/0x1a0 [nouveau]
[ 5024.076000]  [&lt;ffffffffa01eb238&gt;] ? nouveau_fence_new+0x68/0xc0 [nouveau]
[ 5024.076000]  [&lt;ffffffffa01e9495&gt;] nouveau_channel_idle+0x75/0xa0 [nouveau]
[ 5024.076000]  [&lt;ffffffffa01f2bbe&gt;] nouveau_abi16_ioctl_gpuobj_free+0x8e/0x170
[nouveau]</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1386475687.e2a8Ef1.10593--

--===============1127510062==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1127510062==--
