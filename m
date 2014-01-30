From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67878] [NV98] [BISECTED] Hardware freeze after
 resume from suspend
Date: Thu, 30 Jan 2014 08:28:54 +0000
Message-ID: <bug-67878-8800-8mfvrE1GtY@http.bugs.freedesktop.org/>
References: <bug-67878-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1535761341=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-67878-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1535761341==
Content-Type: multipart/alternative; boundary="1391070534.4C74F263.26075"; charset="us-ascii"


--1391070534.4C74F263.26075
Date: Thu, 30 Jan 2014 08:28:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67878

--- Comment #36 from Brian <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Re-tested on drm-next, at:

commit ef64cf9d06049e4e9df661f3be60b217e476bee1
Merge: 279b9e0cc300 f3980dc50c51
Author: Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date:   Thu Jan 30 10:46:06 2014 +1000

    Merge branch 'drm-nouveau-next' of
git://anongit.freedesktop.org/git/nouveau/linux-2.6 into drm-next

Still reproducible:

  nouveau E[Xorg[1140]] failed to idle channel 0xcccc0000 [Xorg[1140]]
  nouveau E[     PFB][0000:01:00.0] trapped read at 0x002001e020 on channel
0x0001fb14 [unknown] SEMAPHORE_BG/PFIFO_READ/00 reason: PAGE_NOT_PRESENT

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1391070534.4C74F263.26075
Date: Thu, 30 Jan 2014 08:28:54 +0000
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
   title="NEW --- - [NV98] [BISECTED] Hardware freeze after resume from suspend"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67878#c36">Comment # 36</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV98] [BISECTED] Hardware freeze after resume from suspend"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67878">bug 67878</a>
              from <span class="vcard"><a class="email" href="mailto:computersforpeace&#64;gmail.com" title="Brian &lt;computersforpeace&#64;gmail.com&gt;"> <span class="fn">Brian</span></a>
</span></b>
        <pre>Re-tested on drm-next, at:

commit ef64cf9d06049e4e9df661f3be60b217e476bee1
Merge: 279b9e0cc300 f3980dc50c51
Author: Dave Airlie &lt;<a href="mailto:airlied&#64;redhat.com">airlied&#64;redhat.com</a>&gt;
Date:   Thu Jan 30 10:46:06 2014 +1000

    Merge branch 'drm-nouveau-next' of
git://anongit.freedesktop.org/git/nouveau/linux-2.6 into drm-next

Still reproducible:

  nouveau E[Xorg[1140]] failed to idle channel 0xcccc0000 [Xorg[1140]]
  nouveau E[     PFB][0000:01:00.0] trapped read at 0x002001e020 on channel
0x0001fb14 [unknown] SEMAPHORE_BG/PFIFO_READ/00 reason: PAGE_NOT_PRESENT</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1391070534.4C74F263.26075--

--===============1535761341==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1535761341==--
