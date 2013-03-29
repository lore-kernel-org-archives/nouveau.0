From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 57350] [nouveau,
 linux-3.7-rc] Broken cursor and kernel log swamped with trapped
 reads/writes from BAR/PFIFO_READ/FB
Date: Fri, 29 Mar 2013 21:56:01 +0000
Message-ID: <bug-57350-8800-u8cvg0YOH2@http.bugs.freedesktop.org/>
References: <bug-57350-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0760498372=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-57350-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0760498372==
Content-Type: multipart/alternative; boundary="1364594161.0e3fC4.22138"; charset="us-ascii"


--1364594161.0e3fC4.22138
Date: Fri, 29 Mar 2013 21:56:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=57350

--- Comment #31 from Bruno <bonbons67-H4aWS73dXupiYsDpGMXq6A@public.gmane.org> ---
I do get lock-ups with 3.8.4 and 3.9-rc4.

3.9-rc4 does not have the corrupted cursor anymore but still has lots of
trapped reads or writes.

Kernel is still alive at lockup time and kernel log reports
...
[  521.627844] nouveau E[     PFB][0000:02:00.0] trapped read at 0x000040fe2c
on channel 0x0000fee0 [unknown] BAR/PFIFO_READ/FB reason: PAGE_NOT_PRESENT
[  521.627864] nouveau E[     PFB][0000:02:00.0] trapped read at 0x000040fe34
on channel 0x0000fee0 [unknown] BAR/PFIFO_READ/FB reason: PAGE_NOT_PRESENT
[  521.627882] nouveau E[     PFB][0000:02:00.0] trapped read at 0x000040fe3c
on channel 0x0000fee0 [unknown] BAR/PFIFO_READ/FB reason: PAGE_NOT_PRESENT
[  521.630177] nouveau E[     PFB][0000:02:00.0] trapped write at 0x00004025c0
on channel 0x0000fee0 [unknown] BAR/PFIFO_WRITE/FB reason: PAGE_NOT_PRESENT
[  521.632255] nouveau E[   PFIFO][0000:02:00.0] still angry after 101 spins,
halt
[  521.632273] nouveau E[     PFB][0000:02:00.0] trapped read at 0x00004025c0
on channel 0x0000fee0 [unknown] BAR/PFIFO_READ/FB reason: PAGE_NOT_PRESENT
[  524.640022] [sched_delayed] sched: RT throttling activated

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1364594161.0e3fC4.22138
Date: Fri, 29 Mar 2013 21:56:01 +0000
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
   title="NEW --- - [nouveau, linux-3.7-rc] Broken cursor and kernel log swamped with trapped reads/writes from BAR/PFIFO_READ/FB"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=57350#c31">Comment # 31</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nouveau, linux-3.7-rc] Broken cursor and kernel log swamped with trapped reads/writes from BAR/PFIFO_READ/FB"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=57350">bug 57350</a>
              from <span class="vcard"><a class="email" href="mailto:bonbons67&#64;internet.lu" title="Bruno &lt;bonbons67&#64;internet.lu&gt;"> <span class="fn">Bruno</span></a>
</span></b>
        <pre>I do get lock-ups with 3.8.4 and 3.9-rc4.

3.9-rc4 does not have the corrupted cursor anymore but still has lots of
trapped reads or writes.

Kernel is still alive at lockup time and kernel log reports
...
[  521.627844] nouveau E[     PFB][0000:02:00.0] trapped read at 0x000040fe2c
on channel 0x0000fee0 [unknown] BAR/PFIFO_READ/FB reason: PAGE_NOT_PRESENT
[  521.627864] nouveau E[     PFB][0000:02:00.0] trapped read at 0x000040fe34
on channel 0x0000fee0 [unknown] BAR/PFIFO_READ/FB reason: PAGE_NOT_PRESENT
[  521.627882] nouveau E[     PFB][0000:02:00.0] trapped read at 0x000040fe3c
on channel 0x0000fee0 [unknown] BAR/PFIFO_READ/FB reason: PAGE_NOT_PRESENT
[  521.630177] nouveau E[     PFB][0000:02:00.0] trapped write at 0x00004025c0
on channel 0x0000fee0 [unknown] BAR/PFIFO_WRITE/FB reason: PAGE_NOT_PRESENT
[  521.632255] nouveau E[   PFIFO][0000:02:00.0] still angry after 101 spins,
halt
[  521.632273] nouveau E[     PFB][0000:02:00.0] trapped read at 0x00004025c0
on channel 0x0000fee0 [unknown] BAR/PFIFO_READ/FB reason: PAGE_NOT_PRESENT
[  524.640022] [sched_delayed] sched: RT throttling activated</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1364594161.0e3fC4.22138--

--===============0760498372==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0760498372==--
