From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 95109] New: multiple instances of buffer 186 on
	validation list
Date: Sun, 24 Apr 2016 19:20:52 +0000
Message-ID: <bug-95109-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1673623488=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1673623488==
Content-Type: multipart/alternative; boundary="14615256521.99eEd.32052";
 charset="UTF-8"


--14615256521.99eEd.32052
Date: Sun, 24 Apr 2016 19:20:52 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=95109

            Bug ID: 95109
           Summary: multiple instances of buffer 186 on validation list
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: chernoff-ULsX4lnO78sEpyuynnnIqodd74u8MsAO@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

OS:

Linux localhost.localdomain 4.1.13-100.fc21.x86_64 #1 SMP Tue Nov 10 13:13:20
UTC 2015 x86_64 x86_64 x86_64 GNU/Linux

Two mirrored screens: ASUS laptop screen and Viewsonic VP2650wb 

Graphics card: NVIDIA Corporation G96M [GeForce 9650M GT] (rev a1)

System locks up with
kernel: nouveau E[gnome-shell[2035]] multiple instances of buffer 186 on
validation list
kernel: nouveau E[gnome-shell[2035]] validate_init
kernel: nouveau E[gnome-shell[2035]] validate: -22
gnome-session[1905]: nouveau: kernel rejected pushbuf: Invalid argument

followed by a dump of ch0: buf data (I can include if useful)

and then many messages of the form

kernel: nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 0 - RT_FAULT - Address
00465f0000
kernel: nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 0 - e0c: 00000000,
e18: 00000000, e1c: 00000000, e20: 00002a00, e24: 00030000
kernel: nouveau E[  PGRAPH][0000:01:00.0] ch 4 [0x003fc2a000 gnome-shell[2035]]
subc 3 class 0x8297 mthd 0x15e0 data 0x00000000
kernel: nouveau E[     PFB][0000:01:00.0] trapped write at 0x00465f0000 on
channel 0x0003fc2a [gnome-shell[2035]] PGRAPH/PROP/RT0 reason: 

Gnome pointer is alive, no window buttons function. After about 2 minutes the
system returns to normal.

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14615256521.99eEd.32052
Date: Sun, 24 Apr 2016 19:20:52 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - multiple instances of buffer 186 on validation list"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=95109">95109</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>multiple instances of buffer 186 on validation list
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>chernoff&#64;astro.cornell.edu
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>OS:

Linux localhost.localdomain 4.1.13-100.fc21.x86_64 #1 SMP Tue Nov 10 13:13:20
UTC 2015 x86_64 x86_64 x86_64 GNU/Linux

Two mirrored screens: ASUS laptop screen and Viewsonic VP2650wb 

Graphics card: NVIDIA Corporation G96M [GeForce 9650M GT] (rev a1)

System locks up with
kernel: nouveau E[gnome-shell[2035]] multiple instances of buffer 186 on
validation list
kernel: nouveau E[gnome-shell[2035]] validate_init
kernel: nouveau E[gnome-shell[2035]] validate: -22
gnome-session[1905]: nouveau: kernel rejected pushbuf: Invalid argument

followed by a dump of ch0: buf data (I can include if useful)

and then many messages of the form

kernel: nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 0 - RT_FAULT - Address
00465f0000
kernel: nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 0 - e0c: 00000000,
e18: 00000000, e1c: 00000000, e20: 00002a00, e24: 00030000
kernel: nouveau E[  PGRAPH][0000:01:00.0] ch 4 [0x003fc2a000 gnome-shell[2035]]
subc 3 class 0x8297 mthd 0x15e0 data 0x00000000
kernel: nouveau E[     PFB][0000:01:00.0] trapped write at 0x00465f0000 on
channel 0x0003fc2a [gnome-shell[2035]] PGRAPH/PROP/RT0 reason: 

Gnome pointer is alive, no window buttons function. After about 2 minutes the
system returns to normal.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14615256521.99eEd.32052--

--===============1673623488==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1673623488==--
