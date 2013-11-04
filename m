From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69488] GF108 (NVC1) GPU lockup
Date: Mon, 04 Nov 2013 16:50:35 +0000
Message-ID: <bug-69488-8800-6NYl4nAZKT@http.bugs.freedesktop.org/>
References: <bug-69488-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1587386333=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-69488-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1587386333==
Content-Type: multipart/alternative; boundary="1383583835.EaAEF1.26323"; charset="us-ascii"


--1383583835.EaAEF1.26323
Date: Mon, 4 Nov 2013 16:50:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69488

--- Comment #22 from Kevin N. <vekinn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 88623
  --> https://bugs.freedesktop.org/attachment.cgi?id=88623&action=edit
3.12 log with stalls

I ran xrandr in X with the 3.12 final and was able to get a better log before
the system became unresponsive.

Nov 04 08:29:34 [logger] ACPI event unhandled: ibm/hotkey LEN0068:00 00000080
00006030
Nov 04 08:29:34 [kernel] thinkpad_acpi: EC reports that Thermal Table has
changed
Nov 04 08:29:35 [logger] ACPI event unhandled: video/switchmode VMOD 00000080
00000000
Nov 04 08:29:49 [kernel] nouveau 0000:01:00.0: Refused to change power state,
currently in D3
Nov 04 08:29:49 [logger] ACPI event unhandled: video/switchmode VMOD 00000080
00000000
Nov 04 08:29:49 [kernel] nouveau E[   PIBUS][0000:01:00.0] ROP0: 0x10fc7c
0x00030302 (0x38008208)
Nov 04 08:29:49 [kernel] nouveau E[   PFIFO][0000:01:00.0] write fault at
0x0000000000 [NO_CHANNEL] from BAR3/BAR_WRITE on channel 0x0000000000 [unknown]
Nov 04 08:29:49 [kernel] nouveau ![   PFIFO][0000:01:00.0] unhandled status
0x00800000
Nov 04 08:29:52 [kernel] nouveau E[   PFIFO][0000:01:00.0] playlist update
failed
                - Last output repeated 2 times -
Nov 04 08:30:01 [cron] (root) CMD (test -x /usr/sbin/run-crons &&
/usr/sbin/run-crons)
Nov 04 08:30:01 [cron] (root) CMD (root^Itest -x /usr/sbin/run-crons &&
/usr/sbin/run-crons)
Nov 04 08:30:01 [cron] (wut) CMD (flexget --cron)
Nov 04 08:30:01 [kernel] nouveau E[      VM][0000:01:00.0] vm timeout 1:
0x00200000 1
Nov 04 08:30:04 [kernel] nouveau E[      VM][0000:01:00.0] vm timeout 1:
0x001f0000 1
Nov 04 08:30:07 [kernel] nouveau E[      VM][0000:01:00.0] vm timeout 1:
0x001e0000 1
Nov 04 08:30:10 [kernel] INFO: rcu_sched self-detected stall on CPU { 0} 
(t=2101 jiffies g=1526 c=1525 q=1897)
Nov 04 08:30:10 [kernel] sending NMI to all CPUs:
Nov 04 08:30:10 [kernel] NMI backtrace for cpu 0
Nov 04 08:30:10 [kernel] CPU: 0 PID: 5929 Comm: X Not tainted 3.12.0-gentoo #2
Nov 04 08:30:10 [kernel] Hardware name: LENOVO 2359CTO/2359CTO, BIOS G4ET62WW
(2.04 ) 09/13/2012
Nov 04 08:30:10 [kernel] task: ffff88043c2f6000 ti: ffff8804299c6000 task.ti:
ffff8804299c6000
Nov 04 08:30:10 [kernel] RIP: 0010:[<ffffffff813a9d78>]  [<ffffffff813a9d78>]
__const_udelay+0x12/0x26
Nov 04 08:30:10 [kernel] RSP: 0018:ffff88043e203e10  EFLAGS: 00000006
Nov 04 08:30:10 [kernel] RAX: 0000000001062560 RBX: 0000000000002710 RCX:
0000000000000007

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1383583835.EaAEF1.26323
Date: Mon, 4 Nov 2013 16:50:35 +0000
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
          bz_status_REOPENED "
   title="REOPENED --- - GF108 (NVC1) GPU lockup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69488#c22">Comment # 22</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - GF108 (NVC1) GPU lockup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69488">bug 69488</a>
              from <span class="vcard"><a class="email" href="mailto:vekinn&#64;gmail.com" title="Kevin N. &lt;vekinn&#64;gmail.com&gt;"> <span class="fn">Kevin N.</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=88623" name="attach_88623" title="3.12 log with stalls">attachment 88623</a> <a href="attachment.cgi?id=88623&amp;action=edit" title="3.12 log with stalls">[details]</a></span>
