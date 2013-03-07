From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 61953] arbitrary memory access corrupts kernel
 memory, eventually crashing the kernel
Date: Thu, 07 Mar 2013 11:46:41 +0000
Message-ID: <bug-61953-8800-GXuaILOhNG@http.bugs.freedesktop.org/>
References: <bug-61953-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0068700158=="
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


--===============0068700158==
Content-Type: multipart/alternative; boundary="1362656801.6eF37231.15943"; charset="us-ascii"


--1362656801.6eF37231.15943
Date: Thu, 7 Mar 2013 11:46:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=61953

--- Comment #5 from Adrian Knoth <adi-5gjw4BGRu82yAo/rNOIehoJPQCENF9+z@public.gmane.org> ---
Unaffected: Kernel 3.2.x and before
Affected: probably everything afterwards, at least 3.5.x to 3.8.2
Card: NVc1 (GF108)

When doing graphics-intensive work, video corruption occurs that later leads to
a kernel crash. This bug is easy to reproduce for me, but it's hard to provide
a minimal test case.

How to trigger:
Using the "Export to PDF" button in libreoffice may cause video corruption once
the export is done (see attached screenshot). Occasionally, also the resulting
PDF is corrupted (see attached PDF).

Likewise, watching youtube videos or flicking through online magazines
(http://issuu.com/gimpmagazine/docs/issue3) will first create 1px wide
horizontal lines, later larger distorted structures and eventually crash the
kernel.

Also, using ardour3 (quite some heavy GTK canvas action) will cause artefacts
and then crash the kernel within 40 minutes.

Kernel backtraces differ from "page table corruption" to various code paths in
almost any subsystem (NFS, ext4, RCU, whatever). Sometimes, individual
userspace processes crash or hang in syscalls.

I ran memtest for two days without problems. As said before, everything is fine
on 3.2.x, too.

Looks like random memory access from/via nouveau to me. If need be, I can grab
a radeon card to support/falsify this hypothesis.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1362656801.6eF37231.15943
Date: Thu, 7 Mar 2013 11:46:41 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61953#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - arbitrary memory access corrupts kernel memory, eventually crashing the kernel"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61953">bug 61953</a>
              from <span class="vcard"><a class="email" href="mailto:adi&#64;drcomp.erfurt.thur.de" title="Adrian Knoth &lt;adi&#64;drcomp.erfurt.thur.de&gt;"> <span class="fn">Adrian Knoth</span></a>
</span></b>
        <pre>Unaffected: Kernel 3.2.x and before
Affected: probably everything afterwards, at least 3.5.x to 3.8.2
Card: NVc1 (GF108)

When doing graphics-intensive work, video corruption occurs that later leads to
a kernel crash. This bug is easy to reproduce for me, but it's hard to provide
a minimal test case.

How to trigger:
Using the &quot;Export to PDF&quot; button in libreoffice may cause video corruption once
the export is done (see attached screenshot). Occasionally, also the resulting
PDF is corrupted (see attached PDF).

Likewise, watching youtube videos or flicking through online magazines
(<a href="http://issuu.com/gimpmagazine/docs/issue3">http://issuu.com/gimpmagazine/docs/issue3</a>) will first create 1px wide
horizontal lines, later larger distorted structures and eventually crash the
kernel.

Also, using ardour3 (quite some heavy GTK canvas action) will cause artefacts
and then crash the kernel within 40 minutes.

Kernel backtraces differ from &quot;page table corruption&quot; to various code paths in
almost any subsystem (NFS, ext4, RCU, whatever). Sometimes, individual
userspace processes crash or hang in syscalls.

I ran memtest for two days without problems. As said before, everything is fine
on 3.2.x, too.

Looks like random memory access from/via nouveau to me. If need be, I can grab
a radeon card to support/falsify this hypothesis.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1362656801.6eF37231.15943--

--===============0068700158==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0068700158==--
