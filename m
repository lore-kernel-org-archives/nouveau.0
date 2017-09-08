From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 102631] New: Multiple nouveau stacks on kernel log
 when connecting a external monitor
Date: Fri, 08 Sep 2017 23:20:05 +0000
Message-ID: <bug-102631-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1634130484=="
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


--===============1634130484==
Content-Type: multipart/alternative; boundary="15049128050.c05c25Dbc.23829";
 charset="UTF-8"


--15049128050.c05c25Dbc.23829
Date: Fri, 8 Sep 2017 23:20:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D102631

            Bug ID: 102631
           Summary: Multiple nouveau stacks on kernel log when connecting
                    a external monitor
           Product: Mesa
           Version: 17.1
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: emilio-pwgiZpOOZhphl2p70BpVqQ@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Created attachment 134100
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D134100&action=3Dedit
relevant dmesg output

Sorry for the non-descriptive bug title in advance, I'm not sure which part=
s of
the logs are worth a bug report, but I'm moderately sure that something in =
here
deserves a bug filed.

My machine is a Lenovo P50 with:

    VGA compatible controller: NVIDIA Corporation GM107GLM [Quadro M2000M] =
(rev
a2)

And mesa version 17.1.8

I connected an external monitor to the HDMI port, and I got black screens f=
or a
few retries.

On an unrelated (maybe not so unrelated?) note, I get reproducible FAULTs on
startup, regardless of any monitor attached or not I believe. I also got so=
me
others on today's log, but that may be just related to the problem above. T=
he
first two lines below repro even without an external monitor:

    [    2.690083] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at
022554 [ IBUS ]
    [    2.691514] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at
10ac08 [ IBUS ]
    [   23.396822] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at
690000 [ TIMEOUT ]
    [   41.791019] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at
690000 [ TIMEOUT ]
    [   41.791902] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at
6900c0 [ TIMEOUT ]
    [   51.876682] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at
690000 [ TIMEOUT ]
    [   61.915247] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at
690000 [ TIMEOUT ]
    [   75.297725] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at
690000 [ TIMEOUT ]

Happy to help providing more information, testing, or even trying to contri=
bute
a fix (with some guidance ideally, since I know nothing about the driver's =
code
:P).

Thanks a lot in advance.

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--15049128050.c05c25Dbc.23829
Date: Fri, 8 Sep 2017 23:20:05 +0000
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
   title=3D"NEW - Multiple nouveau stacks on kernel log when connecting a e=
xternal monitor"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102631">102631</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Multiple nouveau stacks on kernel log when connecting a exter=
nal monitor
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>17.1
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
          <td>Drivers/DRI/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>emilio&#64;crisal.io
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D134100=
" name=3D"attach_134100" title=3D"relevant dmesg output">attachment 134100<=
/a> <a href=3D"attachment.cgi?id=3D134100&amp;action=3Dedit" title=3D"relev=
ant dmesg output">[details]</a></span>
relevant dmesg output

Sorry for the non-descriptive bug title in advance, I'm not sure which part=
s of
the logs are worth a bug report, but I'm moderately sure that something in =
here
deserves a bug filed.

My machine is a Lenovo P50 with:

    VGA compatible controller: NVIDIA Corporation GM107GLM [Quadro M2000M] =
(rev
a2)

And mesa version 17.1.8

I connected an external monitor to the HDMI port, and I got black screens f=
or a
few retries.

On an unrelated (maybe not so unrelated?) note, I get reproducible FAULTs on
startup, regardless of any monitor attached or not I believe. I also got so=
me
others on today's log, but that may be just related to the problem above. T=
he
first two lines below repro even without an external monitor:

    [    2.690083] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at
022554 [ IBUS ]
    [    2.691514] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at
10ac08 [ IBUS ]
    [   23.396822] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at
690000 [ TIMEOUT ]
    [   41.791019] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at
690000 [ TIMEOUT ]
    [   41.791902] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at
6900c0 [ TIMEOUT ]
    [   51.876682] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at
690000 [ TIMEOUT ]
    [   61.915247] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at
690000 [ TIMEOUT ]
    [   75.297725] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at
690000 [ TIMEOUT ]

Happy to help providing more information, testing, or even trying to contri=
bute
a fix (with some guidance ideally, since I know nothing about the driver's =
code
:P).

Thanks a lot in advance.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
          <li>You are the QA Contact for the bug.</li>
      </ul>
    </body>
</html>=

--15049128050.c05c25Dbc.23829--

--===============1634130484==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1634130484==--
