From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 78116] New: Auto fan speed management doesn't do
 anything in non critical temperature range (NVC0)
Date: Wed, 30 Apr 2014 14:45:19 +0000
Message-ID: <bug-78116-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0325330676=="
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


--===============0325330676==
Content-Type: multipart/alternative; boundary="1398869119.DAcf1.9382"; charset="us-ascii"


--1398869119.DAcf1.9382
Date: Wed, 30 Apr 2014 14:45:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D78116

          Priority: medium
            Bug ID: 78116
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Auto fan speed management doesn't do anything in non
                    critical temperature range (NVC0)
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: enhancement
    Classification: Unclassified
                OS: All
          Reporter: mdop-9Vj9tDbzfuSlVyrhU4qvOw@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

I have Gigabyte GTX 560 Ti Ultra Durable card. (Logs for this issue are sam=
e as
in Bug 78106)

1a) When I finish booting, nouveau selects AUTO mode (pwm1_enable: 2) and s=
et's
the fan power to 55% (pwm1: 55).

1b) Enable manual mode, set pwm1 to 100, enable auto mode.

In both cases I would expect from the AUTO mode to lower PWM to go as low as
pwm1_min if the temperature is low enough. My card temperature is 31-33 =C2=
=B0C but
pwm1 is never lowered in AUTO mode (neither from 55 or 100).

2) On Windows pwm goes as low as pwm1_min (which is 40 by default for GTX 5=
60
Ti but it also works with my modded value of 30). I thought that Nvidia card
can manage it by itself (is it really done by operating system/software?).

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1398869119.DAcf1.9382
Date: Wed, 30 Apr 2014 14:45:19 +0000
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
   title=3D"NEW --- - Auto fan speed management doesn't do anything in non =
critical temperature range (NVC0)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D78116">78116</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Auto fan speed management doesn't do anything in non critical=
 temperature range (NVC0)
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>enhancement
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
          <td>mdop&#64;seznam.cz
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
        <pre>I have Gigabyte GTX 560 Ti Ultra Durable card. (Logs for this =
issue are same as
in <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - Reported fan rpm is twice the actual value (NVC0)"
   href=3D"show_bug.cgi?id=3D78106">Bug 78106</a>)

1a) When I finish booting, nouveau selects AUTO mode (pwm1_enable: 2) and s=
et's
the fan power to 55% (pwm1: 55).

1b) Enable manual mode, set pwm1 to 100, enable auto mode.

In both cases I would expect from the AUTO mode to lower PWM to go as low as
pwm1_min if the temperature is low enough. My card temperature is 31-33 =C2=
=B0C but
pwm1 is never lowered in AUTO mode (neither from 55 or 100).

2) On Windows pwm goes as low as pwm1_min (which is 40 by default for GTX 5=
60
Ti but it also works with my modded value of 30). I thought that Nvidia card
can manage it by itself (is it really done by operating system/software?).<=
/pre>
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

--1398869119.DAcf1.9382--

--===============0325330676==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0325330676==--
