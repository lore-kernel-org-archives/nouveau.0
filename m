From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 112123] New: Laptop freezes after suspend [write
 fault]
Date: Thu, 24 Oct 2019 20:34:18 +0000
Message-ID: <bug-112123-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0762643960=="
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


--===============0762643960==
Content-Type: multipart/alternative; boundary="15719492580.BF0C30.28029"
Content-Transfer-Encoding: 7bit


--15719492580.BF0C30.28029
Date: Thu, 24 Oct 2019 20:34:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D112123

            Bug ID: 112123
           Summary: Laptop freezes after suspend [write fault]
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: critical
          Priority: not set
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: sandy97-XwF44lLxpnSSrlBSqq5r4w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 145812
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145812&action=3Dedit
A part of journalctl, describing process of crash

Description:
When I suspend (close) my laptop and then try to wake it up, it freezes;
everything is displayed, however, inputs stop reacting and everything on sc=
reen
stops moving too. It happens only with GUIs - when I suspend it while in
terminal, it works fine (when I go back to GUI it switches and then freezes,
sadly).
According to journal, this is because of Nouveau having trouble with memory
read:

pa=C5=BA 24 13:43:31 Langley kernel: [drm] Initialized nouveau 1.3.1 201208=
01 for
0000:01:00.0 on minor 0
pa=C5=BA 24 21:42:32 Langley kernel: nouveau 0000:01:00.0: fifo: write faul=
t at
0000048000 engine 07 [PFIFO] client 07 [BAR_READ] reason 02 [PAGE_NOT_PRESE=
NT]
on channel 2 [003fc13000 Xorg[538]]
pa=C5=BA 24 21:42:32 Langley kernel: nouveau 0000:01:00.0: fifo: fifo engin=
e fault
on channel 2, recovering...
(don't mind Polish month)

Usually, keyboard works just for a few seconds (Caps/Num Lock LEDs react),
touchpad doesn't. I don't think the whole system crashes, I believe it's st=
ill
working but is blocked by unresponsive driver.

I believe that if I wait 10 minutes or so, it actually may start working ag=
ain;
however, reboot is faster in this case.

If I just let my laptop be, so it suspends while open, it wakes up perfectl=
y.

Specs:
Distribution: Arch
Kernel: 5.3.7-arch1-1-ARCH (tested mainline 5.4.0-rc4, bug still occurs; al=
so
occurs on other, older kernels; didn't test other distros)
Laptop: Sony Vaio, model VPCEH2D1E C1065BHW=20
GPU: GeForce 410M

Steps to reproduce:
1. Close the laptop so it goes to sleep
2. Open it and press something
Since I couldn't find anyone else with this same error, I suppose you need
similar/same model, graphic card or configuration (Sony Vaio with 410M etc).

I am attaching a part of journalctl (starts at lid closing).

Also, I was instructed to report the bug here at the Arch bug list, where I
first described the bug.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15719492580.BF0C30.28029
Date: Thu, 24 Oct 2019 20:34:18 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Laptop freezes after suspend [write fault]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112123">112123</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Laptop freezes after suspend [write fault]
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
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>critical
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>not set
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
          <td>sandy97&#64;buziaczek.pl
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145812=
" name=3D"attach_145812" title=3D"A part of journalctl, describing process =
of crash">attachment 145812</a> <a href=3D"attachment.cgi?id=3D145812&amp;a=
ction=3Dedit" title=3D"A part of journalctl, describing process of crash">[=
details]</a></span>
A part of journalctl, describing process of crash

Description:
When I suspend (close) my laptop and then try to wake it up, it freezes;
everything is displayed, however, inputs stop reacting and everything on sc=
reen
stops moving too. It happens only with GUIs - when I suspend it while in
terminal, it works fine (when I go back to GUI it switches and then freezes,
sadly).
According to journal, this is because of Nouveau having trouble with memory
read:

pa=C5=BA 24 13:43:31 Langley kernel: [drm] Initialized nouveau 1.3.1 201208=
01 for
0000:01:00.0 on minor 0
pa=C5=BA 24 21:42:32 Langley kernel: nouveau 0000:01:00.0: fifo: write faul=
t at
0000048000 engine 07 [PFIFO] client 07 [BAR_READ] reason 02 [PAGE_NOT_PRESE=
NT]
on channel 2 [003fc13000 Xorg[538]]
pa=C5=BA 24 21:42:32 Langley kernel: nouveau 0000:01:00.0: fifo: fifo engin=
e fault
on channel 2, recovering...
(don't mind Polish month)

Usually, keyboard works just for a few seconds (Caps/Num Lock LEDs react),
touchpad doesn't. I don't think the whole system crashes, I believe it's st=
ill
working but is blocked by unresponsive driver.

I believe that if I wait 10 minutes or so, it actually may start working ag=
ain;
however, reboot is faster in this case.

If I just let my laptop be, so it suspends while open, it wakes up perfectl=
y.

Specs:
Distribution: Arch
Kernel: 5.3.7-arch1-1-ARCH (tested mainline 5.4.0-rc4, bug still occurs; al=
so
occurs on other, older kernels; didn't test other distros)
Laptop: Sony Vaio, model VPCEH2D1E C1065BHW=20
GPU: GeForce 410M

Steps to reproduce:
1. Close the laptop so it goes to sleep
2. Open it and press something
Since I couldn't find anyone else with this same error, I suppose you need
similar/same model, graphic card or configuration (Sony Vaio with 410M etc).

I am attaching a part of journalctl (starts at lid closing).

Also, I was instructed to report the bug here at the Arch bug list, where I
first described the bug.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15719492580.BF0C30.28029--

--===============0762643960==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0762643960==--
