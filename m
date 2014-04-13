From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 77361] [nve7] nouveau not working on 3.13 linux
	kernel
Date: Sun, 13 Apr 2014 13:10:43 +0000
Message-ID: <bug-77361-8800-4nsiW61jS5@http.bugs.freedesktop.org/>
References: <bug-77361-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1040368089=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-77361-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1040368089==
Content-Type: multipart/alternative; boundary="1397394642.3e1Ed1.29515"; charset="us-ascii"


--1397394642.3e1Ed1.29515
Date: Sun, 13 Apr 2014 13:10:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=77361

--- Comment #22 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #21)
> The same problem has also been reported in the Debian BTS, one of the people
> who saw it claimed that unsetting CONFIG_X86_SYSFB when building the kernel
> helps: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=740953#40
> 
> Note that Debian enabled CONFIG_X86_SYSFB in 3.13, in their 3.12 kernel it
> is not set.
Nice one Sven,

I knew I've seen a similar issue but did not manage to find anything before.
AFAIK some fb drivers have a quirk (pci_fixup_video) that sets up boot_vga=1,
which is required by X. The sysfb is not aware about pci_fixup_video thus the
issue.

There is some more information in the patch [1] by Bruno. Feel free to give it
a try.

[1] http://lists.freedesktop.org/archives/dri-devel/2014-March/055798.html

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1397394642.3e1Ed1.29515
Date: Sun, 13 Apr 2014 13:10:42 +0000
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
   title="NEW --- - [nve7] nouveau not working on 3.13 linux kernel"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77361#c22">Comment # 22</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nve7] nouveau not working on 3.13 linux kernel"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77361">bug 77361</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=77361#c21">comment #21</a>)
<span class="quote">&gt; The same problem has also been reported in the Debian BTS, one of the people
&gt; who saw it claimed that unsetting CONFIG_X86_SYSFB when building the kernel
&gt; helps: <a href="https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=740953#40">https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=740953#40</a>
&gt; 
&gt; Note that Debian enabled CONFIG_X86_SYSFB in 3.13, in their 3.12 kernel it
&gt; is not set.</span >
Nice one Sven,

I knew I've seen a similar issue but did not manage to find anything before.
AFAIK some fb drivers have a quirk (pci_fixup_video) that sets up boot_vga=1,
which is required by X. The sysfb is not aware about pci_fixup_video thus the
issue.

There is some more information in the patch [1] by Bruno. Feel free to give it
a try.

[1] <a href="http://lists.freedesktop.org/archives/dri-devel/2014-March/055798.html">http://lists.freedesktop.org/archives/dri-devel/2014-March/055798.html</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1397394642.3e1Ed1.29515--

--===============1040368089==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1040368089==--
