From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 54056] [NVAF] plenty of errors trapped write at plus
 PGRAPH error
Date: Tue, 15 Oct 2013 19:44:52 +0000
Message-ID: <bug-54056-8800-m697Bsf98u@http.bugs.freedesktop.org/>
References: <bug-54056-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1438784629=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-54056-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1438784629==
Content-Type: multipart/alternative; boundary="1381866292.788841ca2.24052"; charset="us-ascii"


--1381866292.788841ca2.24052
Date: Tue, 15 Oct 2013 19:44:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=54056

Arun S A G <sagarun-rxtnV0ftBwyoClj4AeEUq9i2O/JbrIOy@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |REOPENED
         Resolution|INVALID                     |---

--- Comment #6 from Arun S A G <sagarun-rxtnV0ftBwyoClj4AeEUq9i2O/JbrIOy@public.gmane.org> ---
I am running kernel 3.11

$ uname -a
Linux broughtfine-lm.eglbp.corp.yahoo.com 3.11.4-201.fc19.x86_64 #1 SMP Thu Oct
10 14:11:18 UTC 2013 x86_64 x86_64 x86_64 GNU/Linux

I am also running gnome-shell (gnome 3), i see following messages in my dmesg

[ 4327.397129] nouveau E[  PGRAPH][0000:04:00.0] DATA_ERROR INVALID_VALUE
[ 4327.397137] nouveau E[  PGRAPH][0000:04:00.0]  DATA_ERROR
[ 4327.397142] nouveau E[  PGRAPH][0000:04:00.0] ch 5 [0x000fc2a000
gnome-shell[2200]] subc 3 class 0x8697 mthd 0x1458 data 0x00086d74
[ 4327.397806] nouveau E[     DRM] unexpected pageflip
[ 4481.699932] nouveau W[    PCE0][0000:04:00.0] disabled, PCE0=1 to enable
[ 4503.038557] nouveau W[    PCE0][0000:04:00.0] disabled, PCE0=1 to enable
[ 4503.904139] nouveau E[  PGRAPH][0000:04:00.0] DATA_ERROR INVALID_VALUE
[ 4503.904148] nouveau E[  PGRAPH][0000:04:00.0]  DATA_ERROR
[ 4503.904153] nouveau E[  PGRAPH][0000:04:00.0] ch 6 [0x000f7d8000
totem[7624]] subc 3 class 0x8697 mthd 0x0e04 data 0xff050000
[ 4503.904164] nouveau E[  PGRAPH][0000:04:00.0] DATA_ERROR INVALID_VALUE
[ 4503.904167] nouveau E[  PGRAPH][0000:04:00.0]  DATA_ERROR
[ 4503.904171] nouveau E[  PGRAPH][0000:04:00.0] ch 6 [0x000f7d8000
totem[7624]] subc 3 class 0x8697 mthd 0x0e08 data 0xfea80000
[ 4771.854097] nouveau W[    PCE0][0000:04:00.0] disabled, PCE0=1 to enable
[ 4978.214759] nouveau W[    PCE0][0000:04:00.0] disabled, PCE0=1 to enable
[ 4979.086082] nouveau E[  PGRAPH][0000:04:00.0] DATA_ERROR INVALID_VALUE
[ 4979.086090] nouveau E[  PGRAPH][0000:04:00.0]  DATA_ERROR
[ 4979.086096] nouveau E[  PGRAPH][0000:04:00.0] ch 6 [0x000f7d8000
totem[7759]] subc 3 class 0x8697 mthd 0x0e04 data 0xff9d0000
[ 4979.086107] nouveau E[  PGRAPH][0000:04:00.0] DATA_ERROR INVALID_VALUE
[ 4979.086110] nouveau E[  PGRAPH][0000:04:00.0]  DATA_ERROR
[ 4979.086114] nouveau E[  PGRAPH][0000:04:00.0] ch 6 [0x000f7d8000
totem[7759]] subc 3 class 0x8697 mthd 0x0e08 data 0xfdda0000
[ 4991.451072] nouveau W[    PCE0][0000:04:00.0] disabled, PCE0=1 to enable
[ 5027.543718] nouveau W[    PCE0][0000:04:00.0] disabled, PCE0=1 to enable
[ 5396.792300] nouveau E[     DRM] unexpected pageflip
[ 5396.869805] nouveau E[     DRM] unexpected pageflip
[ 5398.272907] nouveau E[   PFIFO][0000:04:00.0] DMA_PUSHER - ch 5
[gnome-shell[2200]] get 0x0020166478 put 0x002016d2e8 ib_get 0x00000243 ib_put
0x00000244 state 0x80007698 (err: INVALID_CMD) push 0x003020b0
[ 5745.560979] nouveau E[   PFIFO][0000:04:00.0] DMA_PUSHER - ch 5
[gnome-shell[2200]] get 0x00201e877c put 0x00201ebfc4 ib_get 0x00000242 ib_put
0x00000243 state 0x80007088 (err: INVALID_CMD) push 0x003020b0
[ 5765.557657] nouveau E[   PFIFO][0000:04:00.0] DMA_PUSHER - ch 5
[gnome-shell[2200]] get 0x00200b9540 put 0x00200ba914 ib_get 0x00000217 ib_put
0x0000021b state 0x80000024 (err: INVALID_CMD) push 0x003020b0
[ 5765.557994] nouveau E[     DRM] unexpected pageflip
[ 6240.496808] nouveau E[   PFIFO][0000:04:00.0] DMA_PUSHER - ch 5
[gnome-shell[2200]] get 0x002018a4c8 put 0x002018e0f4 ib_get 0x0000005f ib_put
0x00000060 state 0x80007088 (err: INVALID_CMD) push 0x00400040

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1381866292.788841ca2.24052
Date: Tue, 15 Oct 2013 19:44:52 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:sagarun&#64;fedoraproject.org" title="Arun S A G &lt;sagarun&#64;fedoraproject.org&gt;"> <span class="fn">Arun S A G</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - [NVAF] plenty of errors trapped write at plus PGRAPH error"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54056">bug 54056</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Status</td>
           <td>RESOLVED
           </td>
           <td>REOPENED
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Resolution</td>
           <td>INVALID
           </td>
           <td>---
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - [NVAF] plenty of errors trapped write at plus PGRAPH error"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54056#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - [NVAF] plenty of errors trapped write at plus PGRAPH error"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54056">bug 54056</a>
              from <span class="vcard"><a class="email" href="mailto:sagarun&#64;fedoraproject.org" title="Arun S A G &lt;sagarun&#64;fedoraproject.org&gt;"> <span class="fn">Arun S A G</span></a>
