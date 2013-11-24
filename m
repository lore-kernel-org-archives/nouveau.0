From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 71967] error message during boot
Date: Sun, 24 Nov 2013 15:46:11 +0000
Message-ID: <bug-71967-8800-Q5zMWgaWb8@http.bugs.freedesktop.org/>
References: <bug-71967-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0374550657=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-71967-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0374550657==
Content-Type: multipart/alternative; boundary="1385307970.Cf7Cfe82.4708"; charset="us-ascii"


--1385307970.Cf7Cfe82.4708
Date: Sun, 24 Nov 2013 15:46:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=71967

--- Comment #5 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
From http://nouveau.freedesktop.org/wiki/Bugs/, which I encourage you to read
slowly and carefully:

"""
Attach complete, unfiltered, untrimmed kernel log from the boot up to and
including the problem, and a complete X log if the problem manifests with X.
Note, that /var/log/messages is not a kernel log. Running dmesg is the best way
to get a kernel log, but assuming, that the log buffer has not wrapped around.
"""

You say that you're on a 525M -- does this correspond to a NVC1? (This would be
apparent from the various logs, one of the many reasons we ask for one.) If so,
there's a bug in 3.11 and 3.12 related to NVC1. Either use 3.10 or 3.13-rc1 or
apply this patch:
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=13d2b35a0653

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1385307970.Cf7Cfe82.4708
Date: Sun, 24 Nov 2013 15:46:10 +0000
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
   title="NEW --- - error message during boot"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71967#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - error message during boot"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71967">bug 71967</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>From <a href="http://nouveau.freedesktop.org/wiki/Bugs/">http://nouveau.freedesktop.org/wiki/Bugs/</a>, which I encourage you to read
slowly and carefully:

&quot;&quot;&quot;
Attach complete, unfiltered, untrimmed kernel log from the boot up to and
including the problem, and a complete X log if the problem manifests with X.
Note, that /var/log/messages is not a kernel log. Running dmesg is the best way
to get a kernel log, but assuming, that the log buffer has not wrapped around.
&quot;&quot;&quot;

You say that you're on a 525M -- does this correspond to a NVC1? (This would be
apparent from the various logs, one of the many reasons we ask for one.) If so,
there's a bug in 3.11 and 3.12 related to NVC1. Either use 3.10 or 3.13-rc1 or
apply this patch:
<a href="https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=13d2b35a0653">https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=13d2b35a0653</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1385307970.Cf7Cfe82.4708--

--===============0374550657==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0374550657==--