3.12 log with stalls

I ran xrandr in X with the 3.12 final and was able to get a better log before
the system became unresponsive.

Nov 04 08:29:34 [logger] ACPI event unhandled: ibm/hotkey LEN0068:00 00000080
00006030
Nov 04 08:29:34 [kernel] thinkpad_acpi: EC reports that Thermal Table has
changed
Nov 04 08:29:35 [logger] ACPI event unhandled: video/switchmode VMOD 00000080
00000000
Nov 04 08:29:49 [kernel] nouveau 0000:01:00.0: Refused to change power state,
currently in D3
Nov 04 08:29:49 [logger] ACPI event unhandled: video/switchmode VMOD 00000080
00000000
Nov 04 08:29:49 [kernel] nouveau E[   PIBUS][0000:01:00.0] ROP0: 0x10fc7c
0x00030302 (0x38008208)
Nov 04 08:29:49 [kernel] nouveau E[   PFIFO][0000:01:00.0] write fault at
0x0000000000 [NO_CHANNEL] from BAR3/BAR_WRITE on channel 0x0000000000 [unknown]
Nov 04 08:29:49 [kernel] nouveau ![   PFIFO][0000:01:00.0] unhandled status
0x00800000
Nov 04 08:29:52 [kernel] nouveau E[   PFIFO][0000:01:00.0] playlist update
failed
                - Last output repeated 2 times -
Nov 04 08:30:01 [cron] (root) CMD (test -x /usr/sbin/run-crons &amp;&amp;
/usr/sbin/run-crons)
Nov 04 08:30:01 [cron] (root) CMD (root^Itest -x /usr/sbin/run-crons &amp;&amp;
/usr/sbin/run-crons)
Nov 04 08:30:01 [cron] (wut) CMD (flexget --cron)
Nov 04 08:30:01 [kernel] nouveau E[      VM][0000:01:00.0] vm timeout 1:
0x00200000 1
Nov 04 08:30:04 [kernel] nouveau E[      VM][0000:01:00.0] vm timeout 1:
0x001f0000 1
Nov 04 08:30:07 [kernel] nouveau E[      VM][0000:01:00.0] vm timeout 1:
0x001e0000 1
Nov 04 08:30:10 [kernel] INFO: rcu_sched self-detected stall on CPU { 0} 
(t=2101 jiffies g=1526 c=1525 q=1897)
Nov 04 08:30:10 [kernel] sending NMI to all CPUs:
Nov 04 08:30:10 [kernel] NMI backtrace for cpu 0
Nov 04 08:30:10 [kernel] CPU: 0 PID: 5929 Comm: X Not tainted 3.12.0-gentoo #2
Nov 04 08:30:10 [kernel] Hardware name: LENOVO 2359CTO/2359CTO, BIOS G4ET62WW
(2.04 ) 09/13/2012
Nov 04 08:30:10 [kernel] task: ffff88043c2f6000 ti: ffff8804299c6000 task.ti:
ffff8804299c6000
Nov 04 08:30:10 [kernel] RIP: 0010:[&lt;ffffffff813a9d78&gt;]  [&lt;ffffffff813a9d78&gt;]
__const_udelay+0x12/0x26
Nov 04 08:30:10 [kernel] RSP: 0018:ffff88043e203e10  EFLAGS: 00000006
Nov 04 08:30:10 [kernel] RAX: 0000000001062560 RBX: 0000000000002710 RCX:
0000000000000007</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1383583835.EaAEF1.26323--

--===============1587386333==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1587386333==--
