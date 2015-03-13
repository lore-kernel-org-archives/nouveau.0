From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89571] New: XFX 7300 GS - Black screen with DVI when
 KMS(nouveau) starts - VGA working
Date: Fri, 13 Mar 2015 15:38:59 +0000
Message-ID: <bug-89571-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1229170430=="
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


--===============1229170430==
Content-Type: multipart/alternative; boundary="1426261140.6dF1df71.24109"; charset="UTF-8"


--1426261140.6dF1df71.24109
Date: Fri, 13 Mar 2015 15:39:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89571

            Bug ID: 89571
           Summary: XFX 7300 GS - Black screen with DVI when KMS(nouveau)
                    starts - VGA working
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: All
            Status: NEW
          Severity: blocker
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: bxmixzxm-GK+4nHxFadIswetKESUqMA@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 114287
  --> https://bugs.freedesktop.org/attachment.cgi?id=114287&action=edit
vbios XFX Nvidia 7300 GS 256MB

I already talked in IRC #nouveau before reporting this bug.

Card:
http://images10.newegg.com/NeweggImage/ProductImageCompressAll300/14-150-410-02.jpg

Problem: Card connected to an 24" 1920x1200 monitor via DVI. Everything is
working fine with windows and DVI at full resolution.
When booting any Linux live, i get a black screen directly when KMS starts.
BIOS post and VESA works fine with DVI.
To get a picture with nouveau, i had to connect the same monitor via VGA cable
to the nvidia card. I get then an 1024x768 resolution.

After boot with VGA i remove the VGA cable and connect DVI to get some logfiles
for debugging.
first:
for p in /sys/class/drm/*/status; do con=${p%/status}; echo -n
"${con#*/card?-}: "; cat $p; done

reports in VGA-mode:
DVI-I-1: disconnected
TV-1: connected
TV-2: disconnected

reports in DVI-mode (no working screen):
DVI-I-1: disconnected
TV-1: disconnected
TV-2: disconnected

The xorg log:
https://pastebin.mozilla.org/8825681

the dmesg:
https://pastebin.mozilla.org/8825682

The vbios from /sys/kernel/debug/dri/0/ :
http://www.file-upload.net/download-10414782/vbios.rom.html
(also attached to this bug as attachment)

The IRC log with some additional information that are maybe usefull:
https://pastebin.mozilla.org/8825683


Would be nice to get able to use this computer with nouveau and DVI with normal
resolution.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1426261140.6dF1df71.24109
Date: Fri, 13 Mar 2015 15:39:00 +0000
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
   title="NEW - XFX 7300 GS - Black screen with DVI when KMS(nouveau) starts - VGA working"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89571">89571</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>XFX 7300 GS - Black screen with DVI when KMS(nouveau) starts - VGA working
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
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
          <td>blocker
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>bxmixzxm&#64;sharklasers.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=114287" name="attach_114287" title="vbios XFX Nvidia 7300 GS 256MB">attachment 114287</a> <a href="attachment.cgi?id=114287&amp;action=edit" title="vbios XFX Nvidia 7300 GS 256MB">[details]</a></span>
vbios XFX Nvidia 7300 GS 256MB

I already talked in IRC #nouveau before reporting this bug.

Card:
<a href="http://images10.newegg.com/NeweggImage/ProductImageCompressAll300/14-150-410-02.jpg">http://images10.newegg.com/NeweggImage/ProductImageCompressAll300/14-150-410-02.jpg</a>

Problem: Card connected to an 24&quot; 1920x1200 monitor via DVI. Everything is
working fine with windows and DVI at full resolution.
When booting any Linux live, i get a black screen directly when KMS starts.
BIOS post and VESA works fine with DVI.
To get a picture with nouveau, i had to connect the same monitor via VGA cable
to the nvidia card. I get then an 1024x768 resolution.

After boot with VGA i remove the VGA cable and connect DVI to get some logfiles
for debugging.
first:
for p in /sys/class/drm/*/status; do con=${p%/status}; echo -n
&quot;${con#*/card?-}: &quot;; cat $p; done

reports in VGA-mode:
DVI-I-1: disconnected
TV-1: connected
TV-2: disconnected

reports in DVI-mode (no working screen):
DVI-I-1: disconnected
TV-1: disconnected
TV-2: disconnected

The xorg log:
<a href="https://pastebin.mozilla.org/8825681">https://pastebin.mozilla.org/8825681</a>

the dmesg:
<a href="https://pastebin.mozilla.org/8825682">https://pastebin.mozilla.org/8825682</a>

The vbios from /sys/kernel/debug/dri/0/ :
<a href="http://www.file-upload.net/download-10414782/vbios.rom.html">http://www.file-upload.net/download-10414782/vbios.rom.html</a>
(also attached to this bug as attachment)

The IRC log with some additional information that are maybe usefull:
<a href="https://pastebin.mozilla.org/8825683">https://pastebin.mozilla.org/8825683</a>


Would be nice to get able to use this computer with nouveau and DVI with normal
resolution.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1426261140.6dF1df71.24109--

--===============1229170430==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1229170430==--
