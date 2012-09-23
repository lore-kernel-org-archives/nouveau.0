From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 55258] New: nouveau failure on resume (reloc
	wait_idle failed)
Date: Sun, 23 Sep 2012 21:30:28 +0000
Message-ID: <bug-55258-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1622435530=="
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


--===============1622435530==
Content-Type: multipart/alternative; boundary="1348435828.e8Ff1.17663"; charset="us-ascii"


--1348435828.e8Ff1.17663
Date: Sun, 23 Sep 2012 21:30:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=55258

          Priority: medium
            Bug ID: 55258
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: nouveau failure on resume (reloc wait_idle failed)
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: All
          Reporter: mr.dash.four-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

When I resume from hibernate, I get the following error after which the whole
system either grinds to a halt or I am forced to log in and then the system
crashes:

kernel: [drm] nouveau 0000:01:00.0: reloc wait_idle failed: -16
kernel: [drm] nouveau 0000:01:00.0: reloc apply: -16
kernel: [drm] nouveau 0000:01:00.0: reloc wait_idle failed: -16
kernel: [drm] nouveau 0000:01:00.0: reloc apply: -16
kernel: [drm] nouveau 0000:01:00.0: reloc wait_idle failed: -16
kernel: [drm] nouveau 0000:01:00.0: reloc apply: -16
kernel: [drm] nouveau 0000:01:00.0: reloc wait_idle failed: -16
kernel: [drm] nouveau 0000:01:00.0: reloc apply: -16

Here is some information on my card you may find useful:

kernel: [drm] nouveau 0000:01:00.0: Detected an NV40 generation card
(0x049200a2)
kernel: [drm] nouveau 0000:01:00.0: Checking PRAMIN for VBIOS
kernel: [drm] nouveau 0000:01:00.0: ... BIOS checksum invalid
kernel: [drm] nouveau 0000:01:00.0: Checking PROM for VBIOS
kernel: [drm] nouveau 0000:01:00.0: ... appears to be valid
kernel: [drm] nouveau 0000:01:00.0: Using VBIOS from PROM
kernel: [drm] nouveau 0000:01:00.0: BIT BIOS found
kernel: [drm] nouveau 0000:01:00.0: Bios version 05.71.22.21
kernel: [drm] nouveau 0000:01:00.0: TMDS table version 1.1
kernel: [drm] nouveau 0000:01:00.0: TMDS table script pointers not stubbed
kernel: [drm] nouveau 0000:01:00.0: MXM: no VBIOS data, nothing to do
kernel: [drm] nouveau 0000:01:00.0: DCB version 3.0

The above error happens every 2nd time I resume from hibernate - without fail,
like a clockwork. The first time the resume is OK - no problems. The second
time resume always fails with the above error.

The nouveau version is 1.0.0 20120316.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1348435828.e8Ff1.17663
Date: Sun, 23 Sep 2012 21:30:28 +0000
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
   title="NEW --- - nouveau failure on resume (reloc wait_idle failed)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=55258">55258</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>nouveau failure on resume (reloc wait_idle failed)
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
          <td>All
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>mr.dash.four&#64;googlemail.com
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
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
        <pre>When I resume from hibernate, I get the following error after which the whole
system either grinds to a halt or I am forced to log in and then the system
crashes:

kernel: [drm] nouveau 0000:01:00.0: reloc wait_idle failed: -16
kernel: [drm] nouveau 0000:01:00.0: reloc apply: -16
kernel: [drm] nouveau 0000:01:00.0: reloc wait_idle failed: -16
kernel: [drm] nouveau 0000:01:00.0: reloc apply: -16
kernel: [drm] nouveau 0000:01:00.0: reloc wait_idle failed: -16
kernel: [drm] nouveau 0000:01:00.0: reloc apply: -16
kernel: [drm] nouveau 0000:01:00.0: reloc wait_idle failed: -16
kernel: [drm] nouveau 0000:01:00.0: reloc apply: -16

Here is some information on my card you may find useful:

kernel: [drm] nouveau 0000:01:00.0: Detected an NV40 generation card
(0x049200a2)
kernel: [drm] nouveau 0000:01:00.0: Checking PRAMIN for VBIOS
kernel: [drm] nouveau 0000:01:00.0: ... BIOS checksum invalid
kernel: [drm] nouveau 0000:01:00.0: Checking PROM for VBIOS
kernel: [drm] nouveau 0000:01:00.0: ... appears to be valid
kernel: [drm] nouveau 0000:01:00.0: Using VBIOS from PROM
kernel: [drm] nouveau 0000:01:00.0: BIT BIOS found
kernel: [drm] nouveau 0000:01:00.0: Bios version 05.71.22.21
kernel: [drm] nouveau 0000:01:00.0: TMDS table version 1.1
kernel: [drm] nouveau 0000:01:00.0: TMDS table script pointers not stubbed
kernel: [drm] nouveau 0000:01:00.0: MXM: no VBIOS data, nothing to do
kernel: [drm] nouveau 0000:01:00.0: DCB version 3.0

The above error happens every 2nd time I resume from hibernate - without fail,
like a clockwork. The first time the resume is OK - no problems. The second
time resume always fails with the above error.

The nouveau version is 1.0.0 20120316.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1348435828.e8Ff1.17663--

--===============1622435530==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1622435530==--
