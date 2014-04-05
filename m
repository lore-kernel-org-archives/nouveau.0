From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 76732] Kworker using 100% CPU
Date: Sat, 05 Apr 2014 00:20:47 +0000
Message-ID: <bug-76732-8800-q6COUifNHg@http.bugs.freedesktop.org/>
References: <bug-76732-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0567055728=="
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


--===============0567055728==
Content-Type: multipart/alternative; boundary="1396657247.81382.3495"; charset="us-ascii"


--1396657247.81382.3495
Date: Sat, 5 Apr 2014 00:20:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=76732

--- Comment #32 from Dale Hamel <daleha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I can confirm that v3.8-rc6 ( a few commits before the bad commit ) works fine
for me.

(In reply to comment #0)
> Loading the nouveau driver leads to a kworker constantly using  100% of a
> CPU core.
> 
> PID USER      PR  NI    VIRT    RES    SHR S  %CPU %MEM     TIME+ COMMAND
> 211 root      20   0       0      0      0 R 100.0  0.0   2:51.00 kworker/1:1
> 
> Powertop suggests the problem comes from nouveau_connector_hotplug_work.
> 
> I noticed this problem first occurred in kernel 3.9 and still persists in
> 3.14 rc8. In kernel 3.8 the problem did not occur. Some time ago, trying to
> figure out the cause, i also tried a kernel bisect.
> 
> 
> git bisect start
> # bad: [c1be5a5b1b355d40e6cf79cc979eb66dafa24ad1] Linux 3.9
> git bisect bad c1be5a5b1b355d40e6cf79cc979eb66dafa24ad1
> # good: [19f949f52599ba7c3f67a5897ac6be14bfcb1200] Linux 3.8
> git bisect good 19f949f52599ba7c3f67a5897ac6be14bfcb1200
> # good: [d778df51c09264076fe0208c099ef7d428f21790] mm: vmscan: save work
> scanning (almost) empty LRU lists
> git bisect good d778df51c09264076fe0208c099ef7d428f21790
> # bad: [ee89f81252179dcbf6cd65bd48299f5e52292d88] Merge branch
> 'for-3.9/core' of git://git.kernel.dk/linux-block
> git bisect bad ee89f81252179dcbf6cd65bd48299f5e52292d88
> # good: [69086a78bdc973ec0b722be790b146e84ba8a8c4] Merge branch 'for-linus'
> of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs
> git bisect good 69086a78bdc973ec0b722be790b146e84ba8a8c4
> # bad: [ed5dc2372dba46e0ecd08791b1a0399d313e5cff] Merge tag
> 'mmc-updates-for-3.9-rc1' of git://
> git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc
> git bisect bad ed5dc2372dba46e0ecd08791b1a0399d313e5cff
> # bad: [1f3a574a4bfe86ebf7d51fac37e0668397372fd8] Merge branch
> 'drm-nouveau-next' of
> git://anongit.freedesktop.org/git/nouveau/linux-2.6into drm-next
> git bisect bad 1f3a574a4bfe86ebf7d51fac37e0668397372fd8
> # good: [cd17ef4114ad5c514b17e6a0bb02a309ab90b692] Merge tag
> 'drm-intel-next-2013-02-01' of git://
> people.freedesktop.org/~danvet/drm-intel into drm-next
> git bisect good cd17ef4114ad5c514b17e6a0bb02a309ab90b692
> # good: [210561ffd72d00eccf12c0131b8024d5436bae95] intel/iommu: force
> writebuffer-flush quirk on Gen 4 Chipsets
> git bisect good 210561ffd72d00eccf12c0131b8024d5436bae95
> # good: [0f0800661a125ddb038462570c869fe6f8ab5737] drm/nouveau/gpio: pass
> number of on-die gpio lines to base
> git bisect good 0f0800661a125ddb038462570c869fe6f8ab5737
> # good: [35f8badc1cf652381fa3f82c1fbea39f4dbe87fd] drm: Don't set the
> plane->fb to NULL on successfull set_plane
> git bisect good 35f8badc1cf652381fa3f82c1fbea39f4dbe87fd
> # good: [31a34aa421032cfe3b2b892c929e7539e747a7ac] drm/nouveau/i2c: aux
> channels not necessarily on nvio
> git bisect good 31a34aa421032cfe3b2b892c929e7539e747a7ac
> # bad: [0a0afd282fd715dd63d64b243299a64da14f8e8d] drm/nv50-/disp: move DP
> link training to core and train from supervisor
> git bisect bad 0a0afd282fd715dd63d64b243299a64da14f8e8d
> # good: [ac8cc241a81941932da44993242e68c62e115ec7] drm/nv50/devinit:
> reverse the logic for running encoder init scripts
> git bisect good ac8cc241a81941932da44993242e68c62e115ec7
> # good: [7dcd060c0e6e4f76ce7eea94c66437ce8f546530] drm/nouveau/i2c: create
> proper chipset-specific class implementations
> git bisect good 7dcd060c0e6e4f76ce7eea94c66437ce8f546530
> # good: [5cc027f6b1ec651c18a4322ed3e30c6e9cf01e96] drm/nv50-/disp: handle
> supervisor tasks from workqueue
> git bisect good 5cc027f6b1ec651c18a4322ed3e30c6e9cf01e96
> # first bad commit: [0a0afd282fd715dd63d64b243299a64da14f8e8d]
> drm/nv50-/disp: move DP link training to core and train from supervisor
> 
> 
> 
> 
> 0a0afd282fd715dd63d64b243299a64da14f8e8d is the first bad commit
> commit 0a0afd282fd715dd63d64b243299a64da14f8e8d
> Author: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Date:   Mon Feb 18 23:17:53 2013 -0500
> 
>     drm/nv50-/disp: move DP link training to core and train from supervisor
> 
>     We need to be able to do link training for PIOR-connected ANX9805 from
>     the third supervisor handler (due to script ordering in the bios, can't
>     have the "user" call train because some settings are overwritten from
>     the modesetting bios scripts).
> 
>     This moves link training for SOR-connected DP encoders to the second
>     supervisor interrupt, *before* we call the modesetting scripts (yes,
>     different ordering from PIOR is necessary).  This is useful since we
>     should now be able to remove some hacks to workaround races between
>     the supervisor and link training paths.
> 
>     Signed-off-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> 
> :040000 040000 8f2f2d8ea35eae1b6e6ff981761be02a8818bac3
> 2994eb54c689056254c241fe78a3af8d0b61d1df M    drivers

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1396657247.81382.3495
Date: Sat, 5 Apr 2014 00:20:47 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76732#c32">Comment # 32</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Kworker using 100% CPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76732">bug 76732</a>
              from <span class="vcard"><a class="email" href="mailto:daleha&#64;gmail.com" title="Dale Hamel &lt;daleha&#64;gmail.com&gt;"> <span class="fn">Dale Hamel</span></a>
</span></b>
        <pre>I can confirm that v3.8-rc6 ( a few commits before the bad commit ) works fine
for me.

(In reply to <a href="show_bug.cgi?id=76732#c0">comment #0</a>)
<span class="quote">&gt; Loading the nouveau driver leads to a kworker constantly using  100% of a
&gt; CPU core.
&gt; 
&gt; PID USER      PR  NI    VIRT    RES    SHR S  %CPU %MEM     TIME+ COMMAND
&gt; 211 root      20   0       0      0      0 R 100.0  0.0   2:51.00 kworker/1:1
&gt; 
&gt; Powertop suggests the problem comes from nouveau_connector_hotplug_work.
&gt; 
&gt; I noticed this problem first occurred in kernel 3.9 and still persists in
&gt; 3.14 rc8. In kernel 3.8 the problem did not occur. Some time ago, trying to
&gt; figure out the cause, i also tried a kernel bisect.
&gt; 
&gt; 
&gt; git bisect start
&gt; # bad: [c1be5a5b1b355d40e6cf79cc979eb66dafa24ad1] Linux 3.9
&gt; git bisect bad c1be5a5b1b355d40e6cf79cc979eb66dafa24ad1
&gt; # good: [19f949f52599ba7c3f67a5897ac6be14bfcb1200] Linux 3.8
&gt; git bisect good 19f949f52599ba7c3f67a5897ac6be14bfcb1200
&gt; # good: [d778df51c09264076fe0208c099ef7d428f21790] mm: vmscan: save work
&gt; scanning (almost) empty LRU lists
&gt; git bisect good d778df51c09264076fe0208c099ef7d428f21790
&gt; # bad: [ee89f81252179dcbf6cd65bd48299f5e52292d88] Merge branch
&gt; 'for-3.9/core' of git://git.kernel.dk/linux-block
&gt; git bisect bad ee89f81252179dcbf6cd65bd48299f5e52292d88
&gt; # good: [69086a78bdc973ec0b722be790b146e84ba8a8c4] Merge branch 'for-linus'
&gt; of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs
&gt; git bisect good 69086a78bdc973ec0b722be790b146e84ba8a8c4
&gt; # bad: [ed5dc2372dba46e0ecd08791b1a0399d313e5cff] Merge tag
&gt; 'mmc-updates-for-3.9-rc1' of git://
&gt; git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc
&gt; git bisect bad ed5dc2372dba46e0ecd08791b1a0399d313e5cff
&gt; # bad: [1f3a574a4bfe86ebf7d51fac37e0668397372fd8] Merge branch
&gt; 'drm-nouveau-next' of
&gt; git://anongit.freedesktop.org/git/nouveau/linux-2.6into drm-next
&gt; git bisect bad 1f3a574a4bfe86ebf7d51fac37e0668397372fd8
&gt; # good: [cd17ef4114ad5c514b17e6a0bb02a309ab90b692] Merge tag
&gt; 'drm-intel-next-2013-02-01' of git://
&gt; people.freedesktop.org/~danvet/drm-intel into drm-next
&gt; git bisect good cd17ef4114ad5c514b17e6a0bb02a309ab90b692
&gt; # good: [210561ffd72d00eccf12c0131b8024d5436bae95] intel/iommu: force
&gt; writebuffer-flush quirk on Gen 4 Chipsets
&gt; git bisect good 210561ffd72d00eccf12c0131b8024d5436bae95
&gt; # good: [0f0800661a125ddb038462570c869fe6f8ab5737] drm/nouveau/gpio: pass
&gt; number of on-die gpio lines to base
&gt; git bisect good 0f0800661a125ddb038462570c869fe6f8ab5737
&gt; # good: [35f8badc1cf652381fa3f82c1fbea39f4dbe87fd] drm: Don't set the
&gt; plane-&gt;fb to NULL on successfull set_plane
&gt; git bisect good 35f8badc1cf652381fa3f82c1fbea39f4dbe87fd
&gt; # good: [31a34aa421032cfe3b2b892c929e7539e747a7ac] drm/nouveau/i2c: aux
&gt; channels not necessarily on nvio
&gt; git bisect good 31a34aa421032cfe3b2b892c929e7539e747a7ac
&gt; # bad: [0a0afd282fd715dd63d64b243299a64da14f8e8d] drm/nv50-/disp: move DP
&gt; link training to core and train from supervisor
&gt; git bisect bad 0a0afd282fd715dd63d64b243299a64da14f8e8d
&gt; # good: [ac8cc241a81941932da44993242e68c62e115ec7] drm/nv50/devinit:
&gt; reverse the logic for running encoder init scripts
&gt; git bisect good ac8cc241a81941932da44993242e68c62e115ec7
&gt; # good: [7dcd060c0e6e4f76ce7eea94c66437ce8f546530] drm/nouveau/i2c: create
&gt; proper chipset-specific class implementations
&gt; git bisect good 7dcd060c0e6e4f76ce7eea94c66437ce8f546530
&gt; # good: [5cc027f6b1ec651c18a4322ed3e30c6e9cf01e96] drm/nv50-/disp: handle
&gt; supervisor tasks from workqueue
&gt; git bisect good 5cc027f6b1ec651c18a4322ed3e30c6e9cf01e96
&gt; # first bad commit: [0a0afd282fd715dd63d64b243299a64da14f8e8d]
&gt; drm/nv50-/disp: move DP link training to core and train from supervisor
&gt; 
&gt; 
&gt; 
&gt; 
&gt; 0a0afd282fd715dd63d64b243299a64da14f8e8d is the first bad commit
&gt; commit 0a0afd282fd715dd63d64b243299a64da14f8e8d
&gt; Author: Ben Skeggs &lt;<a href="mailto:bskeggs&#64;redhat.com">bskeggs&#64;redhat.com</a>&gt;
&gt; Date:   Mon Feb 18 23:17:53 2013 -0500
&gt; 
&gt;     drm/nv50-/disp: move DP link training to core and train from supervisor
&gt; 
&gt;     We need to be able to do link training for PIOR-connected ANX9805 from
&gt;     the third supervisor handler (due to script ordering in the bios, can't
&gt;     have the &quot;user&quot; call train because some settings are overwritten from
&gt;     the modesetting bios scripts).
&gt; 
&gt;     This moves link training for SOR-connected DP encoders to the second
&gt;     supervisor interrupt, *before* we call the modesetting scripts (yes,
&gt;     different ordering from PIOR is necessary).  This is useful since we
&gt;     should now be able to remove some hacks to workaround races between
&gt;     the supervisor and link training paths.
&gt; 
&gt;     Signed-off-by: Ben Skeggs &lt;<a href="mailto:bskeggs&#64;redhat.com">bskeggs&#64;redhat.com</a>&gt;
&gt; 
&gt; :040000 040000 8f2f2d8ea35eae1b6e6ff981761be02a8818bac3
&gt; 2994eb54c689056254c241fe78a3af8d0b61d1df M    drivers</span ></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1396657247.81382.3495--

--===============0567055728==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0567055728==--
