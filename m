From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 76732] Kworker using 100% CPU
Date: Fri, 28 Mar 2014 16:50:59 +0000
Message-ID: <bug-76732-8800-xedk75FtCE@http.bugs.freedesktop.org/>
References: <bug-76732-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0284255691=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-76732-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0284255691==
Content-Type: multipart/alternative; boundary="1396025458.2b82C1B2.3729"; charset="us-ascii"


--1396025458.2b82C1B2.3729
Date: Fri, 28 Mar 2014 16:50:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=76732

--- Comment #12 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #11)
> Maybe now I can clarify a little bit.
> 
> 
> If nouveau loads at boot, the problem is always there, even with
> drm_kms_helper.poll=0.
> 
> 
> If nouveau is blacklisted at boot i have two possible situations:
> 1)
> - i have gdm on the screen
> - through ssh load drm_kms_helper with poll=0
> - load nouveau
> - the screen goes black, or sometimes it displays some rubbish
> - in dmesg whis appears:
> [   66.938644] pci_pm_runtime_suspend():
> nouveau_pmops_runtime_suspend+0x0/0xd0 [nouveau] returns -22
> - i press ctrl+alt+F1 and nothing happens but this appears in dmesg:
> [  175.868791] detected fb_set_par error, error code: -22
> -> CPU load is normal

Yeah, nouveau suspends and is gone forever. You can disable runtime pm with
nouveau.runpm=0. A fix for this should be in 3.14-final, I think.

> 
> 2)
> - switch to tty1
> - through ssh load drm_kms_helper with poll=0
> - load nouveau
> - screen changes resolution and still works, also changing tty works
> - CPU load at 100%
> 
> 
> All the 3 situations are reproducible all the time

In one of the cpu load at 100% situations, could you do a

perf record -g -a

(as root), and attach the resulting perf.data file after like 30s of runtime,
along with your kallsyms (which should include nouveau and drm* symbols...
grabbing /proc/kallsyms from a running kernel should work).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1396025458.2b82C1B2.3729
Date: Fri, 28 Mar 2014 16:50:58 +0000
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
   title="NEW --- - Kworker using 100% CPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76732#c12">Comment # 12</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Kworker using 100% CPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76732">bug 76732</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=76732#c11">comment #11</a>)
<span class="quote">&gt; Maybe now I can clarify a little bit.
&gt; 
&gt; 
&gt; If nouveau loads at boot, the problem is always there, even with
&gt; drm_kms_helper.poll=0.
&gt; 
&gt; 
&gt; If nouveau is blacklisted at boot i have two possible situations:
&gt; 1)
&gt; - i have gdm on the screen
&gt; - through ssh load drm_kms_helper with poll=0
&gt; - load nouveau
&gt; - the screen goes black, or sometimes it displays some rubbish
&gt; - in dmesg whis appears:
&gt; [   66.938644] pci_pm_runtime_suspend():
&gt; nouveau_pmops_runtime_suspend+0x0/0xd0 [nouveau] returns -22
&gt; - i press ctrl+alt+F1 and nothing happens but this appears in dmesg:
&gt; [  175.868791] detected fb_set_par error, error code: -22
&gt; -&gt; CPU load is normal</span >

Yeah, nouveau suspends and is gone forever. You can disable runtime pm with
nouveau.runpm=0. A fix for this should be in 3.14-final, I think.

<span class="quote">&gt; 
&gt; 2)
&gt; - switch to tty1
&gt; - through ssh load drm_kms_helper with poll=0
&gt; - load nouveau
&gt; - screen changes resolution and still works, also changing tty works
&gt; - CPU load at 100%
&gt; 
&gt; 
&gt; All the 3 situations are reproducible all the time</span >

In one of the cpu load at 100% situations, could you do a

perf record -g -a

(as root), and attach the resulting perf.data file after like 30s of runtime,
along with your kallsyms (which should include nouveau and drm* symbols...
grabbing /proc/kallsyms from a running kernel should work).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1396025458.2b82C1B2.3729--

--===============0284255691==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0284255691==--
