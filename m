From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69375] New: [NV4E] GPU lockup when using chrome/flash
Date: Sun, 15 Sep 2013 12:36:09 +0000
Message-ID: <bug-69375-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1708024949=="
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


--===============1708024949==
Content-Type: multipart/alternative; boundary="1379248569.85baa1.10087"; charset="us-ascii"


--1379248569.85baa1.10087
Date: Sun, 15 Sep 2013 12:36:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69375

          Priority: medium
            Bug ID: 69375
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [NV4E] GPU lockup when using chrome/flash
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: taylor_tails-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 85858
  --> https://bugs.freedesktop.org/attachment.cgi?id=85858&action=edit
dmesg output

I recent upgrade using apt-get dist-upgrade on debian testing ~2 weeks ago has
caused chrome to start looking up the GPU.

dmesg highlights:
Linux version 3.9-1-amd64

[  805.747928] nouveau E[  PGRAPH][0000:00:05.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[  805.747945] nouveau E[  PGRAPH][0000:00:05.0] ch 3 [0x00056000 chrome[3853]]
subc 2 class 0x0039 mthd 0x0314 data 0x01197000
[  836.696327] nouveau E[   PFIFO][0000:00:05.0] DMA_PUSHER - ch 3
[chrome[3853]] get 0xbeef0200 put 0x0065a6f4 state 0xc0028188 (err: MEM_FAULT)
push 0x00001000
[  850.504026] nouveau E[chrome[3853]] failed to idle channel 0xcccc0000
[chrome[3853]]
[  853.508018] nouveau E[chrome[3853]] failed to idle channel 0xcccc0000
[chrome[3853]]
[  863.804030] nouveau E[Xorg[2162]] reloc wait_idle failed: -16
[  863.804036] nouveau E[Xorg[2162]] reloc apply: -16
[  865.743035] nouveau E[     DRM] GPU lockup - switching to software fbcon
[  866.804032] nouveau E[Xorg[2162]] reloc wait_idle failed: -16
[  866.804079] nouveau E[Xorg[2162]] reloc apply: -16
[  869.804037] nouveau E[Xorg[2162]] reloc wait_idle failed: -16
[  869.804103] nouveau E[Xorg[2162]] reloc apply: -16
[  887.836034] nouveau E[Xorg[2162]] failed to idle channel 0xcccc0000
[Xorg[2162]]
[  890.836025] nouveau E[Xorg[2162]] failed to idle channel 0xcccc0000
[Xorg[2162]]

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1379248569.85baa1.10087
Date: Sun, 15 Sep 2013 12:36:09 +0000
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
   title="NEW --- - [NV4E] GPU lockup when using chrome/flash"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69375">69375</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NV4E] GPU lockup when using chrome/flash
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
          <td>taylor_tails&#64;hotmail.com
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
        <pre>Created <span class=""><a href="attachment.cgi?id=85858" name="attach_85858" title="dmesg output">attachment 85858</a> <a href="attachment.cgi?id=85858&amp;action=edit" title="dmesg output">[details]</a></span>
dmesg output

I recent upgrade using apt-get dist-upgrade on debian testing ~2 weeks ago has
caused chrome to start looking up the GPU.

dmesg highlights:
Linux version 3.9-1-amd64

[  805.747928] nouveau E[  PGRAPH][0000:00:05.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[  805.747945] nouveau E[  PGRAPH][0000:00:05.0] ch 3 [0x00056000 chrome[3853]]
subc 2 class 0x0039 mthd 0x0314 data 0x01197000
[  836.696327] nouveau E[   PFIFO][0000:00:05.0] DMA_PUSHER - ch 3
[chrome[3853]] get 0xbeef0200 put 0x0065a6f4 state 0xc0028188 (err: MEM_FAULT)
push 0x00001000
[  850.504026] nouveau E[chrome[3853]] failed to idle channel 0xcccc0000
[chrome[3853]]
[  853.508018] nouveau E[chrome[3853]] failed to idle channel 0xcccc0000
[chrome[3853]]
[  863.804030] nouveau E[Xorg[2162]] reloc wait_idle failed: -16
[  863.804036] nouveau E[Xorg[2162]] reloc apply: -16
[  865.743035] nouveau E[     DRM] GPU lockup - switching to software fbcon
[  866.804032] nouveau E[Xorg[2162]] reloc wait_idle failed: -16
[  866.804079] nouveau E[Xorg[2162]] reloc apply: -16
[  869.804037] nouveau E[Xorg[2162]] reloc wait_idle failed: -16
[  869.804103] nouveau E[Xorg[2162]] reloc apply: -16
[  887.836034] nouveau E[Xorg[2162]] failed to idle channel 0xcccc0000
[Xorg[2162]]
[  890.836025] nouveau E[Xorg[2162]] failed to idle channel 0xcccc0000
[Xorg[2162]]</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1379248569.85baa1.10087--

--===============1708024949==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1708024949==--
