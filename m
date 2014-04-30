From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 78092] GK208M [GeForce GT 730M] (rev ff) (prog-if
 ff) nouveau module load fail
Date: Wed, 30 Apr 2014 09:48:53 +0000
Message-ID: <bug-78092-8800-RcncyqsKtC@http.bugs.freedesktop.org/>
References: <bug-78092-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0142396823=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-78092-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0142396823==
Content-Type: multipart/alternative; boundary="1398851332.bd48ACB10.8454"; charset="us-ascii"


--1398851332.bd48ACB10.8454
Date: Wed, 30 Apr 2014 09:48:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=78092

--- Comment #13 from Anton Gubarkov <anton.gubarkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 98227
  --> https://bugs.freedesktop.org/attachment.cgi?id=98227&action=edit
modified nouveau_acpi.c with printk

either I forgot my programming completely, or static int nouveau_dsm_pci_probe
is never called. See my modified nouveau_acpi.c and module load output below.

[13425.965579] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x108100a1
[13425.965581] nouveau  [  DEVICE][0000:01:00.0] Chipset: GK208 (NV108)
[13425.965582] nouveau  [  DEVICE][0000:01:00.0] Family : NVE0
[13425.966804] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
[13425.966811] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[13425.966812] nouveau  [   VBIOS][0000:01:00.0] checking PROM for image...
[13425.966868] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[13425.966869] nouveau  [   VBIOS][0000:01:00.0] checking ACPI for image...
[13425.966870] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[13425.966870] nouveau  [   VBIOS][0000:01:00.0] checking PCIROM for image...
[13425.966871] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[13425.966872] nouveau  [   VBIOS][0000:01:00.0] checking PLATFORM for image...
[13425.966873] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[13425.966874] nouveau E[   VBIOS][0000:01:00.0] unable to locate usable image
[13425.966875] nouveau E[  DEVICE][0000:01:00.0] failed to create 0x10000001,
-22
[13425.966876] nouveau E[     DRM] failed to create 0x80000080, -22
[13425.967122] nouveau: probe of 0000:01:00.0 failed with error -22

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1398851332.bd48ACB10.8454
Date: Wed, 30 Apr 2014 09:48:52 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - GK208M [GeForce GT 730M] (rev ff) (prog-if ff) nouveau module load fail"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78092#c13">Comment # 13</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - GK208M [GeForce GT 730M] (rev ff) (prog-if ff) nouveau module load fail"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78092">bug 78092</a>
              from <span class="vcard"><a class="email" href="mailto:anton.gubarkov&#64;gmail.com" title="Anton Gubarkov &lt;anton.gubarkov&#64;gmail.com&gt;"> <span class="fn">Anton Gubarkov</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=98227" name="attach_98227" title="modified nouveau_acpi.c with printk">attachment 98227</a> <a href="attachment.cgi?id=98227&amp;action=edit" title="modified nouveau_acpi.c with printk">[details]</a></span>
modified nouveau_acpi.c with printk

either I forgot my programming completely, or static int nouveau_dsm_pci_probe
is never called. See my modified nouveau_acpi.c and module load output below.

[13425.965579] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x108100a1
[13425.965581] nouveau  [  DEVICE][0000:01:00.0] Chipset: GK208 (NV108)
[13425.965582] nouveau  [  DEVICE][0000:01:00.0] Family : NVE0
[13425.966804] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
[13425.966811] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[13425.966812] nouveau  [   VBIOS][0000:01:00.0] checking PROM for image...
[13425.966868] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[13425.966869] nouveau  [   VBIOS][0000:01:00.0] checking ACPI for image...
[13425.966870] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[13425.966870] nouveau  [   VBIOS][0000:01:00.0] checking PCIROM for image...
[13425.966871] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[13425.966872] nouveau  [   VBIOS][0000:01:00.0] checking PLATFORM for image...
[13425.966873] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[13425.966874] nouveau E[   VBIOS][0000:01:00.0] unable to locate usable image
[13425.966875] nouveau E[  DEVICE][0000:01:00.0] failed to create 0x10000001,
-22
[13425.966876] nouveau E[     DRM] failed to create 0x80000080, -22
[13425.967122] nouveau: probe of 0000:01:00.0 failed with error -22</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1398851332.bd48ACB10.8454--

--===============0142396823==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0142396823==--
