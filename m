From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75800] New: [NVE4] [GTX660Ti] Pink line on left side
 of monitor and slightly blurry areas on screen
Date: Wed, 05 Mar 2014 15:31:48 +0000
Message-ID: <bug-75800-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1034132936=="
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


--===============1034132936==
Content-Type: multipart/alternative; boundary="1394033508.4F15aA80.10593"; charset="us-ascii"


--1394033508.4F15aA80.10593
Date: Wed, 5 Mar 2014 15:31:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=75800

          Priority: medium
            Bug ID: 75800
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [NVE4] [GTX660Ti] Pink line on left side of monitor
                    and slightly blurry areas on screen
          Severity: minor
    Classification: Unclassified
                OS: Linux (All)
          Reporter: christian.erdmann-ncST9ati83jjhi9iKp3Nug@public.gmane.org
               URL: https://bbs.archlinux.org/viewtopic.php?id=98385
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Drivers/DRI/nouveau
           Product: Mesa

Created attachment 95171
  --> https://bugs.freedesktop.org/attachment.cgi?id=95171&action=edit
Additional dmesg and Xorg logs

When connecting my graphics card to my monitor (BenQ V2400 Eco) via HDMI the
behaviour described in the summary can be observed (as early as mode set via
KMS). Example pictures of the pink line can be seen in the linked Arch Linux
forums thread, the blurred areas are especially visible when viewing text.
Lowering resolution (xrandr --output ... --mode, tested 1280x720, 640x480) does
not change the thickness of the line (and doesn't make it disappear either).

The problem goes away when using the proprietary nvidia drivers in connection
with the same setup. Additionally I have tested various combinations of drivers
(nvidia, nouveau), connectors (HDMI, VGA (via DVI-to-VGA adaptor)) and monitors
(BenQ V2400 Eco, Samsung LE32A436). The respective dmesg and Xorg logs are
attached.
Note that pink line/blurry areas issue seems to exclusively occur with the
following combination: nouveau + HDMI + BenQ V2400 Eco (which happens to be my
main setup)

Versions/revisions of relevant software/hardware can be seen in the attached
logs. An MMIO trace has been sent to mmio.dumps-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org along with the output
of dmesg and lspci -vvv at that time and the VBIOS (dumped via vbtracetool) of
my card. The MMIO trace itself contains a marker when the X server was started
("X is up").

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1394033508.4F15aA80.10593
Date: Wed, 5 Mar 2014 15:31:48 +0000
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
   title="NEW --- - [NVE4] [GTX660Ti] Pink line on left side of monitor and slightly blurry areas on screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75800">75800</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NVE4] [GTX660Ti] Pink line on left side of monitor and slightly blurry areas on screen
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>minor
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
          <td>christian.erdmann&#64;tu-dortmund.de
          </td>
        </tr>

        <tr>
          <th>URL</th>
          <td>https://bbs.archlinux.org/viewtopic.php?id=98385
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
          <td>Drivers/DRI/nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=95171" name="attach_95171" title="Additional dmesg and Xorg logs">attachment 95171</a> <a href="attachment.cgi?id=95171&amp;action=edit" title="Additional dmesg and Xorg logs">[details]</a></span>
Additional dmesg and Xorg logs

When connecting my graphics card to my monitor (BenQ V2400 Eco) via HDMI the
behaviour described in the summary can be observed (as early as mode set via
KMS). Example pictures of the pink line can be seen in the linked Arch Linux
forums thread, the blurred areas are especially visible when viewing text.
Lowering resolution (xrandr --output ... --mode, tested 1280x720, 640x480) does
not change the thickness of the line (and doesn't make it disappear either).

The problem goes away when using the proprietary nvidia drivers in connection
with the same setup. Additionally I have tested various combinations of drivers
(nvidia, nouveau), connectors (HDMI, VGA (via DVI-to-VGA adaptor)) and monitors
(BenQ V2400 Eco, Samsung LE32A436). The respective dmesg and Xorg logs are
attached.
Note that pink line/blurry areas issue seems to exclusively occur with the
following combination: nouveau + HDMI + BenQ V2400 Eco (which happens to be my
main setup)

Versions/revisions of relevant software/hardware can be seen in the attached
logs. An MMIO trace has been sent to <a href="mailto:mmio.dumps&#64;gmail.com">mmio.dumps&#64;gmail.com</a> along with the output
of dmesg and lspci -vvv at that time and the VBIOS (dumped via vbtracetool) of
my card. The MMIO trace itself contains a marker when the X server was started
(&quot;X is up&quot;).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1394033508.4F15aA80.10593--

--===============1034132936==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1034132936==--