</span></b>
        <pre>I am running kernel 3.11

$ uname -a
Linux broughtfine-lm.eglbp.corp.yahoo.com 3.11.4-201.fc19.x86_64 #1 SMP Thu Oct
10 14:11:18 UTC 2013 x86_64 x86_64 x86_64 GNU/Linux

I am also running gnome-shell (gnome 3), i see following messages in my dmesg

[ 4327.397129] nouveau E[  PGRAPH][0000:04:00.0] DATA_ERROR INVALID_VALUE
[ 4327.397137] nouveau E[  PGRAPH][0000:04:00.0]  DATA_ERROR
[ 4327.397142] nouveau E[  PGRAPH][0000:04:00.0] ch 5 [0x000fc2a000
gnome-shell[2200]] subc 3 class 0x8697 mthd 0x1458 data 0x00086d74
[ 4327.397806] nouveau E[     DRM] unexpected pageflip
[ 4481.699932] nouveau W[    PCE0][0000:04:00.0] disabled, PCE0=1 to enable
[ 4503.038557] nouveau W[    PCE0][0000:04:00.0] disabled, PCE0=1 to enable
[ 4503.904139] nouveau E[  PGRAPH][0000:04:00.0] DATA_ERROR INVALID_VALUE
[ 4503.904148] nouveau E[  PGRAPH][0000:04:00.0]  DATA_ERROR
[ 4503.904153] nouveau E[  PGRAPH][0000:04:00.0] ch 6 [0x000f7d8000
totem[7624]] subc 3 class 0x8697 mthd 0x0e04 data 0xff050000
[ 4503.904164] nouveau E[  PGRAPH][0000:04:00.0] DATA_ERROR INVALID_VALUE
[ 4503.904167] nouveau E[  PGRAPH][0000:04:00.0]  DATA_ERROR
[ 4503.904171] nouveau E[  PGRAPH][0000:04:00.0] ch 6 [0x000f7d8000
totem[7624]] subc 3 class 0x8697 mthd 0x0e08 data 0xfea80000
[ 4771.854097] nouveau W[    PCE0][0000:04:00.0] disabled, PCE0=1 to enable
[ 4978.214759] nouveau W[    PCE0][0000:04:00.0] disabled, PCE0=1 to enable
[ 4979.086082] nouveau E[  PGRAPH][0000:04:00.0] DATA_ERROR INVALID_VALUE
[ 4979.086090] nouveau E[  PGRAPH][0000:04:00.0]  DATA_ERROR
[ 4979.086096] nouveau E[  PGRAPH][0000:04:00.0] ch 6 [0x000f7d8000
totem[7759]] subc 3 class 0x8697 mthd 0x0e04 data 0xff9d0000
[ 4979.086107] nouveau E[  PGRAPH][0000:04:00.0] DATA_ERROR INVALID_VALUE
[ 4979.086110] nouveau E[  PGRAPH][0000:04:00.0]  DATA_ERROR
[ 4979.086114] nouveau E[  PGRAPH][0000:04:00.0] ch 6 [0x000f7d8000
totem[7759]] subc 3 class 0x8697 mthd 0x0e08 data 0xfdda0000
[ 4991.451072] nouveau W[    PCE0][0000:04:00.0] disabled, PCE0=1 to enable
[ 5027.543718] nouveau W[    PCE0][0000:04:00.0] disabled, PCE0=1 to enable
[ 5396.792300] nouveau E[     DRM] unexpected pageflip
[ 5396.869805] nouveau E[     DRM] unexpected pageflip
[ 5398.272907] nouveau E[   PFIFO][0000:04:00.0] DMA_PUSHER - ch 5
[gnome-shell[2200]] get 0x0020166478 put 0x002016d2e8 ib_get 0x00000243 ib_put
0x00000244 state 0x80007698 (err: INVALID_CMD) push 0x003020b0
[ 5745.560979] nouveau E[   PFIFO][0000:04:00.0] DMA_PUSHER - ch 5
[gnome-shell[2200]] get 0x00201e877c put 0x00201ebfc4 ib_get 0x00000242 ib_put
0x00000243 state 0x80007088 (err: INVALID_CMD) push 0x003020b0
[ 5765.557657] nouveau E[   PFIFO][0000:04:00.0] DMA_PUSHER - ch 5
[gnome-shell[2200]] get 0x00200b9540 put 0x00200ba914 ib_get 0x00000217 ib_put
0x0000021b state 0x80000024 (err: INVALID_CMD) push 0x003020b0
[ 5765.557994] nouveau E[     DRM] unexpected pageflip
[ 6240.496808] nouveau E[   PFIFO][0000:04:00.0] DMA_PUSHER - ch 5
[gnome-shell[2200]] get 0x002018a4c8 put 0x002018e0f4 ib_get 0x0000005f ib_put
0x00000060 state 0x80007088 (err: INVALID_CMD) push 0x00400040</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1381866292.788841ca2.24052--

--===============1438784629==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1438784629==--
