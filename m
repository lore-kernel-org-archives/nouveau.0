From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 26555] nouveau fails to fully resume nforce1 (nv1a)
	after S3
Date: Mon, 19 Aug 2013 18:09:20 +0000
Message-ID: <bug-26555-8800-NBrhNHtTc6@http.bugs.freedesktop.org/>
References: <bug-26555-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1138480464=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-26555-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1138480464==
Content-Type: multipart/alternative; boundary="1376935760.AbAE81.19237"; charset="us-ascii"


--1376935760.AbAE81.19237
Date: Mon, 19 Aug 2013 18:09:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=26555

Bruno <bonbons67-H4aWS73dXupiYsDpGMXq6A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |REOPENED
         Resolution|INVALID                     |---

--- Comment #2 from Bruno <bonbons67-H4aWS73dXupiYsDpGMXq6A@public.gmane.org> ---
This still applies to 3.10.7.

Hard to tell what state GPU is in as monitor sees no signal after loading
nouveau.

Though blind-running Xorg triggers lots of:
[  764.425134] nouveau W[   PFIFO][0000:02:00.0] unknown intr 0x00010000, ch 1
[  764.430002] nouveau W[   PFIFO][0000:02:00.0] unknown intr 0x00010000, ch 1
[  764.430002] nouveau W[   PFIFO][0000:02:00.0] unknown intr 0x00010000, ch 1
[  764.430002] nouveau W[   PFIFO][0000:02:00.0] unknown intr 0x00010000, ch 1
[  764.430002] nouveau W[   PFIFO][0000:02:00.0] unknown intr 0x00010000, ch 1
[  764.430002] nouveau W[   PFIFO][0000:02:00.0] unknown intr 0x00010000, ch 1
[  764.430002] nouveau W[   PFIFO][0000:02:00.0] unknown intr 0x00010000, ch 1
[  764.430002] nouveau W[   PFIFO][0000:02:00.0] unknown intr 0x00010000, ch 1
[  764.430002] nouveau W[   PFIFO][0000:02:00.0] unknown intr 0x00010000, ch 1
[  764.430002] nouveau W[   PFIFO][0000:02:00.0] unknown intr 0x00010000, ch 1
[  764.430002] nouveau W[   PFIFO][0000:02:00.0] unknown intr 0x00010000, ch 1
[  764.430002] nouveau W[   PFIFO][0000:02:00.0] unknown intr 0x00010000, ch 1
[  764.430002] nouveau W[   PFIFO][0000:02:00.0] unknown intr 0x00010000, ch 1
...
[  764.430002] nouveau E[   PFIFO][0000:02:00.0] still angry after 101 spins,
halt
[  784.280022] nouveau E[Xorg[2242]] failed to idle channel 0xcccc0000
[Xorg[2242]]
[  784.290001] [sched_delayed] sched: RT throttling activated
[  787.280014] nouveau E[Xorg[2242]] failed to idle channel 0xcccc0000
[Xorg[2242]]

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1376935760.AbAE81.19237
Date: Mon, 19 Aug 2013 18:09:20 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:bonbons67&#64;internet.lu" title="Bruno &lt;bonbons67&#64;internet.lu&gt;"> <span class="fn">Bruno</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - nouveau fails to fully resume nforce1 (nv1a) after S3"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=26555">bug 26555</a>
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
   title="REOPENED --- - nouveau fails to fully resume nforce1 (nv1a) after S3"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=26555#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - nouveau fails to fully resume nforce1 (nv1a) after S3"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=26555">bug 26555</a>
              from <span class="vcard"><a class="email" href="mailto:bonbons67&#64;internet.lu" title="Bruno &lt;bonbons67&#64;internet.lu&gt;"> <span class="fn">Bruno</span></a>
</span></b>
        <pre>This still applies to 3.10.7.

Hard to tell what state GPU is in as monitor sees no signal after loading
nouveau.

Though blind-running Xorg triggers lots of:
[  764.425134] nouveau W[   PFIFO][0000:02:00.0] unknown intr 0x00010000, ch 1
[  764.430002] nouveau W[   PFIFO][0000:02:00.0] unknown intr 0x00010000, ch 1
[  764.430002] nouveau W[   PFIFO][0000:02:00.0] unknown intr 0x00010000, ch 1
[  764.430002] nouveau W[   PFIFO][0000:02:00.0] unknown intr 0x00010000, ch 1
[  764.430002] nouveau W[   PFIFO][0000:02:00.0] unknown intr 0x00010000, ch 1
[  764.430002] nouveau W[   PFIFO][0000:02:00.0] unknown intr 0x00010000, ch 1
[  764.430002] nouveau W[   PFIFO][0000:02:00.0] unknown intr 0x00010000, ch 1
[  764.430002] nouveau W[   PFIFO][0000:02:00.0] unknown intr 0x00010000, ch 1
[  764.430002] nouveau W[   PFIFO][0000:02:00.0] unknown intr 0x00010000, ch 1
[  764.430002] nouveau W[   PFIFO][0000:02:00.0] unknown intr 0x00010000, ch 1
[  764.430002] nouveau W[   PFIFO][0000:02:00.0] unknown intr 0x00010000, ch 1
[  764.430002] nouveau W[   PFIFO][0000:02:00.0] unknown intr 0x00010000, ch 1
[  764.430002] nouveau W[   PFIFO][0000:02:00.0] unknown intr 0x00010000, ch 1
...
[  764.430002] nouveau E[   PFIFO][0000:02:00.0] still angry after 101 spins,
halt
[  784.280022] nouveau E[Xorg[2242]] failed to idle channel 0xcccc0000
[Xorg[2242]]
[  784.290001] [sched_delayed] sched: RT throttling activated
[  787.280014] nouveau E[Xorg[2242]] failed to idle channel 0xcccc0000
[Xorg[2242]]</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1376935760.AbAE81.19237--

--===============1138480464==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1138480464==--
