From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69830] [NVC1] Kernel 3.11 and newer hang at X11
 start (bisected)
Date: Fri, 27 Sep 2013 14:51:46 +0000
Message-ID: <bug-69830-8800-u876zrrvdg@http.bugs.freedesktop.org/>
References: <bug-69830-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0237380387=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-69830-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0237380387==
Content-Type: multipart/alternative; boundary="1380293506.bF5AD0.17700"; charset="us-ascii"


--1380293506.bF5AD0.17700
Date: Fri, 27 Sep 2013 14:51:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69830

--- Comment #8 from Alan Ott <alan-yzvJWuRpmD1zbRFIqnYvSA@public.gmane.org> ---
I'm on mainline. As evidence, noice the SHA1 of my HEAD:

alan@ato:~/work/linux-3.12$ git log |head
commit 4a10c2ac2f368583138b774ca41fac4207911983
Author: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Date:   Mon Sep 23 15:41:09 2013 -0700

    Linux 3.12-rc2

commit 9d23108df359e572a0dca0b631bfee9f5e0fa9ea
Merge: e04a0a5 6174081
Author: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Date:   Mon Sep 23 12:53:07 2013 -0700

See 3.12-rc2 has the same SHA1:
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=4a10c2ac2f368583138b774ca41fac4207911983


The gitk shows that while 791dc is the parent of 30f, there was a lot of merge
activity in between, so I think we're looking at the same thing. Sorry to
confuse the matter.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1380293506.bF5AD0.17700
Date: Fri, 27 Sep 2013 14:51:46 +0000
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
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED DUPLICATE - [NVC1] Kernel 3.11 and newer hang at X11 start (bisected)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69830#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED DUPLICATE - [NVC1] Kernel 3.11 and newer hang at X11 start (bisected)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69830">bug 69830</a>
              from <span class="vcard"><a class="email" href="mailto:alan&#64;signal11.us" title="Alan Ott &lt;alan&#64;signal11.us&gt;"> <span class="fn">Alan Ott</span></a>
</span></b>
        <pre>I'm on mainline. As evidence, noice the SHA1 of my HEAD:

alan&#64;ato:~/work/linux-3.12$ git log |head
commit 4a10c2ac2f368583138b774ca41fac4207911983
Author: Linus Torvalds &lt;<a href="mailto:torvalds&#64;linux-foundation.org">torvalds&#64;linux-foundation.org</a>&gt;
Date:   Mon Sep 23 15:41:09 2013 -0700

    Linux 3.12-rc2

commit 9d23108df359e572a0dca0b631bfee9f5e0fa9ea
Merge: e04a0a5 6174081
Author: Linus Torvalds &lt;<a href="mailto:torvalds&#64;linux-foundation.org">torvalds&#64;linux-foundation.org</a>&gt;
Date:   Mon Sep 23 12:53:07 2013 -0700

See 3.12-rc2 has the same SHA1:
<a href="https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=4a10c2ac2f368583138b774ca41fac4207911983">https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=4a10c2ac2f368583138b774ca41fac4207911983</a>


The gitk shows that while 791dc is the parent of 30f, there was a lot of merge
activity in between, so I think we're looking at the same thing. Sorry to
confuse the matter.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1380293506.bF5AD0.17700--

--===============0237380387==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0237380387==--
