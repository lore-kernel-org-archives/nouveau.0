From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 62829] New: On S1 suspend,
 attached monitor does not enter low power state, MX420 NV17 AGP 4x card
Date: Wed, 27 Mar 2013 17:26:27 +0000
Message-ID: <bug-62829-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1128424003=="
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


--===============1128424003==
Content-Type: multipart/alternative; boundary="1364405187.4f772b61.26198"; charset="us-ascii"


--1364405187.4f772b61.26198
Date: Wed, 27 Mar 2013 17:26:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=62829

          Priority: medium
            Bug ID: 62829
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: On S1 suspend, attached monitor does not enter low
                    power state, MX420 NV17 AGP 4x card
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: paula-VL1tVIhH15Ot+zzwz018cpVzexx5G7lz@public.gmane.org
          Hardware: x86 (IA32)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 77117
  --> https://bugs.freedesktop.org/attachment.cgi?id=77117&action=edit
dmesg output, suspend logs, other detail

Platform:

Computer: Dell Dimension 4100 circa 2001
Graphics card: NVIDIA MX420, P17, AGP 4x, circa 2002-2003
Distribution: Debian Wheezy with LXDE and nouveau graphics driver

Symptoms:

Once the computer is suspended, the attached monitor should also enter its
low power state (signified by the blue power led turning orange). This happens
properly when suspending Windows XP but does not happen when suspending Debian
Wheezy. With Debian Wheezy, the monitor first goes blank but not completely 
dark. After a few seconds, the monitor fades from mostly dark to completely 
dark but the power led remains blue when it should change to amber.

The machine wakes properly from the S1 suspend state.

I am new to linux but I believe that this problem is related to the nouveau
driver. The monitor can be placed into its low power state with xset. Also,
if the pm-util 99video shell script is modified to xset the monitor to its
low power state when suspending, it will go into that state but will awake 
once the nouveau kernel module does its suspend stuff. See attachment.

The Dimension 4100 enters the S1 state upon suspend, S3 is not supported.
This behavior is identical with  both Windows XP and Debian Wheezy.
Current draw in the S1 state is .20A under Windows XP and .25A with Wheezy.
The current draw difference may not be related to the graphics card but it is
interesting nevertheless. I have looked for related bugs but can't find any.
I speculate, however, that this problem may be common but just overlooked. It
appears that most people are interested in major failures like kernel panics
and what not.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1364405187.4f772b61.26198
Date: Wed, 27 Mar 2013 17:26:27 +0000
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
   title="NEW --- - On S1 suspend, attached monitor does not enter low power state, MX420 NV17 AGP 4x card"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=62829">62829</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>On S1 suspend, attached monitor does not enter low power state, MX420 NV17 AGP 4x card
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
          <td>paula&#64;alumni.cse.ucsc.edu
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86 (IA32)
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
        <pre>Created <span class=""><a href="attachment.cgi?id=77117" name="attach_77117" title="dmesg output, suspend logs, other detail">attachment 77117</a> <a href="attachment.cgi?id=77117&amp;action=edit" title="dmesg output, suspend logs, other detail">[details]</a></span>
dmesg output, suspend logs, other detail

Platform:

Computer: Dell Dimension 4100 circa 2001
Graphics card: NVIDIA MX420, P17, AGP 4x, circa 2002-2003
Distribution: Debian Wheezy with LXDE and nouveau graphics driver

Symptoms:

Once the computer is suspended, the attached monitor should also enter its
low power state (signified by the blue power led turning orange). This happens
properly when suspending Windows XP but does not happen when suspending Debian
Wheezy. With Debian Wheezy, the monitor first goes blank but not completely 
dark. After a few seconds, the monitor fades from mostly dark to completely 
dark but the power led remains blue when it should change to amber.

The machine wakes properly from the S1 suspend state.

I am new to linux but I believe that this problem is related to the nouveau
driver. The monitor can be placed into its low power state with xset. Also,
if the pm-util 99video shell script is modified to xset the monitor to its
low power state when suspending, it will go into that state but will awake 
once the nouveau kernel module does its suspend stuff. See attachment.

The Dimension 4100 enters the S1 state upon suspend, S3 is not supported.
This behavior is identical with  both Windows XP and Debian Wheezy.
Current draw in the S1 state is .20A under Windows XP and .25A with Wheezy.
The current draw difference may not be related to the graphics card but it is
interesting nevertheless. I have looked for related bugs but can't find any.
I speculate, however, that this problem may be common but just overlooked. It
appears that most people are interested in major failures like kernel panics
and what not.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1364405187.4f772b61.26198--

--===============1128424003==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1128424003==--
