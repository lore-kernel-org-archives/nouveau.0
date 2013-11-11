From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 71484] New: [NVAA] random graphical corruption with
 vlc on 3.12 (and earlier)
Date: Mon, 11 Nov 2013 11:07:31 +0000
Message-ID: <bug-71484-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2034188594=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


--===============2034188594==
Content-Type: multipart/alternative; boundary="1384168051.deAeaA1.9765"; charset="us-ascii"


--1384168051.deAeaA1.9765
Date: Mon, 11 Nov 2013 11:07:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=71484

          Priority: medium
            Bug ID: 71484
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [NVAA] random graphical corruption with vlc  on 3.12
                    (and earlier)
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

Created attachment 89014
  --> https://bugs.freedesktop.org/attachment.cgi?id=89014&action=edit
dmesg of 3.12 booting ; vlc running with "bad settings" and error occuring

Steps to reproduce:
- vlc with overlay + automatic output enabled (xv output)
- play video
- after a (random?) time - screen gets corrupted
- after exiting vlc /waiting screen gets normal again

Graphical corruption doesnt occur with X11 output selection 
(or i did not observe a case of that yet)

System: Linux Mint 15

Hardware: 
- Dual Monitor Setup VGA+DVI
- Geforce 8200 (Onboard; Jetway JNC62K)
nouveau  [  DEVICE][0000:02:00.0] Chipset: MCP77/MCP78 (NVAA)
nouveau  [  DEVICE][0000:02:00.0] Family : NV50

Versions:
Kernel: 3.12.0 (vanilla), 3.8.0- (Mint Kernel)
libdrm-nouveau2: 2.4.46+git20130910.58d00888-0ubuntu0sarvatt~raring
(xorg-edgers ppa)
xorg-server:
1.13.4~git20130508+server-1.13-branch.10c42f57-0ubuntu0ricotz~raring
(xorg-edgers ppa)
xserver-xorg-video-nouveau : :
1.0.9+git20130730.300c5a32-0ubuntu0sarvatt~raring (xorg-edgers ppa)
vlc: 2.2.0~~git20131104+r3123-0~r114+113~ubuntu13.04.1 (ppa)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1384168051.deAeaA1.9765
Date: Mon, 11 Nov 2013 11:07:31 +0000
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
   title="NEW --- - [NVAA] random graphical corruption with vlc on 3.12 (and earlier)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71484">71484</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NVAA] random graphical corruption with vlc  on 3.12 (and earlier)
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
        <pre>Created <span class=""><a href="attachment.cgi?id=89014" name="attach_89014" title="dmesg of 3.12 booting ; vlc running with &quot;bad settings&quot; and error occuring">attachment 89014</a> <a href="attachment.cgi?id=89014&amp;action=edit" title="dmesg of 3.12 booting ; vlc running with &quot;bad settings&quot; and error occuring">[details]</a></span>
dmesg of 3.12 booting ; vlc running with &quot;bad settings&quot; and error occuring

Steps to reproduce:
- vlc with overlay + automatic output enabled (xv output)
- play video
- after a (random?) time - screen gets corrupted
- after exiting vlc /waiting screen gets normal again

Graphical corruption doesnt occur with X11 output selection 
(or i did not observe a case of that yet)

System: Linux Mint 15

Hardware: 
- Dual Monitor Setup VGA+DVI
- Geforce 8200 (Onboard; Jetway JNC62K)
nouveau  [  DEVICE][0000:02:00.0] Chipset: MCP77/MCP78 (NVAA)
nouveau  [  DEVICE][0000:02:00.0] Family : NV50

Versions:
Kernel: 3.12.0 (vanilla), 3.8.0- (Mint Kernel)
libdrm-nouveau2: 2.4.46+git20130910.58d00888-0ubuntu0sarvatt~raring
(xorg-edgers ppa)
xorg-server:
1.13.4~git20130508+server-1.13-branch.10c42f57-0ubuntu0ricotz~raring
(xorg-edgers ppa)
xserver-xorg-video-nouveau : :
1.0.9+git20130730.300c5a32-0ubuntu0sarvatt~raring (xorg-edgers ppa)
vlc: 2.2.0~~git20131104+r3123-0~r114+113~ubuntu13.04.1 (ppa)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1384168051.deAeaA1.9765--

--===============2034188594==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2034188594==--
