From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 78530] New: Memory corruption on Lenovo t440p with
	runpm
Date: Sat, 10 May 2014 15:22:28 +0000
Message-ID: <bug-78530-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0034394715=="
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


--===============0034394715==
Content-Type: multipart/alternative; boundary="1399735348.5df0d8051.17865"; charset="us-ascii"


--1399735348.5df0d8051.17865
Date: Sat, 10 May 2014 15:22:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=78530

          Priority: medium
            Bug ID: 78530
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Memory corruption on Lenovo t440p with runpm
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: All
          Reporter: nikoamia-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

On recent kernels with runpm the system crashes (with a big memory corruption)
when nvidia card is disabled and then enabled on Lenovo T440p laptops with
recent BIOSes (1.16+).

My investigations into this:
1. The crash occurs even with just acpi_call, so it looks like on those BIOSes
there is some new kind of procedure for enabling nvidia.
2. ACPI calls from Windows and Linux does not differ much (and trying Windows'
calling sequence does not help). Also, DSDT from 1.14 and 1.16 BIOSes basically
do not differ.
3. The bug can be workarounded by disabling all memory upper than 4GB
4. This bug affects not really memory (there is no corruption of regular
memory), but devices using memory regions. For example, I can load system from
ramdisk with all such devices disabled, (1) perform acpi nvidia disable-enable
and (2) try to load such module (order of (1) and (2) does not matter) --
errors pile up, even if I unload and load this module.

My own hypothesis is that something with PCI bus gets broken -- maybe some
reinitialization needs to be performed?

Links:
1. https://github.com/Bumblebee-Project/bbswitch/issues/78 (main discussion
place)
2. https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1268669 (ubuntu bug
report)
3. https://bbs.archlinux.org/viewtopic.php?pid=1414109 (one of forum threads
about this)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1399735348.5df0d8051.17865
Date: Sat, 10 May 2014 15:22:28 +0000
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
   title="NEW --- - Memory corruption on Lenovo t440p with runpm"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78530">78530</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Memory corruption on Lenovo t440p with runpm
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
          <td>All
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>nikoamia&#64;gmail.com
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
        <pre>On recent kernels with runpm the system crashes (with a big memory corruption)
when nvidia card is disabled and then enabled on Lenovo T440p laptops with
recent BIOSes (1.16+).

My investigations into this:
1. The crash occurs even with just acpi_call, so it looks like on those BIOSes
there is some new kind of procedure for enabling nvidia.
2. ACPI calls from Windows and Linux does not differ much (and trying Windows'
calling sequence does not help). Also, DSDT from 1.14 and 1.16 BIOSes basically
do not differ.
3. The bug can be workarounded by disabling all memory upper than 4GB
4. This bug affects not really memory (there is no corruption of regular
memory), but devices using memory regions. For example, I can load system from
ramdisk with all such devices disabled, (1) perform acpi nvidia disable-enable
and (2) try to load such module (order of (1) and (2) does not matter) --
errors pile up, even if I unload and load this module.

My own hypothesis is that something with PCI bus gets broken -- maybe some
reinitialization needs to be performed?

Links:
1. <a href="https://github.com/Bumblebee-Project/bbswitch/issues/78">https://github.com/Bumblebee-Project/bbswitch/issues/78</a> (main discussion
place)
2. <a href="https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1268669">https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1268669</a> (ubuntu bug
report)
3. <a href="https://bbs.archlinux.org/viewtopic.php?pid=1414109">https://bbs.archlinux.org/viewtopic.php?pid=1414109</a> (one of forum threads
about this)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1399735348.5df0d8051.17865--

--===============0034394715==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0034394715==--
