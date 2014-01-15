From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 71659] [NVD9] Hangs under load with ![
 PFIFO][0000:01:00.0] unhandled status 0x00800000
Date: Wed, 15 Jan 2014 03:40:30 +0000
Message-ID: <bug-71659-8800-VWOzu5exGw@http.bugs.freedesktop.org/>
References: <bug-71659-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0966802797=="
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


--===============0966802797==
Content-Type: multipart/alternative; boundary="1389757230.BA7d741.10688"; charset="us-ascii"


--1389757230.BA7d741.10688
Date: Wed, 15 Jan 2014 03:40:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=71659

--- Comment #15 from Kelly Doran <kel.p.doran-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Jan 10 20:09:20 lap14 kernel: [    1.610566] nouveau  [  PGRAPH][0000:01:00.0]
using external firmware
Jan 10 20:09:20 lap14 kernel: [    1.611187] nouveau E[  PGRAPH][0000:01:00.0]
failed to load fuc409c
Jan 10 20:09:20 lap14 kernel: [    1.611190] nouveau E[  DEVICE][0000:01:00.0]
failed to create 0x1800d915, -22
Jan 10 20:09:20 lap14 kernel: [    1.611193] nouveau E[     DRM] failed to
create 0x80000080, -22

You must have named the fuc files wrong or they were not in the initrd, if
nouveau fails to load the firmware like this it simply bails out and the driver
won't finish loading, hence the blank screen.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1389757230.BA7d741.10688
Date: Wed, 15 Jan 2014 03:40:30 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71659#c15">Comment # 15</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVD9] Hangs under load with ![ PFIFO][0000:01:00.0] unhandled status 0x00800000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71659">bug 71659</a>
              from <span class="vcard"><a class="email" href="mailto:kel.p.doran&#64;gmail.com" title="Kelly Doran &lt;kel.p.doran&#64;gmail.com&gt;"> <span class="fn">Kelly Doran</span></a>
</span></b>
        <pre>Jan 10 20:09:20 lap14 kernel: [    1.610566] nouveau  [  PGRAPH][0000:01:00.0]
using external firmware
Jan 10 20:09:20 lap14 kernel: [    1.611187] nouveau E[  PGRAPH][0000:01:00.0]
failed to load fuc409c
Jan 10 20:09:20 lap14 kernel: [    1.611190] nouveau E[  DEVICE][0000:01:00.0]
failed to create 0x1800d915, -22
Jan 10 20:09:20 lap14 kernel: [    1.611193] nouveau E[     DRM] failed to
create 0x80000080, -22

You must have named the fuc files wrong or they were not in the initrd, if
nouveau fails to load the firmware like this it simply bails out and the driver
won't finish loading, hence the blank screen.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1389757230.BA7d741.10688--

--===============0966802797==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0966802797==--
