From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91551] New: DXTn compressed normal maps produce
 severe artifacts on all NV5x and NVDx chipsets
Date: Tue, 04 Aug 2015 13:44:02 +0000
Message-ID: <bug-91551-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2014893355=="
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


--===============2014893355==
Content-Type: multipart/alternative; boundary="1438695842.7C571020.30588"; charset="UTF-8"


--1438695842.7C571020.30588
Date: Tue, 4 Aug 2015 13:44:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91551

            Bug ID: 91551
           Summary: DXTn compressed normal maps produce severe artifacts
                    on all NV5x and NVDx chipsets
           Product: Mesa
           Version: 10.6
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: critical
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: issor.oruam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Created attachment 117508
  --> https://bugs.freedesktop.org/attachment.cgi?id=117508&action=edit
Snapshot of the artifacts with normal map

Light blue garbled artifacts are affecting gallium nouveau on FreeSpace2 open
source, with Star Wars : Original Trilogy mod.

To Star Wars fans this may be unacceptable :-), so let't try to find clues to
the problem

I have checked the .dds normal map's texture compression format and in this mod
it's always DXT5

If I disable 'normal maps' in wxLauncher there are no artifacts, but there are
also no maps, which are one the beauties of the mod.

Affected chipsets NV6x (GeForce 7025) NV8x (GeForce 8500, 8600), NV9x (GeForce
9600GT, GT120) , NVAx (GeForce 210) and NVDx (GeForce GT610). (cheched mesa
with 10.6.x)

Unaffected, meaning normal maps are fine with those: NVCx and NVEx chipsets
(checked with mesa 10.6.x and 11.0.0devel git)

NOTE: It's strange that NVDx chipsets are affected, if they rely on nvc0 driver

You can find in the attachment the snapshot of the artifacts with normal maps
and  normal maps disabled (no artifacts), plus other log files/extracts.

Mauro

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1438695842.7C571020.30588
Date: Tue, 4 Aug 2015 13:44:02 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - DXTn compressed normal maps produce severe artifacts on all NV5x and NVDx chipsets"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91551">91551</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>DXTn compressed normal maps produce severe artifacts on all NV5x and NVDx chipsets
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>10.6
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>critical
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
          <td>issor.oruam&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=117508" name="attach_117508" title="Snapshot of the artifacts with normal map">attachment 117508</a> <a href="attachment.cgi?id=117508&amp;action=edit" title="Snapshot of the artifacts with normal map">[details]</a></span>
Snapshot of the artifacts with normal map

Light blue garbled artifacts are affecting gallium nouveau on FreeSpace2 open
source, with Star Wars : Original Trilogy mod.

To Star Wars fans this may be unacceptable :-), so let't try to find clues to
the problem

I have checked the .dds normal map's texture compression format and in this mod
it's always DXT5

If I disable 'normal maps' in wxLauncher there are no artifacts, but there are
also no maps, which are one the beauties of the mod.

Affected chipsets NV6x (GeForce 7025) NV8x (GeForce 8500, 8600), NV9x (GeForce
9600GT, GT120) , NVAx (GeForce 210) and NVDx (GeForce GT610). (cheched mesa
with 10.6.x)

Unaffected, meaning normal maps are fine with those: NVCx and NVEx chipsets
(checked with mesa 10.6.x and 11.0.0devel git)

NOTE: It's strange that NVDx chipsets are affected, if they rely on nvc0 driver

You can find in the attachment the snapshot of the artifacts with normal maps
and  normal maps disabled (no artifacts), plus other log files/extracts.

Mauro</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1438695842.7C571020.30588--

--===============2014893355==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============2014893355==--
