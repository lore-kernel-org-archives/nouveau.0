From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 79820] New: Strange readout on fan1_input when
	pwm1_min < 33
Date: Mon, 09 Jun 2014 08:35:18 +0000
Message-ID: <bug-79820-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1414907772=="
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


--===============1414907772==
Content-Type: multipart/alternative; boundary="1402302918.5Ca0F3cD1.3698"; charset="us-ascii"


--1402302918.5Ca0F3cD1.3698
Date: Mon, 9 Jun 2014 08:35:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D79820

          Priority: medium
            Bug ID: 79820
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Strange readout on fan1_input when pwm1_min < 33
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: freedesk.apriori-w1QkCcy0X+BxKfgMtfWJuA@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 100705
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D100705&action=3Dedit
jountalctl -b -k|grep nouveau

When running the drivers from kernel 3.15.0, pwm1_min seems to default to 3=
5. I
noticed that this yields reported ~2k RPM in fan1_input for my card. Since =
the
fan runs at ~1k RPM in idle when running the NVIDIA blob, I tried lowering
pwm1_min and noticed odd results.

Lowering pwm1_min to 32 is fine and gives me a readout of ~1.8k RPM. Howeve=
r,
after that, I see weird output values:

31 ~ 4.5k
30 ~ 9k
29 ~ 5k
28 ~ 22k (sic)
27 ~ 75k (sic)
26 ~ 400k (sic)

At no time was my computer lifting up from the ground though, and even with=
 the
reported 4.5k it seems that the fan did not actually speed up.

Additional background: It seems my fan is only supported as of Linux 3.15.0.
Before that, the fan ran at 100% and dmesg showed =C2=ABFAN control: none /
external=C2=BB. On IRC I was informed that a new fan has been added to 3.15=
, and
indeed it seems to be recognized now (many thanks for that!).

I=E2=80=99m attaching my dmesg and my vbios in case it helps. Note though t=
hat
nvagetbios reported a warning when dumping the BIOS:

> No extraction method specified (using -s extraction_method). Defaulting t=
o PRAMIN.
> Attempt to extract the vbios from card 0 (nve6) using PRAMIN
> Invalid signature(0x55aa). You may want to try another retrieval method.

Let me know if there=E2=80=99s additional information I could supply.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1402302918.5Ca0F3cD1.3698
Date: Mon, 9 Jun 2014 08:35:18 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - Strange readout on fan1_input when pwm1_min &lt; 33"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D79820">79820</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Strange readout on fan1_input when pwm1_min &lt; 33
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
          <td>freedesk.apriori&#64;spamgourmet.com
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
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D100705=
" name=3D"attach_100705" title=3D"jountalctl -b -k|grep nouveau">attachment=
 100705</a> <a href=3D"attachment.cgi?id=3D100705&amp;action=3Dedit" title=
=3D"jountalctl -b -k|grep nouveau">[details]</a></span>
jountalctl -b -k|grep nouveau

When running the drivers from kernel 3.15.0, pwm1_min seems to default to 3=
5. I
noticed that this yields reported ~2k RPM in fan1_input for my card. Since =
the
fan runs at ~1k RPM in idle when running the NVIDIA blob, I tried lowering
pwm1_min and noticed odd results.

Lowering pwm1_min to 32 is fine and gives me a readout of ~1.8k RPM. Howeve=
r,
after that, I see weird output values:

31 ~ 4.5k
30 ~ 9k
29 ~ 5k
28 ~ 22k (sic)
27 ~ 75k (sic)
26 ~ 400k (sic)

At no time was my computer lifting up from the ground though, and even with=
 the
reported 4.5k it seems that the fan did not actually speed up.

Additional background: It seems my fan is only supported as of Linux 3.15.0.
Before that, the fan ran at 100% and dmesg showed =C2=ABFAN control: none /
external=C2=BB. On IRC I was informed that a new fan has been added to 3.15=
, and
indeed it seems to be recognized now (many thanks for that!).

I=E2=80=99m attaching my dmesg and my vbios in case it helps. Note though t=
hat
nvagetbios reported a warning when dumping the BIOS:

<span class=3D"quote">&gt; No extraction method specified (using -s extract=
ion_method). Defaulting to PRAMIN.
&gt; Attempt to extract the vbios from card 0 (nve6) using PRAMIN
&gt; Invalid signature(0x55aa). You may want to try another retrieval metho=
d.</span >

Let me know if there=E2=80=99s additional information I could supply.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
=20=20=20=20=20=20
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1402302918.5Ca0F3cD1.3698--

--===============1414907772==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1414907772==--
