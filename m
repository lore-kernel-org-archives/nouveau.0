From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 74492] v3.13-rc8 nv4e + msi = random lockups
Date: Tue, 04 Feb 2014 08:14:24 +0000
Message-ID: <bug-74492-8800-wGBFHE6TBN@http.bugs.freedesktop.org/>
References: <bug-74492-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0686579612=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-74492-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0686579612==
Content-Type: multipart/alternative; boundary="1391501664.DF1322.14723"; charset="us-ascii"


--1391501664.DF1322.14723
Date: Tue, 4 Feb 2014 08:14:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=74492

--- Comment #3 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Yes, probably the same thing as that bug, although unfortunately the bug filer
from #73445 never responded to my suggestion.

Definitely sounds like something IRQ-ish is going bad. I think the ultimate
resolution will be to just disable MSI on nv4e, but if you don't mind, could
you attach the output of

# lspci -vvvnn
# cat /proc/interrupts

(Run as root -- well, really just the lspci bit needs root.)

for both the NvMSI=0 case as well as the default case. Even more ideally, do
this when the corruption begins (for when MSI is enabled). Also, can you attach
a dmesg of a boot without NvMSI=0? Do you see funny interrupt errors in dmesg
(like "irq 16 nobody cared" sort of thing)?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1391501664.DF1322.14723
Date: Tue, 4 Feb 2014 08:14:24 +0000
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
   title="NEW --- - v3.13-rc8 nv4e + msi = random lockups"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74492#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - v3.13-rc8 nv4e + msi = random lockups"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74492">bug 74492</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Yes, probably the same thing as that bug, although unfortunately the bug filer
from #73445 never responded to my suggestion.

Definitely sounds like something IRQ-ish is going bad. I think the ultimate
resolution will be to just disable MSI on nv4e, but if you don't mind, could
you attach the output of

# lspci -vvvnn
# cat /proc/interrupts

(Run as root -- well, really just the lspci bit needs root.)

for both the NvMSI=0 case as well as the default case. Even more ideally, do
this when the corruption begins (for when MSI is enabled). Also, can you attach
a dmesg of a boot without NvMSI=0? Do you see funny interrupt errors in dmesg
(like &quot;irq 16 nobody cared&quot; sort of thing)?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1391501664.DF1322.14723--

--===============0686579612==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0686579612==--
