From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 76732] Kworker using 100% CPU
Date: Fri, 28 Mar 2014 15:41:04 +0000
Message-ID: <bug-76732-8800-B3mKKaBpCo@http.bugs.freedesktop.org/>
References: <bug-76732-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2051047049=="
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


--===============2051047049==
Content-Type: multipart/alternative; boundary="1396021264.2Ad16C1.13223"; charset="us-ascii"


--1396021264.2Ad16C1.13223
Date: Fri, 28 Mar 2014 15:41:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=76732

--- Comment #11 from patrick.clara-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
Maybe now I can clarify a little bit.


If nouveau loads at boot, the problem is always there, even with
drm_kms_helper.poll=0.


If nouveau is blacklisted at boot i have two possible situations:
1)
- i have gdm on the screen
- through ssh load drm_kms_helper with poll=0
- load nouveau
- the screen goes black, or sometimes it displays some rubbish
- in dmesg whis appears:
[   66.938644] pci_pm_runtime_suspend(): nouveau_pmops_runtime_suspend+0x0/0xd0
[nouveau] returns -22
- i press ctrl+alt+F1 and nothing happens but this appears in dmesg:
[  175.868791] detected fb_set_par error, error code: -22
-> CPU load is normal

2)
- switch to tty1
- through ssh load drm_kms_helper with poll=0
- load nouveau
- screen changes resolution and still works, also changing tty works
- CPU load at 100%


All the 3 situations are reproducible all the time

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1396021264.2Ad16C1.13223
Date: Fri, 28 Mar 2014 15:41:04 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76732#c11">Comment # 11</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Kworker using 100% CPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76732">bug 76732</a>
              from <span class="vcard"><a class="email" href="mailto:patrick.clara&#64;gmail.com" title="patrick.clara&#64;gmail.com">patrick.clara&#64;gmail.com</a>
</span></b>
        <pre>Maybe now I can clarify a little bit.


If nouveau loads at boot, the problem is always there, even with
drm_kms_helper.poll=0.


If nouveau is blacklisted at boot i have two possible situations:
1)
- i have gdm on the screen
- through ssh load drm_kms_helper with poll=0
- load nouveau
- the screen goes black, or sometimes it displays some rubbish
- in dmesg whis appears:
[   66.938644] pci_pm_runtime_suspend(): nouveau_pmops_runtime_suspend+0x0/0xd0
[nouveau] returns -22
- i press ctrl+alt+F1 and nothing happens but this appears in dmesg:
[  175.868791] detected fb_set_par error, error code: -22
-&gt; CPU load is normal

2)
- switch to tty1
- through ssh load drm_kms_helper with poll=0
- load nouveau
- screen changes resolution and still works, also changing tty works
- CPU load at 100%


All the 3 situations are reproducible all the time</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1396021264.2Ad16C1.13223--

--===============2051047049==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2051047049==--
