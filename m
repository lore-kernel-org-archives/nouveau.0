From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 76376] mesa does not build after nouveau loader
	changes
Date: Fri, 21 Mar 2014 17:04:55 +0000
Message-ID: <bug-76376-8800-a0rSqyjbkO@http.bugs.freedesktop.org/>
References: <bug-76376-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1968051703=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-76376-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1968051703==
Content-Type: multipart/alternative; boundary="1395421495.3Bfe0.13930"; charset="us-ascii"


--1395421495.3Bfe0.13930
Date: Fri, 21 Mar 2014 17:04:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=76376

--- Comment #5 from Jonathan Gray <jsg-7YlrpqBBQ3VAfugRpC6u6w@public.gmane.org> ---
It isn't 'old libdrm' or 'random files' it is a specific subset for the drivers
the kernel supports.  The history here seems to be that five years ago Owain
removed the autoconf portions for reasons I'm not entirely clear on.  Normally
this is because of something like a requirement on gnu make and python in a
build system.

The diff we have to libdrm is quite minimal, and includes changes for our
privilege separated server and a drmCheckModesettingSupported() case for
OpenBSD.

If the answer here is all the _drm.h files must be installed fine, I'll work
something out.  Maybe we'll go back to having multiple copies of the headers
instead of sharing them between userland and the kernel.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1395421495.3Bfe0.13930
Date: Fri, 21 Mar 2014 17:04:55 +0000
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
   title="NEW --- - mesa does not build after nouveau loader changes"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76376#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - mesa does not build after nouveau loader changes"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76376">bug 76376</a>
              from <span class="vcard"><a class="email" href="mailto:jsg&#64;openbsd.org" title="Jonathan Gray &lt;jsg&#64;openbsd.org&gt;"> <span class="fn">Jonathan Gray</span></a>
</span></b>
        <pre>It isn't 'old libdrm' or 'random files' it is a specific subset for the drivers
the kernel supports.  The history here seems to be that five years ago Owain
removed the autoconf portions for reasons I'm not entirely clear on.  Normally
this is because of something like a requirement on gnu make and python in a
build system.

The diff we have to libdrm is quite minimal, and includes changes for our
privilege separated server and a drmCheckModesettingSupported() case for
OpenBSD.

If the answer here is all the _drm.h files must be installed fine, I'll work
something out.  Maybe we'll go back to having multiple copies of the headers
instead of sharing them between userland and the kernel.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1395421495.3Bfe0.13930--

--===============1968051703==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1968051703==--
