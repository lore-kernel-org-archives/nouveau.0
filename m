From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93932] New: Xorg/Nouveau crashes with Segmentation
 fault when setting i7-Skylake iGPU as primary grapics device in BIOS
Date: Sat, 30 Jan 2016 01:35:31 +0000
Message-ID: <bug-93932-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1160656352=="
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


--===============1160656352==
Content-Type: multipart/alternative; boundary="14541177310.73b6.22632";
 charset="UTF-8"


--14541177310.73b6.22632
Date: Sat, 30 Jan 2016 01:35:31 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=93932

            Bug ID: 93932
           Summary: Xorg/Nouveau crashes with Segmentation fault when
                    setting i7-Skylake iGPU as primary grapics device in
                    BIOS
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: m.prechtl97-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 121404
  --> https://bugs.freedesktop.org/attachment.cgi?id=121404&action=edit
Apport crash dump

Xorg/Nouveau crashes with Segmentation fault when setting i7-Skylake iGPU as
primary grapics device in BIOS

Hardware:
CPU: i7-6700k (Intel HD Graphics 530)
MB: Asus H110M2 D3
GPU: NVIDIA GeForce GTX 750ti

How to reproduce:
- Install fresh Ubuntu Gnome 15.10 (Side note, graphic issues with standard
drivers, goes away with NVIDIA drivers so no big problem there)
- Install Kernel 4.3.4
- Install Intel drivers / compile and install latest Intel drivers
- Reboot
- iGPU isn't recognized as VGA compatible card
- Reboot and set primary graphics device to 'CPU Graphics' in BIOS
--> iGPU now is recognized
--> Xorg lives for approx. 1-2 seconds and then crashes

Xorg Version: X.Org X Server 1.17.2

Excerpt from error log:

[     9.322] (EE) 
[     9.322] (EE) Backtrace:
[     9.322] (EE) 0: /usr/bin/X (xorg_backtrace+0x4e) [0x56165770c68e]
[     9.322] (EE) 1: /usr/bin/X (0x561657558000+0x1b89f9) [0x5616577109f9]
[     9.323] (EE) 2: /lib/x86_64-linux-gnu/libc.so.6 (0x7f40fc83e000+0x352f0)
[0x7f40fc8732f0]
[     9.323] (EE) 3: /usr/lib/xorg/modules/drivers/nouveau_drv.so
(0x7f40f87bd000+0xd74f) [0x7f40f87ca74f]
[     9.323] (EE) 4: /usr/bin/X (PixmapShareToSlave+0x8e) [0x5616575cc94e]
[     9.323] (EE) 5: /usr/bin/X (RRCrtcSet+0x670) [0x561657671870]
[     9.323] (EE) 6: /usr/bin/X (ProcRRSetCrtcConfig+0x38b) [0x56165767289b]
[     9.323] (EE) 7: /usr/bin/X (0x561657558000+0x5818f) [0x5616575b018f]
[     9.323] (EE) 8: /usr/bin/X (0x561657558000+0x5c34b) [0x5616575b434b]
[     9.323] (EE) 9: /lib/x86_64-linux-gnu/libc.so.6 (__libc_start_main+0xf0)
[0x7f40fc85ea40]
[     9.323] (EE) 10: /usr/bin/X (_start+0x29) [0x56165759e6c9]
[     9.323] (EE) 
[     9.323] (EE) Segmentation fault at address 0x8
[     9.323] (EE) 
Fatal server error:
[     9.323] (EE) Caught signal 11 (Segmentation fault). Server aborting
[     9.323] (EE) 
[     9.323] (EE)

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14541177310.73b6.22632
Date: Sat, 30 Jan 2016 01:35:31 +0000
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
   title="NEW - Xorg/Nouveau crashes with Segmentation fault when setting i7-Skylake iGPU as primary grapics device in BIOS"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93932">93932</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Xorg/Nouveau crashes with Segmentation fault when setting i7-Skylake iGPU as primary grapics device in BIOS
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
          <td>m.prechtl97&#64;googlemail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=121404" name="attach_121404" title="Apport crash dump">attachment 121404</a> <a href="attachment.cgi?id=121404&amp;action=edit" title="Apport crash dump">[details]</a></span>
Apport crash dump

Xorg/Nouveau crashes with Segmentation fault when setting i7-Skylake iGPU as
primary grapics device in BIOS

Hardware:
CPU: i7-6700k (Intel HD Graphics 530)
MB: Asus H110M2 D3
GPU: NVIDIA GeForce GTX 750ti

How to reproduce:
- Install fresh Ubuntu Gnome 15.10 (Side note, graphic issues with standard
drivers, goes away with NVIDIA drivers so no big problem there)
- Install Kernel 4.3.4
- Install Intel drivers / compile and install latest Intel drivers
- Reboot
- iGPU isn't recognized as VGA compatible card
- Reboot and set primary graphics device to 'CPU Graphics' in BIOS
--&gt; iGPU now is recognized
--&gt; Xorg lives for approx. 1-2 seconds and then crashes

Xorg Version: X.Org X Server 1.17.2

Excerpt from error log:

[     9.322] (EE) 
[     9.322] (EE) Backtrace:
[     9.322] (EE) 0: /usr/bin/X (xorg_backtrace+0x4e) [0x56165770c68e]
[     9.322] (EE) 1: /usr/bin/X (0x561657558000+0x1b89f9) [0x5616577109f9]
[     9.323] (EE) 2: /lib/x86_64-linux-gnu/libc.so.6 (0x7f40fc83e000+0x352f0)
[0x7f40fc8732f0]
[     9.323] (EE) 3: /usr/lib/xorg/modules/drivers/nouveau_drv.so
(0x7f40f87bd000+0xd74f) [0x7f40f87ca74f]
[     9.323] (EE) 4: /usr/bin/X (PixmapShareToSlave+0x8e) [0x5616575cc94e]
[     9.323] (EE) 5: /usr/bin/X (RRCrtcSet+0x670) [0x561657671870]
[     9.323] (EE) 6: /usr/bin/X (ProcRRSetCrtcConfig+0x38b) [0x56165767289b]
[     9.323] (EE) 7: /usr/bin/X (0x561657558000+0x5818f) [0x5616575b018f]
[     9.323] (EE) 8: /usr/bin/X (0x561657558000+0x5c34b) [0x5616575b434b]
[     9.323] (EE) 9: /lib/x86_64-linux-gnu/libc.so.6 (__libc_start_main+0xf0)
[0x7f40fc85ea40]
[     9.323] (EE) 10: /usr/bin/X (_start+0x29) [0x56165759e6c9]
[     9.323] (EE) 
[     9.323] (EE) Segmentation fault at address 0x8
[     9.323] (EE) 
Fatal server error:
[     9.323] (EE) Caught signal 11 (Segmentation fault). Server aborting
[     9.323] (EE) 
[     9.323] (EE)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14541177310.73b6.22632--

--===============1160656352==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1160656352==--
