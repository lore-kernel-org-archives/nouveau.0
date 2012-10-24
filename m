From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 56347] New: NVPlatformProbe routine does not mark
 the entity as Shared for ZaphodHeads.
Date: Wed, 24 Oct 2012 09:11:31 +0000
Message-ID: <bug-56347-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1822310955=="
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


--===============1822310955==
Content-Type: multipart/alternative; boundary="1351069891.42cc0EbB1.25463"; charset="us-ascii"


--1351069891.42cc0EbB1.25463
Date: Wed, 24 Oct 2012 09:11:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=56347

          Priority: medium
            Bug ID: 56347
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: NVPlatformProbe routine does not mark the entity as
                    Shared for ZaphodHeads.
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: All
          Reporter: exc-7nl8rL9eBqAvJsYlp49lxw@public.gmane.org
          Hardware: All
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

NVPlatformProbe routine does not mark the entity as Shared for ZaphodHeads.
It is used by xorg since version 1.13 so there is no possibility to use
ZaphodHeads.

This config:
 75 Section "Device"
 76     Identifier  "CardA1"
 77     Screen    0 
 78         Option     "ZaphodHeads"  "DVI-I-1"
 79     Option  "Monitor-DVI-I-1" "Monitor0"
 80         Option     "NoAccel"    "off"           # [<bool>]                  
 81     Driver      "nouveau"
 82     BusID       "PCI:1:0:0"
 83 EndSection
 84 
 85 Section "Device"
 86     Identifier  "CardA2"
 87         Option     "ZaphodHeads"  "VGA-1"
 88     Screen     1
 89     Option  "Monitor-VGA-1" "Monitor1"
 90         Option     "NoAccel"    "off"           # [<bool>]
 91     Driver      "nouveau"
 92     BusID       "PCI:1:0:0"
 93 EndSection
causes xorg to print "Requested Entity already in use!" and use PCI:1:0:0 as
single-head adapter.

Thanks.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1351069891.42cc0EbB1.25463
Date: Wed, 24 Oct 2012 09:11:31 +0000
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
   title="NEW --- - NVPlatformProbe routine does not mark the entity as Shared for ZaphodHeads."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56347">56347</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>NVPlatformProbe routine does not mark the entity as Shared for ZaphodHeads.
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
          <td>exc&#64;rbcmail.ru
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>All
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
        <pre>NVPlatformProbe routine does not mark the entity as Shared for ZaphodHeads.
It is used by xorg since version 1.13 so there is no possibility to use
ZaphodHeads.

This config:
 75 Section &quot;Device&quot;
 76     Identifier  &quot;CardA1&quot;
 77     Screen    0 
 78         Option     &quot;ZaphodHeads&quot;  &quot;DVI-I-1&quot;
 79     Option  &quot;Monitor-DVI-I-1&quot; &quot;Monitor0&quot;
 80         Option     &quot;NoAccel&quot;    &quot;off&quot;           # [&lt;bool&gt;]                  
 81     Driver      &quot;nouveau&quot;
 82     BusID       &quot;PCI:1:0:0&quot;
 83 EndSection
 84 
 85 Section &quot;Device&quot;
 86     Identifier  &quot;CardA2&quot;
 87         Option     &quot;ZaphodHeads&quot;  &quot;VGA-1&quot;
 88     Screen     1
 89     Option  &quot;Monitor-VGA-1&quot; &quot;Monitor1&quot;
 90         Option     &quot;NoAccel&quot;    &quot;off&quot;           # [&lt;bool&gt;]
 91     Driver      &quot;nouveau&quot;
 92     BusID       &quot;PCI:1:0:0&quot;
 93 EndSection
causes xorg to print &quot;Requested Entity already in use!&quot; and use PCI:1:0:0 as
single-head adapter.

Thanks.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1351069891.42cc0EbB1.25463--

--===============1822310955==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1822310955==--
