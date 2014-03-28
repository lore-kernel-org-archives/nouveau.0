From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 76732] Kworker using 100% CPU
Date: Fri, 28 Mar 2014 13:46:29 +0000
Message-ID: <bug-76732-8800-FpgVqOhprR@http.bugs.freedesktop.org/>
References: <bug-76732-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0406642683=="
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


--===============0406642683==
Content-Type: multipart/alternative; boundary="1396014389.4CBcbcE1.11268"; charset="us-ascii"


--1396014389.4CBcbcE1.11268
Date: Fri, 28 Mar 2014 13:46:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=76732

--- Comment #10 from patrick.clara-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
(In reply to comment #9)
> (In reply to comment #8)
> > Booting with drm_kms_helper.poll=0 does not help.
> 
> Are you absolutely sure? That should cause drm_helper_hpd_irq_event to not
> do any work and return immediately... unless that setting is somehow not
> getting propagated to dev->mode_config.poll_enabled...

I have tryed other 3 times and checked and rechecked spelling.
Nothing does change.

I then booted with "modprobe.blacklist=nouveau" and afterwards did "modprobe
drm_kms_helper poll=0" and "modprobe nouveau". The problem disappears but also
the output on the screen. I can not reproduce it every time and it could be
related to when and how i switch between tty. I got this in dmesg (only in this
particular case), dont know if it is related.

[   49.265515] [drm] Initialized nouveau 1.1.1 20120801 for 0000:01:00.0 on
minor 0
[   54.910045] pci_pm_runtime_suspend(): nouveau_pmops_runtime_suspend+0x0/0xd0
[nouveau] returns -22
[   78.572068] detected fb_set_par error, error code: -22
[  175.690629] detected fb_set_par error, error code: -22
[  176.447496] systemd-logind[2892]: New session 3 of user Debian-gdm.
[  183.530486] detected fb_set_par error, error code: -22
[  183.537975] systemd-logind[2892]: Removed session 3.
[  184.246263] systemd-logind[2892]: New session 4 of user Debian-gdm.
[  201.221280] systemd-logind[2892]: Removed session 4.
[  201.224190] systemd-logind[2892]: Removed session 1.
[  201.709503] detected fb_set_par error, error code: -22

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1396014389.4CBcbcE1.11268
Date: Fri, 28 Mar 2014 13:46:29 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76732#c10">Comment # 10</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Kworker using 100% CPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76732">bug 76732</a>
              from <span class="vcard"><a class="email" href="mailto:patrick.clara&#64;gmail.com" title="patrick.clara&#64;gmail.com">patrick.clara&#64;gmail.com</a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=76732#c9">comment #9</a>)
<span class="quote">&gt; (In reply to <a href="show_bug.cgi?id=76732#c8">comment #8</a>)
&gt; &gt; Booting with drm_kms_helper.poll=0 does not help.
&gt; 
&gt; Are you absolutely sure? That should cause drm_helper_hpd_irq_event to not
&gt; do any work and return immediately... unless that setting is somehow not
&gt; getting propagated to dev-&gt;mode_config.poll_enabled...</span >

I have tryed other 3 times and checked and rechecked spelling.
Nothing does change.

I then booted with &quot;modprobe.blacklist=nouveau&quot; and afterwards did &quot;modprobe
drm_kms_helper poll=0&quot; and &quot;modprobe nouveau&quot;. The problem disappears but also
the output on the screen. I can not reproduce it every time and it could be
related to when and how i switch between tty. I got this in dmesg (only in this
particular case), dont know if it is related.

[   49.265515] [drm] Initialized nouveau 1.1.1 20120801 for 0000:01:00.0 on
minor 0
[   54.910045] pci_pm_runtime_suspend(): nouveau_pmops_runtime_suspend+0x0/0xd0
[nouveau] returns -22
[   78.572068] detected fb_set_par error, error code: -22
[  175.690629] detected fb_set_par error, error code: -22
[  176.447496] systemd-logind[2892]: New session 3 of user Debian-gdm.
[  183.530486] detected fb_set_par error, error code: -22
[  183.537975] systemd-logind[2892]: Removed session 3.
[  184.246263] systemd-logind[2892]: New session 4 of user Debian-gdm.
[  201.221280] systemd-logind[2892]: Removed session 4.
[  201.224190] systemd-logind[2892]: Removed session 1.
[  201.709503] detected fb_set_par error, error code: -22</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1396014389.4CBcbcE1.11268--

--===============0406642683==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0406642683==--
