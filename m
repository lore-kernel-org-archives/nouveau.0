From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 95251] New: vdpau decoder capabilities: not supported
Date: Tue, 03 May 2016 18:58:09 +0000
Message-ID: <bug-95251-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0282689249=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0282689249==
Content-Type: multipart/alternative; boundary="14623018880.ab6323Fd.11129";
 charset="UTF-8"


--14623018880.ab6323Fd.11129
Date: Tue, 3 May 2016 18:58:08 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=95251

            Bug ID: 95251
           Summary: vdpau decoder capabilities: not supported
           Product: Mesa
           Version: 11.2
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: bgz.marko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Created attachment 123443
  --> https://bugs.freedesktop.org/attachment.cgi?id=123443&action=edit
dmesg

I have a Geforce 9300M GS card (NV98) which has VDPAU support according to 

https://nouveau.freedesktop.org/wiki/VideoAcceleration/

Also, with nvidia blog, there is working hardware acceleration.

I am on Arch Linux (x86) with all relevant packages including firmware
installed:
mesa-vdpau
libvdpau
nouveau-fw
xf86-video-nouveau

Attached are dmesg and vdpauinfo, which shows - not supported - for all decoder
capabilities.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.
--14623018880.ab6323Fd.11129
Date: Tue, 3 May 2016 18:58:08 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - vdpau decoder capabilities: not supported"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=95251">95251</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>vdpau decoder capabilities: not supported
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>11.2
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
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
          <td>bgz.marko&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=123443" name="attach_123443" title="dmesg">attachment 123443</a> <a href="attachment.cgi?id=123443&amp;action=edit" title="dmesg">[details]</a></span>
dmesg

I have a Geforce 9300M GS card (NV98) which has VDPAU support according to 

<a href="https://nouveau.freedesktop.org/wiki/VideoAcceleration/">https://nouveau.freedesktop.org/wiki/VideoAcceleration/</a>

Also, with nvidia blog, there is working hardware acceleration.

I am on Arch Linux (x86) with all relevant packages including firmware
installed:
mesa-vdpau
libvdpau
nouveau-fw
xf86-video-nouveau

Attached are dmesg and vdpauinfo, which shows - not supported - for all decoder
capabilities.</pre>
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
--14623018880.ab6323Fd.11129--

--===============0282689249==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0282689249==--
