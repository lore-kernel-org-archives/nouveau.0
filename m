From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 57326] [NVCE] gpu lockup when using hardware
 acceleration in AndroVM
Date: Sat, 31 Aug 2013 14:37:21 +0000
Message-ID: <bug-57326-8800-8WSZ0wUHrn@http.bugs.freedesktop.org/>
References: <bug-57326-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1062969782=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-57326-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1062969782==
Content-Type: multipart/alternative; boundary="1377959841.8dBc5Cee0.21911"; charset="us-ascii"


--1377959841.8dBc5Cee0.21911
Date: Sat, 31 Aug 2013 14:37:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=57326

--- Comment #3 from thepouar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
Might be hard to test. I've switched to Radeon a few weeks ago. Although once I
get a new motherboard and processor I plan on hooking both the Radeon and
Nvidia card up and use the Nvidia card for my VMs using VGA passthrough as my
current board doesn't support IOMMU. Although It wouldn't be the only issue
with GPU lockups with Nouveau, recently the GPU locksup locks up when running
the "performance assessment" in Windows 7 to refresh the "Windows Experience
Index" in VirtualBox while it works perfectly fine in the binary blob and
Radeon. Want me to file a new bug report for that?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377959841.8dBc5Cee0.21911
Date: Sat, 31 Aug 2013 14:37:21 +0000
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
   title="NEW --- - [NVCE] gpu lockup when using hardware acceleration in AndroVM"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=57326#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVCE] gpu lockup when using hardware acceleration in AndroVM"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=57326">bug 57326</a>
              from <span class="vcard"><a class="email" href="mailto:thepouar&#64;gmail.com" title="thepouar&#64;gmail.com">thepouar&#64;gmail.com</a>
</span></b>
        <pre>Might be hard to test. I've switched to Radeon a few weeks ago. Although once I
get a new motherboard and processor I plan on hooking both the Radeon and
Nvidia card up and use the Nvidia card for my VMs using VGA passthrough as my
current board doesn't support IOMMU. Although It wouldn't be the only issue
with GPU lockups with Nouveau, recently the GPU locksup locks up when running
the &quot;performance assessment&quot; in Windows 7 to refresh the &quot;Windows Experience
Index&quot; in VirtualBox while it works perfectly fine in the binary blob and
Radeon. Want me to file a new bug report for that?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377959841.8dBc5Cee0.21911--

--===============1062969782==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1062969782==--
