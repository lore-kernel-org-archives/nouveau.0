From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 61953] arbitrary memory access corrupts kernel
 memory, eventually crashing the kernel
Date: Tue, 21 May 2013 03:20:05 +0000
Message-ID: <bug-61953-8800-Nn8zFPq03m@http.bugs.freedesktop.org/>
References: <bug-61953-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0854203814=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-61953-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0854203814==
Content-Type: multipart/alternative; boundary="1369106405.a23fd3.29547"; charset="us-ascii"


--1369106405.a23fd3.29547
Date: Tue, 21 May 2013 03:20:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=61953

--- Comment #11 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Try configuring your kernel with SLUB, and boot with slub_debug=FZPU. See if
you get any allocation/usage-related backtraces in dmesg. (This will often
prevent crashes from happening, so check dmesg every so often.) Even if you
don't, it may be instructive to see dmesg dumps after a crash occurs even if it
appears to be due to "random memory corruption".

Also, if it got worse in 3.2.42, what was the last "not as bad" version? It may
be the case that there are two separate issues going on here.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1369106405.a23fd3.29547
Date: Tue, 21 May 2013 03:20:05 +0000
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
   title="NEW --- - arbitrary memory access corrupts kernel memory, eventually crashing the kernel"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61953#c11">Comment # 11</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - arbitrary memory access corrupts kernel memory, eventually crashing the kernel"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61953">bug 61953</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Try configuring your kernel with SLUB, and boot with slub_debug=FZPU. See if
you get any allocation/usage-related backtraces in dmesg. (This will often
prevent crashes from happening, so check dmesg every so often.) Even if you
don't, it may be instructive to see dmesg dumps after a crash occurs even if it
appears to be due to &quot;random memory corruption&quot;.

Also, if it got worse in 3.2.42, what was the last &quot;not as bad&quot; version? It may
be the case that there are two separate issues going on here.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1369106405.a23fd3.29547--

--===============0854203814==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0854203814==--
