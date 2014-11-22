From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 86566] New: [NV96] nouveau_pmops_suspend returns -16
Date: Sat, 22 Nov 2014 10:50:11 +0000
Message-ID: <bug-86566-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0789361003=="
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


--===============0789361003==
Content-Type: multipart/alternative; boundary="1416653411.43078A31.13861"; charset="UTF-8"


--1416653411.43078A31.13861
Date: Sat, 22 Nov 2014 10:50:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=86566

            Bug ID: 86566
           Summary: [NV96] nouveau_pmops_suspend returns -16
           Product: xorg
           Version: git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: pierre.morrow-GANU6spQydw@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 109842
  --> https://bugs.freedesktop.org/attachment.cgi?id=109842&action=edit
dmesg with noaccel=1 config=NvForcePost=1

Hardware:
* 9600M GT (NV96)
* 9400M (NVAC)

Tested on
http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=8c83f75747abb996509d01d30104fe820eae9d67

The NV96 card fails to suspend, with nouveau_pmops_suspend returning -16.
PDISPLAY.CHANNEL[0].STAT (0x610200) value is not the one expected after the
channel deactivation (see nv50_disp_core_fini in core/engine/disp/nv50.c).

I compared mmiotraces from Nouveau and the blob. 0x610200 default values differ
greatly - for Nouveau: 0x0d050029, for Nvidia: 0x48000008 - if
config=NvForcePost=1 isn't given (the blob is running it by default, not
Nouveau); adding ForcePost doesn't help. There are some differences in SOR and
PIOR caps but getting them to match the blob ones doesn't help.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1416653411.43078A31.13861
Date: Sat, 22 Nov 2014 10:50:11 +0000
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
   title="NEW - [NV96] nouveau_pmops_suspend returns -16"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86566">86566</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NV96] nouveau_pmops_suspend returns -16
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>git
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
          <td>pierre.morrow&#64;free.fr
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=109842" name="attach_109842" title="dmesg with noaccel=1 config=NvForcePost=1">attachment 109842</a> <a href="attachment.cgi?id=109842&amp;action=edit" title="dmesg with noaccel=1 config=NvForcePost=1">[details]</a></span>
dmesg with noaccel=1 config=NvForcePost=1

Hardware:
* 9600M GT (NV96)
* 9400M (NVAC)

Tested on
<a href="http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=8c83f75747abb996509d01d30104fe820eae9d67">http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=8c83f75747abb996509d01d30104fe820eae9d67</a>

The NV96 card fails to suspend, with nouveau_pmops_suspend returning -16.
PDISPLAY.CHANNEL[0].STAT (0x610200) value is not the one expected after the
channel deactivation (see nv50_disp_core_fini in core/engine/disp/nv50.c).

I compared mmiotraces from Nouveau and the blob. 0x610200 default values differ
greatly - for Nouveau: 0x0d050029, for Nvidia: 0x48000008 - if
config=NvForcePost=1 isn't given (the blob is running it by default, not
Nouveau); adding ForcePost doesn't help. There are some differences in SOR and
PIOR caps but getting them to match the blob ones doesn't help.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1416653411.43078A31.13861--

--===============0789361003==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0789361003==--
