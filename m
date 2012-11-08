From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 55412] Screen turns black during boot after driver
 tries to set mode on NV50
Date: Thu, 08 Nov 2012 15:56:22 +0000
Message-ID: <bug-55412-8800-DEIhfIytNa@http.bugs.freedesktop.org/>
References: <bug-55412-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0656111535=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-55412-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0656111535==
Content-Type: multipart/alternative; boundary="1352390182.aE6e61.1709"; charset="us-ascii"


--1352390182.aE6e61.1709
Date: Thu, 8 Nov 2012 15:56:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=55412

--- Comment #3 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Hi Lubosz

The commit mentioned was part of the big nouveau rework, that landed in the 3.7
kernel tree. Note that the commit has been rebased thus I cannot check why
exactly it's causing issues with your system

From what I can see is
* With the offending commit, nouveau fails to detect any CRTC (outputs)
connected, thus the issue
* With the commit and "nouveau.reg_debug=0x600" nouveau complains
"nouveau: `0x600' invalid for parameter `reg_debug" and does not load (at least
not mentioned in the log)

Can you try the latest nouveau git or linux 3.7 to establish it this regression
has been fixed or not

Thanks

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1352390182.aE6e61.1709
Date: Thu, 8 Nov 2012 15:56:22 +0000
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
   title="NEW --- - Screen turns black during boot after driver tries to set mode on NV50"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=55412#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Screen turns black during boot after driver tries to set mode on NV50"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=55412">bug 55412</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>Hi Lubosz

The commit mentioned was part of the big nouveau rework, that landed in the 3.7
kernel tree. Note that the commit has been rebased thus I cannot check why
exactly it's causing issues with your system

From what I can see is
* With the offending commit, nouveau fails to detect any CRTC (outputs)
connected, thus the issue
* With the commit and &quot;nouveau.reg_debug=0x600&quot; nouveau complains
&quot;nouveau: `0x600' invalid for parameter `reg_debug&quot; and does not load (at least
not mentioned in the log)

Can you try the latest nouveau git or linux 3.7 to establish it this regression
has been fixed or not

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

--1352390182.aE6e61.1709--

--===============0656111535==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0656111535==--
