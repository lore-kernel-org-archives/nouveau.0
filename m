From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 53842] Nouveau fails to read EDID, but X succeeds.
Date: Sun, 04 Nov 2012 17:24:33 +0000
Message-ID: <bug-53842-8800-LwN22VoElo@http.bugs.freedesktop.org/>
References: <bug-53842-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1011089629=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-53842-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1011089629==
Content-Type: multipart/alternative; boundary="1352049873.cAFe68862.4333"; charset="us-ascii"


--1352049873.cAFe68862.4333
Date: Sun, 4 Nov 2012 17:24:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=53842

Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #2 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Hi James

In linux 3,2 and 3.3 nouveau was using a custom i2c-algo-bit functions, which
are possibly causing the issue in your case

Since linux 3.4 we have reverted to using the in-kernel functions

Author: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>  2012-05-04 05:38:49
Branches: remotes/linus-stable/linux-3.4.y, remotes/linus-stable/linux-3.5.y,
remotes/linus-stable/linux-3.6.y, remotes/linus-stable/master,
remotes/linus/master

    drm/nouveau/i2c: resume use of i2c-algo-bit, rather than custom stack

    Previous issues with i2c-algo-bit have now been resolved.

    This is a revert of f553b79c03f0dbd52f6f03abe8233a2bef8cbd0d mostly,
    due to fixes in the i2c core repairing the original issue, this code
    isn't required and was causing regressions.

    Signed-off-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
    Reported-by: Nick Bowler <nbowler-7BP4RkwGw0uXmMXjJBpWqg@public.gmane.org>
    Tested-by: Nick Bowler <nbowler-7BP4RkwGw0uXmMXjJBpWqg@public.gmane.org>
    Signed-off-by: Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Can you please update and reopen the bug, if the issue persist

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1352049873.cAFe68862.4333
Date: Sun, 4 Nov 2012 17:24:33 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - Nouveau fails to read EDID, but X succeeds."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=53842">bug 53842</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Status</td>
           <td>NEW
           </td>
           <td>RESOLVED
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Resolution</td>
           <td>---
           </td>
           <td>FIXED
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - Nouveau fails to read EDID, but X succeeds."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=53842#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - Nouveau fails to read EDID, but X succeeds."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=53842">bug 53842</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>Hi James

In linux 3,2 and 3.3 nouveau was using a custom i2c-algo-bit functions, which
are possibly causing the issue in your case

Since linux 3.4 we have reverted to using the in-kernel functions

Author: Ben Skeggs &lt;<a href="mailto:bskeggs&#64;redhat.com">bskeggs&#64;redhat.com</a>&gt;  2012-05-04 05:38:49
Branches: remotes/linus-stable/linux-3.4.y, remotes/linus-stable/linux-3.5.y,
remotes/linus-stable/linux-3.6.y, remotes/linus-stable/master,
remotes/linus/master

    drm/nouveau/i2c: resume use of i2c-algo-bit, rather than custom stack

    Previous issues with i2c-algo-bit have now been resolved.

    This is a revert of f553b79c03f0dbd52f6f03abe8233a2bef8cbd0d mostly,
    due to fixes in the i2c core repairing the original issue, this code
    isn't required and was causing regressions.

    Signed-off-by: Ben Skeggs &lt;<a href="mailto:bskeggs&#64;redhat.com">bskeggs&#64;redhat.com</a>&gt;
    Reported-by: Nick Bowler &lt;<a href="mailto:nbowler&#64;elliptictech.com">nbowler&#64;elliptictech.com</a>&gt;
    Tested-by: Nick Bowler &lt;<a href="mailto:nbowler&#64;elliptictech.com">nbowler&#64;elliptictech.com</a>&gt;
    Signed-off-by: Dave Airlie &lt;<a href="mailto:airlied&#64;redhat.com">airlied&#64;redhat.com</a>&gt;

Can you please update and reopen the bug, if the issue persist</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1352049873.cAFe68862.4333--

--===============1011089629==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1011089629==--
