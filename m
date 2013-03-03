From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 61731] Nouveau not working on second monitor
Date: Sun, 03 Mar 2013 10:15:17 +0000
Message-ID: <bug-61731-8800-seNIDwgN4a@http.bugs.freedesktop.org/>
References: <bug-61731-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1877302351=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-61731-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1877302351==
Content-Type: multipart/alternative; boundary="1362305717.d53Bf2.6126"; charset="us-ascii"


--1362305717.d53Bf2.6126
Date: Sun, 3 Mar 2013 10:15:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=61731

--- Comment #2 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Hi Ronald

Did you notice the lines
[   67.479198] NVRM: The NVIDIA GPU 0000:01:00.0 (PCI ID: 10de:0426)
[   67.479198] NVRM: installed in this system is not supported by the 304.64
[   67.479198] NVRM: NVIDIA Linux driver release.  Please see 'Appendix
[   67.479198] NVRM: A - Supported NVIDIA GPU Products' in this release's
[   67.479198] NVRM: README, available on the Linux driver download page
[   67.479198] NVRM: at www.nvidia.com.

Fully(correctly) remove the blob and then try again

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1362305717.d53Bf2.6126
Date: Sun, 3 Mar 2013 10:15:17 +0000
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
   title="NEW --- - Nouveau not working on second monitor"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61731#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Nouveau not working on second monitor"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61731">bug 61731</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>Hi Ronald

Did you notice the lines
[   67.479198] NVRM: The NVIDIA GPU 0000:01:00.0 (PCI ID: 10de:0426)
[   67.479198] NVRM: installed in this system is not supported by the 304.64
[   67.479198] NVRM: NVIDIA Linux driver release.  Please see 'Appendix
[   67.479198] NVRM: A - Supported NVIDIA GPU Products' in this release's
[   67.479198] NVRM: README, available on the Linux driver download page
[   67.479198] NVRM: at www.nvidia.com.

Fully(correctly) remove the blob and then try again</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1362305717.d53Bf2.6126--

--===============1877302351==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1877302351==--
