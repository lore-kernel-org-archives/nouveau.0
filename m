From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 76475] New: Nouveau fails to load due to unknown
	opcode 0x80
Date: Sat, 22 Mar 2014 09:19:47 +0000
Message-ID: <bug-76475-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1064954309=="
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


--===============1064954309==
Content-Type: multipart/alternative; boundary="1395479987.60b4d5F1.26370"; charset="us-ascii"


--1395479987.60b4d5F1.26370
Date: Sat, 22 Mar 2014 09:19:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=76475

          Priority: medium
            Bug ID: 76475
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Nouveau fails to load due to unknown opcode 0x80
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: patrick.clara-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 96195
  --> https://bugs.freedesktop.org/attachment.cgi?id=96195&action=edit
vbios from /sys/bus/pci/devices/<pciid>/rom

Since kernel 3.13 nouveau fails to load with error -22.
Olso it reports an unknown opcode 0x80.
I suspect it fails to load becouse of the unknown opcode, since i have seen the
return code of the function checking the opcodes have changed in 3.13.

I have attached the vbios taken from /sys/bus/pci/devices/<pciid>/rom and the
dmesg from both kernel 3.12 and 3.14 rc7.

Could maybe a mmiotrace be helpful?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1395479987.60b4d5F1.26370
Date: Sat, 22 Mar 2014 09:19:47 +0000
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
   title="NEW --- - Nouveau fails to load due to unknown opcode 0x80"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76475">76475</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Nouveau fails to load due to unknown opcode 0x80
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
          <td>patrick.clara&#64;gmail.com
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
        <pre>Created <span class=""><a href="attachment.cgi?id=96195" name="attach_96195" title="vbios from /sys/bus/pci/devices/&lt;pciid&gt;/rom">attachment 96195</a> <a href="attachment.cgi?id=96195&amp;action=edit" title="vbios from /sys/bus/pci/devices/&lt;pciid&gt;/rom">[details]</a></span>
vbios from /sys/bus/pci/devices/&lt;pciid&gt;/rom

Since kernel 3.13 nouveau fails to load with error -22.
Olso it reports an unknown opcode 0x80.
I suspect it fails to load becouse of the unknown opcode, since i have seen the
return code of the function checking the opcodes have changed in 3.13.

I have attached the vbios taken from /sys/bus/pci/devices/&lt;pciid&gt;/rom and the
dmesg from both kernel 3.12 and 3.14 rc7.

Could maybe a mmiotrace be helpful?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1395479987.60b4d5F1.26370--

--===============1064954309==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1064954309==--
