From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 59168] New: [nvc3/Quadro2000M] graphic
 garbage/corruption/noise on resume
Date: Wed, 09 Jan 2013 14:36:39 +0000
Message-ID: <bug-59168-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0197042497=="
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


--===============0197042497==
Content-Type: multipart/alternative; boundary="1357742200.4F4A00A1.23329"; charset="us-ascii"


--1357742200.4F4A00A1.23329
Date: Wed, 9 Jan 2013 14:36:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=59168

          Priority: medium
            Bug ID: 59168
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [nvc3/Quadro2000M] graphic garbage/corruption/noise on
                    resume
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: major
    Classification: Unclassified
                OS: Linux (All)
          Reporter: michael.weirauch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: git
         Component: Driver/nouveau
           Product: xorg

Created attachment 72725
  --> https://bugs.freedesktop.org/attachment.cgi?id=72725&action=edit
dmesg 3.8.0-rc2 gdm resume garbage/noise nvc3 nouveau.debug=trace

As follow up to bug 50121:

Steps to reproduce:
* suspend from gdm
* resume shows total garbage/noise in gdm login screen
* mouse cursor visible and movable (machine seems not under load)
* switching to tty1 possible
* switching to gdm possible (still noise)
* restarting X freezes machine (hard reboot required)

Side Notes:
* I should note that an experimental "nouveau.config=DEVINIT=NvForcePost=1"
leaves me with a black screen on boot. (no plymouth)
  (Dunno if related. If so, I can upload a dmesg as well.)
* A perhaps related issue (if not related to nouveau driver) from the Radeon
driver is bug 57774 showing a similar garbage/noise on resume.

Setup:
ThinkPad W520 4276CTO NVC3 (2000M)
openSUSE 12.2 + updated gnome3.6/xorg/mesa/xorg/xf86-video-nouveau
$ zypper search -si --match-exact xorg-x11-driver-video-nouveau xorg-x11-server
Mesa libdrm_nouveau2 kernel
S | Name                          | Typ   | Version                          |
Arch   
--+-------------------------------+-------+----------------------------------+--------
i | Mesa                          | Paket | 9.0.1-202.2                      |
x86_64 
i | kernel                        | Paket | 3.8.0_rc2_1_desktop_nouveau01+-1 |
x86_64 
i | libdrm_nouveau2               | Paket | 2.4.40-99.1                      |
x86_64 
i | xorg-x11-driver-video-nouveau | Paket | 1.0.6-58.1                       |
x86_64 
i | xorg-x11-server               | Paket | 7.6_1.13.1-215.1                 |
x86_64 

dmesg-excerpt on resume:
nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 3 [0x007fd18000 gnome-shell[1396]]
nouveau E[  PGRAPH][0000:01:00.0] GPC0/TPC3/MP: 0x001beff2 0x0000000f
nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 3 [0x007fd18000 gnome-shell[1396]]
nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa204021e
nouveau E[   PFIFO][0000:01:00.0] write fault at 0x00005a0000
[PAGE_NOT_PRESENT] from PGRAPH/(unknown enum 0x00000010) on channel
0x007fd18000 [gnome-shell[1396]]

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1357742200.4F4A00A1.23329
Date: Wed, 9 Jan 2013 14:36:40 +0000
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
   title="NEW --- - [nvc3/Quadro2000M] graphic garbage/corruption/noise on resume"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59168">59168</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[nvc3/Quadro2000M] graphic garbage/corruption/noise on resume
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>major
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
          <td>michael.weirauch&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>git
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
        <pre>Created <span class=""><a href="attachment.cgi?id=72725" name="attach_72725" title="dmesg 3.8.0-rc2 gdm resume garbage/noise nvc3 nouveau.debug=trace">attachment 72725</a> <a href="attachment.cgi?id=72725&amp;action=edit" title="dmesg 3.8.0-rc2 gdm resume garbage/noise nvc3 nouveau.debug=trace">[details]</a></span>
dmesg 3.8.0-rc2 gdm resume garbage/noise nvc3 nouveau.debug=trace

As follow up to <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [Regression] Since kernel v3.5 several cards fail to resume, introduced by: 'convert to exec engine, and improve channel sync'"
   href="show_bug.cgi?id=50121">bug 50121</a>:

Steps to reproduce:
* suspend from gdm
* resume shows total garbage/noise in gdm login screen
* mouse cursor visible and movable (machine seems not under load)
* switching to tty1 possible
* switching to gdm possible (still noise)
* restarting X freezes machine (hard reboot required)

Side Notes:
* I should note that an experimental &quot;nouveau.config=DEVINIT=NvForcePost=1&quot;
leaves me with a black screen on boot. (no plymouth)
  (Dunno if related. If so, I can upload a dmesg as well.)
* A perhaps related issue (if not related to nouveau driver) from the Radeon
driver is <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Graphic corruption on resume from hibernation"
   href="show_bug.cgi?id=57774">bug 57774</a> showing a similar garbage/noise on resume.

Setup:
ThinkPad W520 4276CTO NVC3 (2000M)
openSUSE 12.2 + updated gnome3.6/xorg/mesa/xorg/xf86-video-nouveau
$ zypper search -si --match-exact xorg-x11-driver-video-nouveau xorg-x11-server
Mesa libdrm_nouveau2 kernel
S | Name                          | Typ   | Version                          |
Arch   
--+-------------------------------+-------+----------------------------------+--------
i | Mesa                          | Paket | 9.0.1-202.2                      |
x86_64 
i | kernel                        | Paket | 3.8.0_rc2_1_desktop_nouveau01+-1 |
x86_64 
i | libdrm_nouveau2               | Paket | 2.4.40-99.1                      |
x86_64 
i | xorg-x11-driver-video-nouveau | Paket | 1.0.6-58.1                       |
x86_64 
i | xorg-x11-server               | Paket | 7.6_1.13.1-215.1                 |
x86_64 

dmesg-excerpt on resume:
nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 3 [0x007fd18000 gnome-shell[1396]]
nouveau E[  PGRAPH][0000:01:00.0] GPC0/TPC3/MP: 0x001beff2 0x0000000f
nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 3 [0x007fd18000 gnome-shell[1396]]
nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa204021e
nouveau E[   PFIFO][0000:01:00.0] write fault at 0x00005a0000
[PAGE_NOT_PRESENT] from PGRAPH/(unknown enum 0x00000010) on channel
0x007fd18000 [gnome-shell[1396]]</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1357742200.4F4A00A1.23329--

--===============0197042497==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0197042497==--
