From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 86539] [NVAC] Trying to register nv_backlight after
	NV96 did it
Date: Sun, 24 Jan 2016 15:18:09 +0000
Message-ID: <bug-86539-8800-iyglbEZqV1@http.bugs.freedesktop.org/>
References: <bug-86539-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0576179998=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-86539-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0576179998==
Content-Type: multipart/alternative; boundary="14536486891.BBBa01aB.14984";
 charset="UTF-8"


--14536486891.BBBa01aB.14984
Date: Sun, 24 Jan 2016 15:18:09 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=86539

--- Comment #6 from Lukas Wunner <lukas-JFq808J9C/izQB+pC5nmwQ@public.gmane.org> ---
To add to this discussion, radeon has a quirk for the MacBookPro8,1 wherein a
backlight is *not* registered since this machine has a gmux built in. See
radeon_atom_backlight_init  in atombios_encoders.c:

http://cgit.freedesktop.org/~airlied/linux/tree/drivers/gpu/drm/radeon/atombios_encoders.c?h=drm-next#n189

    /* Mac laptops with multiple GPUs use the gmux driver for backlight
     * so don't register a backlight device
     */
    if ((rdev->pdev->subsystem_vendor == PCI_VENDOR_ID_APPLE) &&
        (rdev->pdev->device == 0x6741))
        return;

The code is wrong though in that it tries to recognize gmux by way of the
machine's PCI ID. The MacBookPro8,1 was available with multiple different AMD
GPUs and we'd need to hardcode all of their PCI IDs. Also, the MacBookPro 11,5
has an AMD GPU and we'd need to add its PCI ID as well.

A more sensible solution, as Pierre suggests, is to detect the presence of gmux
and not register a backlight if gmux is found. So basically a quirk specific to
all dual GPU MacBook Pros.

This patch adds a handy function to detect the presence of gmux. Unfortunately
noone has reviewed the series it belongs to so far:
http://lists.freedesktop.org/archives/dri-devel/2016-January/098403.html

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14536486891.BBBa01aB.14984
Date: Sun, 24 Jan 2016 15:18:09 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVAC] Trying to register nv_backlight after NV96 did it"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86539#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVAC] Trying to register nv_backlight after NV96 did it"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86539">bug 86539</a>
              from <span class="vcard"><a class="email" href="mailto:lukas&#64;wunner.de" title="Lukas Wunner &lt;lukas&#64;wunner.de&gt;"> <span class="fn">Lukas Wunner</span></a>
</span></b>
        <pre>To add to this discussion, radeon has a quirk for the MacBookPro8,1 wherein a
backlight is *not* registered since this machine has a gmux built in. See
radeon_atom_backlight_init  in atombios_encoders.c:

<a href="http://cgit.freedesktop.org/~airlied/linux/tree/drivers/gpu/drm/radeon/atombios_encoders.c?h=drm-next#n189">http://cgit.freedesktop.org/~airlied/linux/tree/drivers/gpu/drm/radeon/atombios_encoders.c?h=drm-next#n189</a>

    /* Mac laptops with multiple GPUs use the gmux driver for backlight
     * so don't register a backlight device
     */
    if ((rdev-&gt;pdev-&gt;subsystem_vendor == PCI_VENDOR_ID_APPLE) &amp;&amp;
        (rdev-&gt;pdev-&gt;device == 0x6741))
        return;

The code is wrong though in that it tries to recognize gmux by way of the
machine's PCI ID. The MacBookPro8,1 was available with multiple different AMD
GPUs and we'd need to hardcode all of their PCI IDs. Also, the MacBookPro 11,5
has an AMD GPU and we'd need to add its PCI ID as well.

A more sensible solution, as Pierre suggests, is to detect the presence of gmux
and not register a backlight if gmux is found. So basically a quirk specific to
all dual GPU MacBook Pros.

This patch adds a handy function to detect the presence of gmux. Unfortunately
noone has reviewed the series it belongs to so far:
<a href="http://lists.freedesktop.org/archives/dri-devel/2016-January/098403.html">http://lists.freedesktop.org/archives/dri-devel/2016-January/098403.html</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14536486891.BBBa01aB.14984--

--===============0576179998==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0576179998==--
