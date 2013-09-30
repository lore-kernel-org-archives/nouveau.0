From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69952] New: [NVAA] Xorg crash+restart after glxgears
 on 3.12-rc2
Date: Mon, 30 Sep 2013 09:47:29 +0000
Message-ID: <bug-69952-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1625390630=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


--===============1625390630==
Content-Type: multipart/alternative; boundary="1380534450.fa8d4311.15587"; charset="us-ascii"


--1380534450.fa8d4311.15587
Date: Mon, 30 Sep 2013 09:47:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69952

          Priority: medium
            Bug ID: 69952
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [NVAA] Xorg crash+restart after glxgears on 3.12-rc2
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: dirkneukirchen-S0/GAf8tV78@public.gmane.org
          Hardware: x86 (IA32)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 86837
  --> https://bugs.freedesktop.org/attachment.cgi?id=86837&action=edit
3.12-rc2 Xorg crash when running glxgears

How to replicate:
- booting and doing random desktop stuff

- 1st errors in log: TRAP_TPDMA_2D
thats "normal"/possibly dangerous too:
occured with playing video: mplayer -vo xv -ao sdl 
mplayer: MPlayer svn r34540 (Ubuntu), built with gcc-4.7 (C) 2000-2012 MPlayer
Team


later Crash in log:
- open glxgears on 1st virtual desktop
- switch to 4th virtual desktop 
- open rdesktop program
- xorg is nonresponsive - try keyboard shortcuts to change desktop (dont work)
- wait until Xorg is restarted 

System:
-Linux Mint 15 (Ubuntu 13.04)
-NVAA (Geforce 8200) onboard (Jetway JNC62K)
-dual monitor setup

-Kernel 3.12-rc2

The attached dmesg contains several error messages that are missing from 68037
or are added compared to 69387.
It could be the same "bug"/"bugs" that are described in 68037.
Accel. Video often freeze, stability is increased when playing with x11(without
overlay) in vlc or mplayer. But that might be subjective.

possibly related:
https://bugs.freedesktop.org/show_bug.cgi?id=68037 (same setup from me)
https://bugs.freedesktop.org/show_bug.cgi?id=69387

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1380534450.fa8d4311.15587
Date: Mon, 30 Sep 2013 09:47:30 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVAA] Xorg crash+restart after glxgears on 3.12-rc2"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69952">69952</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NVAA] Xorg crash+restart after glxgears on 3.12-rc2
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Classification</th>
          <td>Unclassified
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>dirkneukirchen&#64;web.de
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86 (IA32)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=86837" name="attach_86837" title="3.12-rc2 Xorg crash when running glxgears">attachment 86837</a> <a href="attachment.cgi?id=86837&amp;action=edit" title="3.12-rc2 Xorg crash when running glxgears">[details]</a></span>
3.12-rc2 Xorg crash when running glxgears

How to replicate:
- booting and doing random desktop stuff

- 1st errors in log: TRAP_TPDMA_2D
thats &quot;normal&quot;/possibly dangerous too:
occured with playing video: mplayer -vo xv -ao sdl 
mplayer: MPlayer svn r34540 (Ubuntu), built with gcc-4.7 (C) 2000-2012 MPlayer
Team


later Crash in log:
- open glxgears on 1st virtual desktop
- switch to 4th virtual desktop 
- open rdesktop program
- xorg is nonresponsive - try keyboard shortcuts to change desktop (dont work)
- wait until Xorg is restarted 

System:
-Linux Mint 15 (Ubuntu 13.04)
-NVAA (Geforce 8200) onboard (Jetway JNC62K)
-dual monitor setup

-Kernel 3.12-rc2

The attached dmesg contains several error messages that are missing from 68037
or are added compared to 69387.
It could be the same &quot;bug&quot;/&quot;bugs&quot; that are described in 68037.
Accel. Video often freeze, stability is increased when playing with x11(without
overlay) in vlc or mplayer. But that might be subjective.

possibly related:
<a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - TRAP_TPDMA - TP0: Unhandled ustatus 0x00000008 ; and other NV50 log spam errors"
   href="show_bug.cgi?id=68037">https://bugs.freedesktop.org/show_bug.cgi?id=68037</a> (same setup from me)
<a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - X hangs on resume/monitor blank with nv50cal_space: -16"
   href="show_bug.cgi?id=69387">https://bugs.freedesktop.org/show_bug.cgi?id=69387</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1380534450.fa8d4311.15587--

--===============1625390630==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1625390630==--
