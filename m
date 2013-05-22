From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 64858] New: Nouveau sees invalid EDID for eDP-1
 whenever that display is turned off
Date: Wed, 22 May 2013 09:50:15 +0000
Message-ID: <bug-64858-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0186107357=="
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


--===============0186107357==
Content-Type: multipart/alternative; boundary="1369216215.6C4f1.26123"; charset="us-ascii"


--1369216215.6C4f1.26123
Date: Wed, 22 May 2013 09:50:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=64858

          Priority: medium
            Bug ID: 64858
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Nouveau sees invalid EDID for eDP-1 whenever that
                    display is turned off
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: gspreemann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

With kernel 3.8.8 and 3.9.0, nouveau sees an EDID with incorrect checksum for
the display on eDP-1 as soon as that connector is turned off. Repeatedly
re-fetching that EDID causes so much stuttering that the system becomes
unusuable. A kworker thread rises to near 100% CPU usage, so I suspect the EDID
is being re-fetched repeatedly. Turning the connector back on restores normal
behavior (the correct EDID, with correct checksum, is obtained, and there is no
stuttering). Kernel 3.5.7.9 did not behave like this.

Extracting the correct EDID when the display is on and supplying it as a custom
EDID does not seem to prevent re-fetching of the invalid one. Passing
drm_kms_helper.poll=0 does not seem to prevent the re-fetching either.

I apologize in advance if it turns out that it is in fact my hardware that
simply supplies the wrong EDID when the display is turned off. In that case,
maybe one could add an option to stop re-fetching after N failed checksums? (I
guess that's not in the domain of nouveau, though...)

Device: 01:00.0 VGA compatible controller: NVIDIA Corporation GT218M [NVS
3100M] (rev a2)

Example of kernel message:
[  169.657456] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid,
remainder is 64
[  169.657461] Raw EDID:
[  169.657464]          00 ff ff ff ff ff ff 00 06 af 47 41 00 00 00 00
[  169.657465]          22 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
[  169.657466]          01 01 01 01 01 01 94 25 a0 3e 51 84 0c 30 40 20
[  169.657468]          33 00 2f bd 10 00 00 1a 0d 19 a0 3e 51 84 0c 30
[  169.657469]          40 20 33 00 2f bd 10 00 00 1a 00 00 00 fe 00 43
[  169.657470]          43 58 4d 57 80 42 31 34 31 50 57 34 00 00 00 00
[  169.657471]          00 00 41 21 1e 00 00 00 00 09 01 0a 20 20 00 9d
[  169.657473]          00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[  171.713571] nouveau E[     I2C][0000:01:00.0] AUXCH(1): tx req timeout
0x01114000

(The tx req timeout message is not always present. The EDID checksum failure is
repeated for as long as eDP-1 is disabled. As soon as eDP-1 is turned on, the
messages stop appearing and the stuttering described above stops.)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1369216215.6C4f1.26123
Date: Wed, 22 May 2013 09:50:15 +0000
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
   title="NEW --- - Nouveau sees invalid EDID for eDP-1 whenever that display is turned off"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=64858">64858</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Nouveau sees invalid EDID for eDP-1 whenever that display is turned off
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
          <td>gspreemann&#64;gmail.com
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
        <pre>With kernel 3.8.8 and 3.9.0, nouveau sees an EDID with incorrect checksum for
the display on eDP-1 as soon as that connector is turned off. Repeatedly
re-fetching that EDID causes so much stuttering that the system becomes
unusuable. A kworker thread rises to near 100% CPU usage, so I suspect the EDID
is being re-fetched repeatedly. Turning the connector back on restores normal
behavior (the correct EDID, with correct checksum, is obtained, and there is no
stuttering). Kernel 3.5.7.9 did not behave like this.

Extracting the correct EDID when the display is on and supplying it as a custom
EDID does not seem to prevent re-fetching of the invalid one. Passing
drm_kms_helper.poll=0 does not seem to prevent the re-fetching either.

I apologize in advance if it turns out that it is in fact my hardware that
simply supplies the wrong EDID when the display is turned off. In that case,
maybe one could add an option to stop re-fetching after N failed checksums? (I
guess that's not in the domain of nouveau, though...)

Device: 01:00.0 VGA compatible controller: NVIDIA Corporation GT218M [NVS
3100M] (rev a2)

Example of kernel message:
[  169.657456] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid,
remainder is 64
[  169.657461] Raw EDID:
[  169.657464]          00 ff ff ff ff ff ff 00 06 af 47 41 00 00 00 00
[  169.657465]          22 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
[  169.657466]          01 01 01 01 01 01 94 25 a0 3e 51 84 0c 30 40 20
[  169.657468]          33 00 2f bd 10 00 00 1a 0d 19 a0 3e 51 84 0c 30
[  169.657469]          40 20 33 00 2f bd 10 00 00 1a 00 00 00 fe 00 43
[  169.657470]          43 58 4d 57 80 42 31 34 31 50 57 34 00 00 00 00
[  169.657471]          00 00 41 21 1e 00 00 00 00 09 01 0a 20 20 00 9d
[  169.657473]          00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[  171.713571] nouveau E[     I2C][0000:01:00.0] AUXCH(1): tx req timeout
0x01114000

(The tx req timeout message is not always present. The EDID checksum failure is
repeated for as long as eDP-1 is disabled. As soon as eDP-1 is turned on, the
messages stop appearing and the stuttering described above stops.)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1369216215.6C4f1.26123--

--===============0186107357==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0186107357==--
