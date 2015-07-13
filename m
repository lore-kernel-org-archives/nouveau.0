From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91319] New: Nouveau driver cannot extract FCODE ROM
 / DCB Block from OpenFirmware Device tree
Date: Mon, 13 Jul 2015 00:34:05 +0000
Message-ID: <bug-91319-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0121753355=="
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


--===============0121753355==
Content-Type: multipart/alternative; boundary="1436747645.25e0Bd2B1.18449"; charset="UTF-8"


--1436747645.25e0Bd2B1.18449
Date: Mon, 13 Jul 2015 00:34:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91319

            Bug ID: 91319
           Summary: Nouveau driver cannot extract FCODE ROM / DCB Block
                    from OpenFirmware Device tree
           Product: xorg
           Version: unspecified
          Hardware: PowerPC
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: psaisanas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 117079
  --> https://bugs.freedesktop.org/attachment.cgi?id=117079&action=edit
kernel dmesg log & NVDA,BMP FCODE ROM

Hi,

When running a Powermac 11.2, (G5 Quad - powerpc64) with a Quadro FX4500
(NV47), previous kernels had no issue extracting the FCODE ROM / DCB block via
the OpenFirmware device tree.
Last vanilla kernel that i have compiled that seemed to work fine was kernel
3.18.16.
Normally, it will find the "BIT SIGNATURE" via OpenFirmware method.

However, when compiling a newer vanilla kernel 4.1.2, nouveau seems to have an
issue reading the FCODE ROM / DCB block / from the OpenFirmware device tree.
Also, interestingly, this time around it attempts to use the PROM method and
attempts to find the "BIT SIGNATURE" via this method.
Apparently it found a signature, but looks like garbage and seems like it cant
extract the DCB BLOCK.

As instructed, i have attached a dmesg.log along with a dump of the NVDA,BMP
image out of the following folder:
/sys/firmware/devicetree/base/pci@0,f0000000/NVDA,Parent@0/.

Not sure if this is correct, but i have passed the following nouveau module
options as i understood:

options nouveau config="NvMSI=0,debug=debug,VBIOS=trace"

I have placed the kernel dmesg log along with the NVDA,BMP dump in the attached
nouveau_powerpc64_pmac11.2.tar.xz archive.

Please let me know if there is any more info required.

Thanks for your help!

Best Regards,
Peter

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1436747645.25e0Bd2B1.18449
Date: Mon, 13 Jul 2015 00:34:05 +0000
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
   title="NEW - Nouveau driver cannot extract FCODE ROM / DCB Block from OpenFirmware Device tree"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91319">91319</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Nouveau driver cannot extract FCODE ROM / DCB Block from OpenFirmware Device tree
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
          <td>PowerPC
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
          <td>psaisanas&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=117079" name="attach_117079" title="kernel dmesg log &amp; NVDA,BMP FCODE ROM">attachment 117079</a> <a href="attachment.cgi?id=117079&amp;action=edit" title="kernel dmesg log &amp; NVDA,BMP FCODE ROM">[details]</a></span>
kernel dmesg log &amp; NVDA,BMP FCODE ROM

Hi,

When running a Powermac 11.2, (G5 Quad - powerpc64) with a Quadro FX4500
(NV47), previous kernels had no issue extracting the FCODE ROM / DCB block via
the OpenFirmware device tree.
Last vanilla kernel that i have compiled that seemed to work fine was kernel
3.18.16.
Normally, it will find the &quot;BIT SIGNATURE&quot; via OpenFirmware method.

However, when compiling a newer vanilla kernel 4.1.2, nouveau seems to have an
issue reading the FCODE ROM / DCB block / from the OpenFirmware device tree.
Also, interestingly, this time around it attempts to use the PROM method and
attempts to find the &quot;BIT SIGNATURE&quot; via this method.
Apparently it found a signature, but looks like garbage and seems like it cant
extract the DCB BLOCK.

As instructed, i have attached a dmesg.log along with a dump of the NVDA,BMP
image out of the following folder:
/sys/firmware/devicetree/base/pci&#64;0,f0000000/NVDA,Parent&#64;0/.

Not sure if this is correct, but i have passed the following nouveau module
options as i understood:

options nouveau config=&quot;NvMSI=0,debug=debug,VBIOS=trace&quot;

I have placed the kernel dmesg log along with the NVDA,BMP dump in the attached
nouveau_powerpc64_pmac11.2.tar.xz archive.

Please let me know if there is any more info required.

Thanks for your help!

Best Regards,
Peter</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1436747645.25e0Bd2B1.18449--

--===============0121753355==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0121753355==--
