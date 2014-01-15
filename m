From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 71659] [NVD9] Hangs under load with ![
 PFIFO][0000:01:00.0] unhandled status 0x00800000
Date: Wed, 15 Jan 2014 09:28:56 +0000
Message-ID: <bug-71659-8800-Psswe2k61H@http.bugs.freedesktop.org/>
References: <bug-71659-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0640181418=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-71659-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0640181418==
Content-Type: multipart/alternative; boundary="1389778136.11d1143c1.10342"; charset="us-ascii"


--1389778136.11d1143c1.10342
Date: Wed, 15 Jan 2014 09:28:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=71659

--- Comment #16 from Rebecca Palmer <R.Palmer-mHdZ94l+r7K1Qrn1Bg8BZw@public.gmane.org> ---
Created attachment 92127
  --> https://bugs.freedesktop.org/attachment.cgi?id=92127&action=edit
kernel log 3.13rc+firmware

What does "not in the initrd" mean?  The files were in /lib/firmware/nouveau
with the names the script gave them (nvd9_fuc*).

The errors with kernel 3.13-rc7 (attached) are similar:
Jan 13 22:47:57 lap14 kernel: [    1.653189] nouveau  [  PGRAPH][0000:01:00.0]
using external firmware
Jan 13 22:47:57 lap14 kernel: [    1.653203] nouveau 0000:01:00.0: Direct
firmware load failed with error -2
Jan 13 22:47:57 lap14 kernel: [    1.653204] nouveau 0000:01:00.0: Falling back
to user helper
Jan 13 22:47:57 lap14 kernel: [    1.653447] nouveau 0000:01:00.0: Direct
firmware load failed with error -2
Jan 13 22:47:57 lap14 kernel: [    1.653452] nouveau 0000:01:00.0: Falling back
to user helper
Jan 13 22:47:57 lap14 kernel: [    1.653651] nouveau E[  PGRAPH][0000:01:00.0]
failed to load fuc409c
Jan 13 22:47:57 lap14 kernel: [    1.653658] nouveau E[  DEVICE][0000:01:00.0]
failed to create 0x1800d916, -22
Jan 13 22:47:57 lap14 kernel: [    1.653663] nouveau E[     DRM] failed to
create 0x80000080, -22
Jan 13 22:47:57 lap14 kernel: [    1.654258] nouveau: probe of 0000:01:00.0
failed with error -22

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1389778136.11d1143c1.10342
Date: Wed, 15 Jan 2014 09:28:56 +0000
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
   title="NEW --- - [NVD9] Hangs under load with ![ PFIFO][0000:01:00.0] unhandled status 0x00800000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71659#c16">Comment # 16</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVD9] Hangs under load with ![ PFIFO][0000:01:00.0] unhandled status 0x00800000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71659">bug 71659</a>
              from <span class="vcard"><a class="email" href="mailto:R.Palmer&#64;bham.ac.uk" title="Rebecca Palmer &lt;R.Palmer&#64;bham.ac.uk&gt;"> <span class="fn">Rebecca Palmer</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=92127" name="attach_92127" title="kernel log 3.13rc+firmware">attachment 92127</a> <a href="attachment.cgi?id=92127&amp;action=edit" title="kernel log 3.13rc+firmware">[details]</a></span>
kernel log 3.13rc+firmware

What does &quot;not in the initrd&quot; mean?  The files were in /lib/firmware/nouveau
with the names the script gave them (nvd9_fuc*).

The errors with kernel 3.13-rc7 (attached) are similar:
Jan 13 22:47:57 lap14 kernel: [    1.653189] nouveau  [  PGRAPH][0000:01:00.0]
using external firmware
Jan 13 22:47:57 lap14 kernel: [    1.653203] nouveau 0000:01:00.0: Direct
firmware load failed with error -2
Jan 13 22:47:57 lap14 kernel: [    1.653204] nouveau 0000:01:00.0: Falling back
to user helper
Jan 13 22:47:57 lap14 kernel: [    1.653447] nouveau 0000:01:00.0: Direct
firmware load failed with error -2
Jan 13 22:47:57 lap14 kernel: [    1.653452] nouveau 0000:01:00.0: Falling back
to user helper
Jan 13 22:47:57 lap14 kernel: [    1.653651] nouveau E[  PGRAPH][0000:01:00.0]
failed to load fuc409c
Jan 13 22:47:57 lap14 kernel: [    1.653658] nouveau E[  DEVICE][0000:01:00.0]
failed to create 0x1800d916, -22
Jan 13 22:47:57 lap14 kernel: [    1.653663] nouveau E[     DRM] failed to
create 0x80000080, -22
Jan 13 22:47:57 lap14 kernel: [    1.654258] nouveau: probe of 0000:01:00.0
failed with error -22</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1389778136.11d1143c1.10342--

--===============0640181418==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0640181418==--
