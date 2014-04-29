From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 78092] New: GK208M [GeForce GT 730M] (rev ff)
 (prog-if ff) nouveau module load fail
Date: Tue, 29 Apr 2014 19:07:38 +0000
Message-ID: <bug-78092-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0277372967=="
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


--===============0277372967==
Content-Type: multipart/alternative; boundary="1398798458.caD60.32542"; charset="us-ascii"


--1398798458.caD60.32542
Date: Tue, 29 Apr 2014 19:07:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=78092

          Priority: medium
            Bug ID: 78092
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: GK208M [GeForce GT 730M] (rev ff) (prog-if ff) nouveau
                    module load fail
          Severity: normal
    Classification: Unclassified
                OS: All
          Reporter: anton.gubarkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: unspecified
         Component: Drivers/DRI/nouveau
           Product: Mesa

Created attachment 98190
  --> https://bugs.freedesktop.org/attachment.cgi?id=98190&action=edit
dmesg output

I try to set up a bumblebee based system. intel work ok. however nouveau fails
to load with 
[    3.908759] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x108100a1
[    3.909225] nouveau  [  DEVICE][0000:01:00.0] Chipset: GK208 (NV108)
[    3.909662] nouveau  [  DEVICE][0000:01:00.0] Family : NVE0
[    3.911750] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
[    3.913264] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[    3.913677] nouveau  [   VBIOS][0000:01:00.0] checking PROM for image...
[    3.914144] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[    3.914548] nouveau  [   VBIOS][0000:01:00.0] checking ACPI for image...
[    3.914947] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[    3.915332] nouveau  [   VBIOS][0000:01:00.0] checking PCIROM for image...
[    3.915719] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[    3.916097] nouveau  [   VBIOS][0000:01:00.0] checking PLATFORM for image...
[    3.916475] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[    3.916840] nouveau E[   VBIOS][0000:01:00.0] unable to locate usable image
[    3.917198] nouveau E[  DEVICE][0000:01:00.0] failed to create 0x10000001,
-22
[    3.917866] nouveau E[     DRM] failed to create 0x80000080, -22
[    3.918367] nouveau: probe of 0000:01:00.0 failed with error -22


the full dmesg is attached.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1398798458.caD60.32542
Date: Tue, 29 Apr 2014 19:07:38 +0000
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
   title="NEW --- - GK208M [GeForce GT 730M] (rev ff) (prog-if ff) nouveau module load fail"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78092">78092</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>GK208M [GeForce GT 730M] (rev ff) (prog-if ff) nouveau module load fail
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
          <td>anton.gubarkov&#64;gmail.com
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
        <pre>Created <span class=""><a href="attachment.cgi?id=98190" name="attach_98190" title="dmesg output">attachment 98190</a> <a href="attachment.cgi?id=98190&amp;action=edit" title="dmesg output">[details]</a></span>
dmesg output

I try to set up a bumblebee based system. intel work ok. however nouveau fails
to load with 
[    3.908759] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x108100a1
[    3.909225] nouveau  [  DEVICE][0000:01:00.0] Chipset: GK208 (NV108)
[    3.909662] nouveau  [  DEVICE][0000:01:00.0] Family : NVE0
[    3.911750] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
[    3.913264] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[    3.913677] nouveau  [   VBIOS][0000:01:00.0] checking PROM for image...
[    3.914144] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[    3.914548] nouveau  [   VBIOS][0000:01:00.0] checking ACPI for image...
[    3.914947] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[    3.915332] nouveau  [   VBIOS][0000:01:00.0] checking PCIROM for image...
[    3.915719] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[    3.916097] nouveau  [   VBIOS][0000:01:00.0] checking PLATFORM for image...
[    3.916475] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[    3.916840] nouveau E[   VBIOS][0000:01:00.0] unable to locate usable image
[    3.917198] nouveau E[  DEVICE][0000:01:00.0] failed to create 0x10000001,
-22
[    3.917866] nouveau E[     DRM] failed to create 0x80000080, -22
[    3.918367] nouveau: probe of 0000:01:00.0 failed with error -22


the full dmesg is attached.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1398798458.caD60.32542--

--===============0277372967==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0277372967==--
