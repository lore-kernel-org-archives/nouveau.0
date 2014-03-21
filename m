From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 76376] mesa does not build after nouveau loader
	changes
Date: Fri, 21 Mar 2014 17:33:09 +0000
Message-ID: <bug-76376-8800-lws2aGC4Cm@http.bugs.freedesktop.org/>
References: <bug-76376-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1789069369=="
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


--===============1789069369==
Content-Type: multipart/alternative; boundary="1395423189.0B1022F1.22013"; charset="us-ascii"


--1395423189.0B1022F1.22013
Date: Fri, 21 Mar 2014 17:33:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=76376

Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |NOTOURBUG

--- Comment #6 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #5)
> It isn't 'old libdrm' or 'random files' it is a specific subset for the
"old drm" refers to the structure, "random files" refers that you're pulling
only changes to the core drm files.

> drivers the kernel supports.  The history here seems to be that five years
> ago Owain removed the autoconf portions for reasons I'm not entirely clear
Indeed, I've skimmed through the history and did not see any reason why it was
nuked. Was hoping that you may have an idea on the topic.

> on.  Normally this is because of something like a requirement on gnu make
> and python in a build system.
> 
AFAICS the build is very simple and does not require anything fancy apart from
autoconf/automake. Not sure how keen are you guys on the auto* pair though.

> The diff we have to libdrm is quite minimal, and includes changes for our
> privilege separated server and a drmCheckModesettingSupported() case for
> OpenBSD.
> 
drmCheckModesettingSupported recently gained support for FreeBSD, and I suspect
that no one will object if you guys are interested in merging your OpenBSD
implementation.

> If the answer here is all the _drm.h files must be installed fine, I'll work
> something out.  Maybe we'll go back to having multiple copies of the headers
> instead of sharing them between userland and the kernel.
This is how we handle it currently - headers do not change with every drm
release, things do not sound that bad.

My main goal here is "drm has evolved over the last 5 years". It has a nice
selection of programs/apps/documentation that people working on drm on any
platform may be interested in. If you guys want less headache/patching,
consider using the upstream drm and sent us patches on how we can make it
better :-)

Thanks

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1395423189.0B1022F1.22013
Date: Fri, 21 Mar 2014 17:33:09 +0000
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
   title="RESOLVED NOTOURBUG - mesa does not build after nouveau loader changes"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76376">bug 76376</a>
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
           <td>NOTOURBUG
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED NOTOURBUG - mesa does not build after nouveau loader changes"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76376#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED NOTOURBUG - mesa does not build after nouveau loader changes"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76376">bug 76376</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=76376#c5">comment #5</a>)
<span class="quote">&gt; It isn't 'old libdrm' or 'random files' it is a specific subset for the</span >
&quot;old drm&quot; refers to the structure, &quot;random files&quot; refers that you're pulling
only changes to the core drm files.

<span class="quote">&gt; drivers the kernel supports.  The history here seems to be that five years
&gt; ago Owain removed the autoconf portions for reasons I'm not entirely clear</span >
Indeed, I've skimmed through the history and did not see any reason why it was
nuked. Was hoping that you may have an idea on the topic.

<span class="quote">&gt; on.  Normally this is because of something like a requirement on gnu make
&gt; and python in a build system.
&gt; </span >
AFAICS the build is very simple and does not require anything fancy apart from
autoconf/automake. Not sure how keen are you guys on the auto* pair though.

<span class="quote">&gt; The diff we have to libdrm is quite minimal, and includes changes for our
&gt; privilege separated server and a drmCheckModesettingSupported() case for
&gt; OpenBSD.
&gt; </span >
drmCheckModesettingSupported recently gained support for FreeBSD, and I suspect
that no one will object if you guys are interested in merging your OpenBSD
implementation.

<span class="quote">&gt; If the answer here is all the _drm.h files must be installed fine, I'll work
&gt; something out.  Maybe we'll go back to having multiple copies of the headers
&gt; instead of sharing them between userland and the kernel.</span >
This is how we handle it currently - headers do not change with every drm
release, things do not sound that bad.

My main goal here is &quot;drm has evolved over the last 5 years&quot;. It has a nice
selection of programs/apps/documentation that people working on drm on any
platform may be interested in. If you guys want less headache/patching,
consider using the upstream drm and sent us patches on how we can make it
better :-)

Thanks</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1395423189.0B1022F1.22013--

--===============1789069369==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1789069369==--
