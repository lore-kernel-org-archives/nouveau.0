From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 84515] New: [NV96] HDMI audio works,
 but has audio gaps or pauses
Date: Tue, 30 Sep 2014 15:36:05 +0000
Message-ID: <bug-84515-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0521918777=="
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


--===============0521918777==
Content-Type: multipart/alternative; boundary="1412091365.0bB37D0A1.24620"; charset="us-ascii"


--1412091365.0bB37D0A1.24620
Date: Tue, 30 Sep 2014 15:36:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=84515

          Priority: medium
            Bug ID: 84515
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [NV96] HDMI audio works, but has audio gaps or pauses
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: ppaalanen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 107133
  --> https://bugs.freedesktop.org/attachment.cgi?id=107133&action=edit
output of lspci -nn

I'm running 3.16.3-gentoo kernel with a
 nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x096500a1
 nouveau  [  DEVICE][0000:01:00.0] Chipset: G96 (NV96)

On a whim, I decided to try HDMI audio. I plugged in the TV, and extended my
desktop there. To my surprise, 'alsamixer' reports "Card: HDA Intel" and "Chip:
Nvidia MCP77/78 HDMI".

In audacious' ALSA settings, I found a "PCM device" hw:0,3 labeled as "HDMI 0".
When I choose that as the output and play a song:

- The laptop internal speakers, i.e. the whole normal analog audio output
system, produces a loud static, which I have to mute in Alsamixer by muting
"Speaker".

- The song comes out mostly fine on the TV! (Was this supposed to work??)

I found I can mute the HDMI audio in alsamixer by setting "S/PDIF" off. No
other control I tried has any effect on it. That is ok for me.

Apart from the static in the laptop speakers, the primary annoying problem is
that the HDMI audio has short gaps or pauses. I measured it by ear for a couple
of minutes, and the gaps occur roughly 33 second intervals. The length of a gap
is less than a second, maybe a half second.

This bug is about the gaps.

This is the same system as in my bug #60680 where we eventually got HDMI video
output regression solved. You can find an old mmiotrace there, and VBIOS dump.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1412091365.0bB37D0A1.24620
Date: Tue, 30 Sep 2014 15:36:05 +0000
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
   title="NEW --- - [NV96] HDMI audio works, but has audio gaps or pauses"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=84515">84515</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NV96] HDMI audio works, but has audio gaps or pauses
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
          <td>ppaalanen&#64;gmail.com
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
        <pre>Created <span class=""><a href="attachment.cgi?id=107133" name="attach_107133" title="output of lspci -nn">attachment 107133</a> <a href="attachment.cgi?id=107133&amp;action=edit" title="output of lspci -nn">[details]</a></span>
output of lspci -nn

I'm running 3.16.3-gentoo kernel with a
 nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x096500a1
 nouveau  [  DEVICE][0000:01:00.0] Chipset: G96 (NV96)

On a whim, I decided to try HDMI audio. I plugged in the TV, and extended my
desktop there. To my surprise, 'alsamixer' reports &quot;Card: HDA Intel&quot; and &quot;Chip:
Nvidia MCP77/78 HDMI&quot;.

In audacious' ALSA settings, I found a &quot;PCM device&quot; hw:0,3 labeled as &quot;HDMI 0&quot;.
When I choose that as the output and play a song:

- The laptop internal speakers, i.e. the whole normal analog audio output
system, produces a loud static, which I have to mute in Alsamixer by muting
&quot;Speaker&quot;.

- The song comes out mostly fine on the TV! (Was this supposed to work??)

I found I can mute the HDMI audio in alsamixer by setting &quot;S/PDIF&quot; off. No
other control I tried has any effect on it. That is ok for me.

Apart from the static in the laptop speakers, the primary annoying problem is
that the HDMI audio has short gaps or pauses. I measured it by ear for a couple
of minutes, and the gaps occur roughly 33 second intervals. The length of a gap
is less than a second, maybe a half second.

This bug is about the gaps.

This is the same system as in my <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [NV96] HDMI is connected and has mode, TV says &quot;no signal&quot;"
   href="show_bug.cgi?id=60680">bug #60680</a> where we eventually got HDMI video
output regression solved. You can find an old mmiotrace there, and VBIOS dump.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1412091365.0bB37D0A1.24620--

--===============0521918777==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0521918777==--
