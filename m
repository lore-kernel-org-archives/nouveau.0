From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 81072] New: GPU lockup after "read fault at
 0x0000039000 [PAGE_NOT_PRESENT]"
Date: Wed, 09 Jul 2014 01:06:30 +0000
Message-ID: <bug-81072-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0808337290=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


--===============0808337290==
Content-Type: multipart/alternative; boundary="1404867990.80621.8636"; charset="us-ascii"


--1404867990.80621.8636
Date: Wed, 9 Jul 2014 01:06:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=81072

          Priority: medium
            Bug ID: 81072
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: GPU lockup after "read fault at 0x0000039000
                    [PAGE_NOT_PRESENT]"
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: brian.campbell-vkTwNLR/h6Zl57MIdRCFDg@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: 7.7 (2011)
         Component: Driver/nouveau
           Product: xorg

Created attachment 102454
  --> https://bugs.freedesktop.org/attachment.cgi?id=102454&action=edit
Xorg log with crash

About once every couple of weeks, my display locks up. Sometimes I am able to
switch virtual terminals and reboot; sometimes after switching virtual
terminals, something tries to restart X and the display becomes completely
garbled and unusable. I can't reproduce this reliably, but it generally seems
to happen when I have a lot of windows open and am in the middle of doing
something like opening a new window or switching to the Gnome Shell overview.

I filed a bug with Debian a few months ago, haven't heard anything:
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=744166. Here are a few lines
excerpted from dmesg that seem to indicate when the problem started on that
crash (I forgot to save dmesg output from the most recent crash before
rebooting); the rest is included in the Debian bug report (sadly, appears not
to be complete; I'll increase my log buffer size and get a full log the next
time this happens). I've attached my Xorg.0.log.old from my most recent crash,
and the Xorg.log from the older crash is attached to the Debian bug report.

[112444.556301] nouveau E[   PFIFO][0000:01:00.0] read fault at 0x0000039000
[PAGE_NOT_PRESENT] from PCOPY0/PCOPY0 on channel 0x001fdb2000 [DRM]
[112475.742287] nouveau E[     DRM] GPU lockup - switching to software fbcon
[112490.737414] nouveau E[Xorg[1800]] failed to idle channel 0xcccc0001
[Xorg[1800]]
[112505.727471] nouveau E[Xorg[1800]] failed to idle channel 0xcccc0001
[Xorg[1800]]
[112507.726348] nouveau E[   PFIFO][0000:01:00.0] playlist update failed
[112522.716209] nouveau E[Xorg[1800]] failed to idle channel 0xcccc0000
[Xorg[1800]]
[112537.706272] nouveau E[Xorg[1800]] failed to idle channel 0xcccc0000
[Xorg[1800]]
[112539.707186] nouveau E[   PFIFO][0000:01:00.0] channel 2 [Xorg[1800]] kick
timeout
[112539.708006] nouveau W[   PFIFO][0000:01:00.0] INTR 0x00000100: 0x0000000d
[112541.706666] nouveau E[   PFIFO][0000:01:00.0] playlist update failed

Here are my current package versions:

libdrm-nouveau2: 2.4.54-1
xserver-xorg-video-nouveau: 1:1.0.10-1+b1
xorg: 1:7.7+7
linux-image-3.14-1-amd64: 3.14.7-1

If there's any other relevant information I can provide, let me know. I can't
reproduce this on demand, and I don't have a known good version to bisect from;
I switched from Mandriva running the proprietary drivers (which seemed to have
some problems of their own, causing substantial slowness), to Debian running
nouveau, and the problem has been happening occasionally ever since the switch.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1404867990.80621.8636
Date: Wed, 9 Jul 2014 01:06:30 +0000
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
   title="NEW --- - GPU lockup after &quot;read fault at 0x0000039000 [PAGE_NOT_PRESENT]&quot;"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=81072">81072</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>GPU lockup after &quot;read fault at 0x0000039000 [PAGE_NOT_PRESENT]&quot;
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
          <td>brian.campbell&#64;editshare.com
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
          <td>7.7 (2011)
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
        <pre>Created <span class=""><a href="attachment.cgi?id=102454" name="attach_102454" title="Xorg log with crash">attachment 102454</a> <a href="attachment.cgi?id=102454&amp;action=edit" title="Xorg log with crash">[details]</a></span>
Xorg log with crash

About once every couple of weeks, my display locks up. Sometimes I am able to
switch virtual terminals and reboot; sometimes after switching virtual
terminals, something tries to restart X and the display becomes completely
garbled and unusable. I can't reproduce this reliably, but it generally seems
to happen when I have a lot of windows open and am in the middle of doing
something like opening a new window or switching to the Gnome Shell overview.

I filed a bug with Debian a few months ago, haven't heard anything:
<a href="https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=744166">https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=744166</a>. Here are a few lines
excerpted from dmesg that seem to indicate when the problem started on that
crash (I forgot to save dmesg output from the most recent crash before
rebooting); the rest is included in the Debian bug report (sadly, appears not
to be complete; I'll increase my log buffer size and get a full log the next
time this happens). I've attached my Xorg.0.log.old from my most recent crash,
and the Xorg.log from the older crash is attached to the Debian bug report.

[112444.556301] nouveau E[   PFIFO][0000:01:00.0] read fault at 0x0000039000
[PAGE_NOT_PRESENT] from PCOPY0/PCOPY0 on channel 0x001fdb2000 [DRM]
[112475.742287] nouveau E[     DRM] GPU lockup - switching to software fbcon
[112490.737414] nouveau E[Xorg[1800]] failed to idle channel 0xcccc0001
[Xorg[1800]]
[112505.727471] nouveau E[Xorg[1800]] failed to idle channel 0xcccc0001
[Xorg[1800]]
[112507.726348] nouveau E[   PFIFO][0000:01:00.0] playlist update failed
[112522.716209] nouveau E[Xorg[1800]] failed to idle channel 0xcccc0000
[Xorg[1800]]
[112537.706272] nouveau E[Xorg[1800]] failed to idle channel 0xcccc0000
[Xorg[1800]]
[112539.707186] nouveau E[   PFIFO][0000:01:00.0] channel 2 [Xorg[1800]] kick
timeout
[112539.708006] nouveau W[   PFIFO][0000:01:00.0] INTR 0x00000100: 0x0000000d
[112541.706666] nouveau E[   PFIFO][0000:01:00.0] playlist update failed

Here are my current package versions:

libdrm-nouveau2: 2.4.54-1
xserver-xorg-video-nouveau: 1:1.0.10-1+b1
xorg: 1:7.7+7
linux-image-3.14-1-amd64: 3.14.7-1

If there's any other relevant information I can provide, let me know. I can't
reproduce this on demand, and I don't have a known good version to bisect from;
I switched from Mandriva running the proprietary drivers (which seemed to have
some problems of their own, causing substantial slowness), to Debian running
nouveau, and the problem has been happening occasionally ever since the switch.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1404867990.80621.8636--

--===============0808337290==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0808337290==--
